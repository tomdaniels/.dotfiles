local closure = require("tdtele.utils").closure

local M = {}

local function rename_file(client)
  local old_path = vim.api.nvim_buf_get_name(0)
  local new_path = vim.fn.input("New file name: ", old_path)

  if new_path == "" or new_path == old_path then
    print("File rename cancelled")
    return
  end

  local old_uri = vim.uri_from_fname(old_path)
  local new_uri = vim.uri_from_fname(new_path)

  vim.cmd("write")

  client:request("workspace/executeCommand", {
    command = "_typescript.applyRenameFile",
    arguments = {
      { sourceUri = old_uri, targetUri = new_uri },
    },
  }, function(err)
    if err then
      print("Error renaming file in TypeScript server:", vim.inspect(err))
      return
    end

    vim.defer_fn(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) then
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name and buf_name ~= "" then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd("silent! write")
            end)
          end
        end
      end

      local new_dir = vim.fn.fnamemodify(new_path, ":h")
      if vim.fn.isdirectory(new_dir) == 0 then
        vim.fn.mkdir(new_dir, "p")
      end

      local success = vim.loop.fs_rename(old_path, new_path)
      if not success then
        print("Error: Failed to rename file in filesystem")
        return
      end

      vim.cmd("edit " .. vim.fn.fnameescape(new_path))
      print("File renamed successfully")
    end, 300)
  end)
end

--- @param action string
local function code_action(action)
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { action },
      diagnostics = {},
    },
  })
end

--- @param args table LspAttach autocmd args
M.on_attach = function(args)
  local bufnr = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP | " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("[d", closure(vim.diagnostic.jump, { count = -1 }), "Go to previous diagnostic message")
  nmap("]d", closure(vim.diagnostic.jump, { count = 1 }, "Go to next diagnostic message"))
  nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
  nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

  nmap("<leader>tf", closure(code_action, "source.fixAll"), "[T]ypescript: Auto-[F]ix all")
  nmap("<leader>ti", closure(code_action, "source.addMissingImports"), "[T]ypescript: Add missing [I]mports")
  nmap("<leader>tu", closure(code_action, "source.removeUnusedImports"), "[T]ypescript: Remove [U]nused Imports")
  nmap("<leader>ts", closure(code_action, "source.organiseImports"), "[T]ypescript: [S]ort/organise Imports")
  nmap("<leader>tr", closure(rename_file, client), "[T]ypescript: [R]ename File")
  nmap("<leader>tR", "<cmd>LspRestart<CR>", "[T]ypescript: [R]estart Server")
end

return M

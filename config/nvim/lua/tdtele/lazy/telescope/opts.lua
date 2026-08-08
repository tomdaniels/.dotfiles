local function filenameFirst(_, path)
  local tail = require("telescope.utils").path_tail(path)

  -- Get the parent path (relative to the current directory)
  local parent = vim.fn.fnamemodify(path, ":.:h")
  if parent == "." then
    return tail
  end

  -- Split the parent path into components
  local components = {}
  for part in string.gmatch(parent, "[^/]+") do
    table.insert(components, part)
  end

  -- Truncate all but the last directory, except those starting with a capital letter
  for i = 1, #components - 1 do
    if not string.match(components[i], "^[A-Z]") then
      components[i] = string.sub(components[i], 1, 1) -- Truncate to the first character
    end
  end

  -- Reconstruct the parent path
  local truncated_parent = table.concat(components, "/")

  -- Format and return the result
  return string.format("%s\t\t%s", tail, truncated_parent)
end

-- Returned as a function (not a table) so the require("telescope.themes") call
-- below is deferred until telescope is actually loaded, not evaluated eagerly
-- when lazy.nvim first collects this spec (before telescope exists on disk).
return function()
  return {
    pickers = {
      find_files = {
        path_display = filenameFirst,
      },
      lsp_references = {
        layout_strategy = "vertical",
        fname_width = 60,
        path_display = filenameFirst,
        initial_mode = "normal",
      },
    },
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "❯ ",
      layout_config = {
        horizontal = {
          preview_width = 0.6,
          results_width = 0.4,
        },
        width = 0.90,
        preview_cutoff = 0,
      },
      prompt_title = false,
      results_title = false,
      path_display = { "truncate" },
      file_ignore_patterns = { "node_modules", ".git/" },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          winblend = 10,
        }),
      },
    },
  }
end

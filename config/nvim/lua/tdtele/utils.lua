local M = {}
M.closure = function(fn, ...)
  local args = { ... }
  return function()
    return fn(table.unpack(args))
  end
end
return M

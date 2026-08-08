local M = {}
M.closure = function(fn, ...)
  local args = { ... }
  return function()
    return fn(unpack(args))
  end
end
return M

local M = {}
local editors = {
  "nvim",
}

M.is_windows = package.config:sub(1, 1) == "\\"

M.basename = function(path) -- get filename from path
  if type(path) ~= "string" then
    return nil
  end
  if M.is_windows then
    return path:gsub("(.*[/\\])(.*)", "%2") -- replace (path/ or path\)(file) with (file)
  else
    return path:gsub("(.*/)(.*)", "%2")
  end -- replace (path/)(file)          with (file)
end

M.is_an_editor = function(name)
  if type(name) ~= "string" then
    return nil
  end
  for _, editor in pairs(editors) do
    if name == editor then
      return true
    end
    if name == editor .. ".exe" then
      return true
    end
  end
  return false
end

return M

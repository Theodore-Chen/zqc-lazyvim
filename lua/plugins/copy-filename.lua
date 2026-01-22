-- 快速复制文件名和路径（用于交流）

local function copy_to_clipboard(text)
  -- 尝试使用 Neovim 剪贴板
  if vim.fn.setreg("+", text) == 0 then
    vim.notify("Copied: " .. text, vim.log.levels.INFO)
  else
    -- 降级到 osc52
    local ok, osc52 = pcall(require, "osc52")
    if ok then
      osc52.copy(text)
      vim.notify("Copied (OSC52): " .. text, vim.log.levels.INFO)
    else
      vim.notify("Failed to copy: " .. text, vim.log.levels.ERROR)
    end
  end
end

-- 获取相对于项目根目录的路径
local function get_relative_path()
  local full_path = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()

  -- 尝试找到 git 根目录
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]

  if git_root and git_root ~= "" then
    -- 使用 git 根目录作为基准
    if vim.startswith(full_path, git_root) then
      return full_path:sub(#git_root + 2)
    end
  end

  -- 如果没有 git 或文件不在 git 目录中，使用当前工作目录
  if vim.startswith(full_path, cwd) then
    return full_path:sub(#cwd + 2)
  end

  -- 最后返回完整路径
  return full_path
end

-- 使用 vim.keymap.set 直接设置快捷键，避免 lazy.nvim 插件规范问题
vim.keymap.set("n", "<leader>yf", function()
  local filename = vim.fn.expand("%:t")
  copy_to_clipboard(filename)
end, { desc = "Copy Filename" })

vim.keymap.set("n", "<leader>yF", function()
  local relative_path = get_relative_path()
  copy_to_clipboard(relative_path)
end, { desc = "Copy Relative Path" })

vim.keymap.set("n", "<leader>yp", function()
  local full_path = vim.fn.expand("%:p")
  copy_to_clipboard(full_path)
end, { desc = "Copy Full Path" })

vim.keymap.set("n", "<leader>yi", function()
  local filename = vim.fn.expand("%:t")
  local relative_path = get_relative_path()
  local full_path = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local info = string.format(
    "File: %s\nPath: %s\nFull: %s\nLine: %d",
    filename,
    relative_path,
    full_path,
    line
  )
  vim.notify(info, vim.log.levels.INFO, { title = "File Info" })
end, { desc = "File Info" })

return {}

-- ~/.config/nvim/lua/plugins/osc52.lua

return {
  -- 这是一个“虚拟”插件配置，专门用于设置剪贴板。
  -- 我们使用 'VeryLazy' 事件，确保它在启动后加载，不会影响启动时间。
  event = "VeryLazy",
  config = function()
    -- 核心逻辑：仅在检测到 SSH 连接时才覆盖剪贴板设置。
    -- 在本地 WSL 环境下, vim.env.SSH_CONNECTION 为 nil, 这段代码不会执行，
    -- Neovim 会继续使用默认的剪贴板提供者 (即你配置的 win32yank.exe)。
    if vim.env.SSH_CONNECTION then
      -- 检查远程服务器上是否有 base64 工具
      if vim.fn.executable("base64") == 0 then
        vim.notify("OSC52: `base64` command not found. Clipboard integration disabled.", vim.log.levels.WARN)
        return
      end

      -- 定义复制函数
      local function copy(lines, _)
        local body = table.concat(lines, "\n")
        -- 使用 base64 编码，-w0 确保输出在一行内，这至关重要
        local encoded = vim.fn.system({ "base64", "-w0" }, body)
        -- 发送 OSC 52 转义序列
        vim.fn.printf("\x1b]52;c;%s\x07", encoded)
      end

      -- 定义粘贴函数 (通常依赖终端自己的粘贴功能)
      local function paste()
        -- OSC 52 粘贴支持不佳, 这里我们依赖 Neovim 的标准行为，
        -- 它会向终端请求剪贴板内容，而现代终端都支持这个请求。
        return vim.fn.split(vim.fn.getreg("+"), "\n")
      end

      -- 设置 Neovim 的剪贴板提供者
      vim.g.clipboard = {
        name = "osc52-ssh",
        copy = {
          ["+"] = copy,
          ["*"] = copy,
        },
        paste = {
          ["+"] = paste,
          ["*"] = paste,
        },
        cache_enabled = 0, -- 对于外部命令，禁用缓存更可靠
      }

      vim.notify("SSH session detected. OSC52 clipboard enabled.", vim.log.levels.INFO)
    end
  end,
}

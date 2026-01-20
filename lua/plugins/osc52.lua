-- ~/.config/nvim/lua/plugins/osc52.lua

return {
    "ojroques/nvim-osc52",
    init = function()
        -- 仅在 SSH 环境中执行
        if vim.env.SSH_CONNECTION then
            -- 检查 base64 工具
            if vim.fn.executable("base64") == 0 then
                vim.notify("OSC52: `base64` command not found. Clipboard integration disabled.", vim.log.levels.WARN)
                return
            end

            local osc52 = require("osc52")
            if not osc52 then
                vim.notify("OSC52: Could not load nvim-osc52 plugin.", vim.log.levels.ERROR)
                return
            end

            -- 定义一个包装函数来适配 Neovim 的 clipboard API
            local function copy_wrapper(lines, _)
                -- Neovim 传入的是一个 table of lines, 我们需要将其合并成一个由换行符分隔的字符串。
                -- 这正是错误发生的原因，我们现在在这里修正它。
                local text_to_copy = table.concat(lines, "\n")

                -- 然后，将这个合并好的字符串传递给插件的内部 copy 函数。
                osc52.copy(text_to_copy)
            end

            -- 强制 Neovim 使用我们包装过的函数
            vim.g.clipboard = {
                name = "osc52-wrapper", -- 换个名字以示区分
                copy = {
                    ["+"] = copy_wrapper,
                    ["*"] = copy_wrapper,
                },
                paste = {
                    ["+"] = osc52.paste, -- 粘贴函数通常可以直接使用
                    ["*"] = osc52.paste,
                },
            }
            vim.notify("SSH session detected. Custom OSC52 clipboard provider enforced.", vim.log.levels.INFO)
        end
    end,
    opts = {
        max_length = 0,
    },
}

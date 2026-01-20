-- ~/.config/nvim/lua/plugins/lualine.lua

return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufEnter", "UIEnter" },
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            })

            -- 替换第4个组件（pretty_path）为显示完整路径
            opts.sections.lualine_c[4] = {
                function()
                    local file = vim.fn.expand("%:p")
                    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
                    if git_root and vim.startswith(file, git_root) then
                        return file:sub(#git_root + 2)
                    end
                    return vim.fn.fnamemodify(file, ":~")
                end,
            }

            return opts
        end,
    },
}

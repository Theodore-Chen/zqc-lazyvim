-- ~/.config/nvim/lua/plugins/lualine.lua

return {
    {
        "nvim-lualine/lualine.nvim",
        event = { "BufEnter", "UIEnter" },
        opts = function(_, opts)
            -- 添加表情符号到状态栏
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            })

            -- 修改文件名显示：显示相对路径，缩短阈值为 180
            for _, component in ipairs(opts.sections.lualine_c) do
                if type(component) == "table" and component[1] == "filename" then
                    component.path = 4
                    component.shorting_target = 180
                    break
                end
            end

            return opts
        end,
    },
}

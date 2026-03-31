
---@class anrcy.Config
---@field global_after? fun(data: string[])
---@field progress_animation? string
---@field custom_animations? anrcy.Animation[]
local M = {
    global_after = nil,
    animation = "default",
    animations = {
        none = {
            delta_time_ms = 600,
            frames = { "" }
        },
        default = {
            delta_time_ms = 600,
            frames = {
                "ᓚᘏᗢ zzz",
                "ᓚᘏᗢ Zzz",
                "ᓚᘏᗢ ZZz",
                "ᓚᘏᗢ ZZZ",
                "ᓚᘏᗢ zZZ",
                "ᓚᘏᗢ zzZ",
            }
        },
    }
}

--- Merge custom config with default config
---@param opts anrcy.Config -- custom config
---
function M.setup(opts)
    local merged = vim.tbl_deep_extend("force", M, opts or {})

    for k,v in pairs(merged) do
        M[k] = v
    end
end

return M

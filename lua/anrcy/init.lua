
require("anrcy.commands")
local config = require("anrcy.config")

---@class anrcy
local M = {}


--- Setup the application with the provided options
---
function M.setup(opts)
    config.setup(opts)
end


--- Entry point function for running jobs from a provided list
---@param jobs? anrcy.Job[]
---
function M.run_jobs(jobs)
    if(jobs == nil) then
        vim.notify("Job list is nil", vim.log.levels.ERROR)
        return
    end

    require("anrcy.history_manager").archive(jobs)
    require("anrcy.job_handler").async(jobs, function(responses)
        require("anrcy.ui").show(responses)
    end)
end


return M

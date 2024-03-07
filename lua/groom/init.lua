M = {}
M.setup = function(opts)
    M.opts = opts or {
        command = "groom --simple"
    }
end
local ensure_groom = function()
    local groom_exists = vim.fn.executable("groom")
    if groom_exists == 0 then
        vim.api.nvim_err_writeln("groom executable not found on PATH.")
        return
    elseif groom_exists == -1 then
        vim.api.nvim_err_writeln("can't find executable!")
        return
    end
end

local select_tasks = function(tasks)
    vim.ui.select(tasks, {
        prompt = "Select groom command: ",
    }, function(choice)
        local old = vim.o.makeprg
        vim.o.makeprg = "groom"
        vim.cmd { cmd = "make", args = { choice } }
        vim.o.makeprg = old
    end)
end

local getChoices = function()
    local output = vim.fn.systemlist("groom --simple")
    if vim.v.shell_error == 1 then
        return nil
    end
    return output
end


M.run = function()
    ensure_groom()
    local tasks = getChoices()
    if tasks == nil then
        vim.api.nvim_err_writeln("groom exited with error")
    else
        select_tasks(tasks)
    end
end
return M

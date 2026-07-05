local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == "fff.nvim" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("fff.nvim")
      end

      require("fff.download").download_or_build_binary()
    end
  end,
})

vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })

vim.g.fff = {
  lazy_sync = true,
}

vim.opt.backupcopy = "yes"
vim.opt.diffopt:append("iwhite")
vim.opt.foldenable = false
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.undofile = true
vim.opt.wildmode = { "longest", "list", "full" }
vim.opt.listchars = {
  nbsp = "¬",
  tab = "»·",
  trail = "·",
  extends = ">",
}

vim.keymap.set("n", "ff", function()
  require("fff").find_files()
end, { desc = "FFFind files" })

vim.keymap.set("n", "fg", function()
  require("fff").live_grep()
end, { desc = "LiFFFe grep" })

vim.keymap.set("", "<F8>", "<Cmd>setlocal spell! spelllang=en_gb<CR>", { desc = "Toggle British spellcheck" })
vim.keymap.set("n", "<F5>", [[:%s/\s\+$//<CR>]], { silent = true, desc = "Trim trailing whitespace" })

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "javascript", "vue", "yaml" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  pattern = "*.jsonnet",
  callback = function()
    vim.opt_local.expandtab = true
  end,
})

local function format_json_buffer()
  if vim.bo.readonly or not vim.bo.modifiable then
    return
  end

  local input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
  if input == "" then
    return
  end

  local cmd = vim.fn.executable("jq") == 1 and { "jq", "." } or { "python3", "-m", "json.tool" }
  local result = vim.system(cmd, { stdin = input, text = true }):wait()

  if result.code ~= 0 then
    local message = vim.trim(result.stderr or "JSON formatting failed")
    vim.notify(message, vim.log.levels.WARN, { title = "JSON format on save" })
    return
  end

  local view = vim.fn.winsaveview()
  local output = result.stdout:gsub("\n$", "")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n", { plain = true }))
  vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*.json",
  callback = format_json_buffer,
})

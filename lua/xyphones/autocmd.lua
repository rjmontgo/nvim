local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert") -- start terminal in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber") -- disable line numbers
api.nvim_command("autocmd TermOpen * setlocal signcolumn=no") --disable signcolumn

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")


vim.api.nvim_create_user_command("GitLink", function ()
end, {})

vim.api.nvim_create_user_command("TodoCapture", function ()
  local buf = vim.api.nvim_create_buf(false, true)

  local ui = vim.api.nvim_list_uis()[1] -- grab the current ui
  local win_dim = {
    height = 1,
    width = 50,
    row = ui.height/2 - 1, --total width - half the window width (technically this will sit a little higher
    col = ui.width/2 - 50/2 -- total width minus half the window width
  }

  local opts = {
    relative = 'editor',
    width = win_dim.width,
    height = win_dim.height,
    row = win_dim.row,
    col = win_dim.col,
    border = 'single',
    anchor = 'NW',
    title = 'todo.txt',
    title_pos = 'center'
  };

  local win = vim.api.nvim_open_win(buf, true, opts)
  local win_opts = {
    number = false,
    signcolumn = "no",
    relativenumber = false,
  }
  for name, value in pairs(win_opts) do
    vim.wo[win][name] = value
  end

  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>A", true, false, true), "ni", true)
end, {})


vim.api.nvim_create_user_command("Bsqlrun", function ()
  vim.cmd[[
    " check if bufexists, 1=true, 0=false
    let maybebuf = bufexists("*output*")
    if maybebuf == 1 
      bdelete \*output\* 
    endif 

    new
    " make this a scratch buffer :h special-buffers
    setlocal buftype=nofile 
    setlocal bufhidden=hide
    setlocal noswapfile

    " set default tab behavior
    setlocal noexpandtab
    setlocal tabstop=8
    setlocal shiftwidth=8

    file *output* 
    read !bsql ~/dev/bluecrew/org/read_companies.sql
    silent %!column -ts $'\t'

  ]]
end, {})



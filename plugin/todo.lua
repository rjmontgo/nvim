local set = vim.keymap.set

vim.g.xy_win_id = nil

set("n", "<leader>t", function()
  if (vim.g.xy_win_id and vim.api.nvim_win_is_valid(vim.g.xy_win_id)) then
    vim.api.nvim_win_close(vim.g.xy_win_id, true)
    vim.g.xy_win_id = nil
    return
  end

  local todo_height = 30
  local todo_width = 160
  local editor_height = vim.o.lines
  local editor_width = vim.o.columns

  local bufnr = vim.api.nvim_create_buf(false, true)
  local git_dir_path = vim.fn.finddir(".git", ".;") .. "/../todo.md"

  vim.g.xy_win_id = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    row = (editor_height / 2) - (todo_height / 1.75),
    col = (editor_width / 2) - (todo_width / 2),
    width = todo_width,
    height = todo_height,
    title = "todo",
    title_pos = "center",
    border = "rounded"
  })

  vim.cmd('edit ' .. git_dir_path)
end)

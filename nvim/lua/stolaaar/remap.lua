vim.g.mapleader = " "

-- Unbind arrow keys, until I learn hjkl
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- Unbind arrow keys, until I learn hjkl
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

-- Unbind ESC key, until I learn C-c
vim.keymap.set("i", "<Esc>", "<nop>")

-- Reload all buffers at once
vim.keymap.set("n", "<leader>ra", function()
  vim.cmd("bufdo e")
  print("Reloaded all buffers")
end)
vim.keymap.set("n", "<leader>rf", function()
  vim.cmd("bufdo e")
  print("! Reloaded all buffers")
end)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>po", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.cmd [[ command! Paste execute 'read !xsel -b' ]]

vim.keymap.set({ "n", "v" }, "<leader>P", [["+p]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
  local currentFileName = vim.fn.expand("%:t")

  if currentFileName:sub(-3) == ".py" then
    vim.cmd.write()
		local cwd = vim.fn.getcwd()
		local filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
		vim.fn.jobstart({ 'black', filename },
			{ cwd = cwd, on_exit = function() vim.cmd.edit(filename) end })
    print("Formatted using black")
  end

  if currentFileName:sub(-4) == ".vue" then
    vim.cmd("EslintFixAll")
  end

  if currentFileName:sub(-4) == ".ts" or currentFileName:sub(-4) == ".tsx" or currentFileName:sub(-4) == ".vue" then
  vim.cmd("EslintFixAll")
end
end
)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/stolaar/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bdd", "<cmd>:bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bda", "<cmd>:%bd|e#|bd#<cr>", { desc = "Delete All Buffers But This One" })

vim.keymap.set("n", "<C-Y>", "<cmd>Neotree toggle right<cr>")
vim.keymap.set("n", "<leader>rv", "<cmd>Neotree reveal right<cr>", {desc = "Reveal the active file in the tree"})

vim.keymap.set("n", "<C-g>", "<cmd>Telescope git_file_history<cr>", {desc = "Get file changes"})

vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>")

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

vim.keymap.set('x', 'ff', function()
  -- Get the start and end of the selected lines
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Get the content of the selected lines
  local lines = vim.fn.getline(start_line, end_line)
  local chunk = table.concat(lines, "\n")

  -- Run Prettier CLI on the selected lines
  local prettier_cmd = "prettier --stdin-filepath " .. vim.fn.shellescape(vim.fn.expand("%"))
  local handle = io.popen(prettier_cmd, "w")
  if handle then
    handle:write(chunk)
    handle:close()
    local formatted = io.popen(prettier_cmd):read("*a")

    -- Replace the selected lines with the formatted output
    local formatted_lines = vim.split(formatted, "\n", { trimempty = true })
    vim.fn.setline(start_line, formatted_lines)
  end
end, { desc = "Format visual selection with Prettier" })

vim.keymap.set("n", "<leader>ao", "<cmd>AerialToggle <cr>", {desc = "Toggle aerial window"})

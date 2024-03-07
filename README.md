# `groom.nvim`

A Neovim plugin that integrates [`groom`](https://github.com/pspiagicw/groom) with neovim.

Obviously it requires `groom` to be installed.

## Features

- Run `groom` tasks right from Neovim.
- `QuickFix List` is automatically updated with task output.

## Installation

### `Lazy`

Add this configuration to the plugin section of your neovim config.

```lua
{
    'pspiagicw/groom.nvim',
    config = true,
},
```

## Usage

`groom` exposes only a single function, `run`. Use lua to run the function without any arguments.

```lua
require("groom").run()
```
> No mappings are done by `groom.nvim`, any mappings have to made by the user.

If you want to make a mapping, below snippet might be useful.

```lua
local opts = { noremap = true , silent = true }
map('n', '<leader>lg', ':lua require("groom").run()<CR>', opts)
```


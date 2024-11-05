local g = vim.g

--- set globals early for lazy
-------------------------------------- globals -----------------------------------------
g.mapleader = ' ' -- leader is space
g.maplocalleader = ' '
g.bigfile_size = 1024 * 1024 * 1.5
----------------------------------------------------------------------------------------
require 'core.lazy'
require 'core.mappings'
require 'core.options'

g.colorscheme = "nightfox"

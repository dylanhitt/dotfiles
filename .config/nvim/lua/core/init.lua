local g = vim.g

--- set globals early for lazy
-------------------------------------- globals -----------------------------------------
g.mapleader = ' ' -- leader is space
g.maplocalleader = ' '
----------------------------------------------------------------------------------------
require 'core.lazy'
require 'core.mappings'
require 'core.options'

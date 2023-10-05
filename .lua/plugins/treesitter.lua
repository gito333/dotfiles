--This plugin will do the syntax highliting
return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies = {'nvim-treesitter/playground' }

    }

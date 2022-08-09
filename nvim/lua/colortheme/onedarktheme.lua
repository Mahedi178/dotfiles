-- Example config in Lua
require("onedark").setup({
   functionStyle = 'NONE',
   keywordStyle = 'NONE',
   variableStyle = 'NONE',
  -- sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})


-- commentStyle:italic     :help highlight-args
-- keywordStyle:italic      same
-- functionStyle:NONE     same
-- variableStyle:NONE      same
-- transparent:false 
-- hideInactiveStatusline:false
-- sidebars:{}     "qf","vista_kind", "terminal", "packer"
-- darkSidebar:true
-- darkFloat:true
-- colors:{} 
-- customTelescope :false 

vim.cmd("colorscheme onedark")

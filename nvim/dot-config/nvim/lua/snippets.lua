local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local s = ls.snippet
local s = ls.snippet
local isn = ls.indent_snippet_node
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local c_cpp_main = s('main',
  fmta([[
    int main(int argc, char** argv) {
      <>
      return 0;
    }
  ]],
    { i(0) },
    { indent_string = '  ' })
)

return {
  all = {
    s(
      'fname',
      f(function()
        return vim.fn.expand '%:t'
      end)
    )
  },
  c = {
    c_cpp_main
  },
  cpp = {
    c_cpp_main,
    s('cout',
      fmt(
        'std::cout << {} << std::endl;',
        { i(1) }
      )),
  },
  html = {
    s('lcss',
      fmt(
        '<link rel="stylesheet" href="{}">',
        { i(1) }
      )
    ),
  }
}

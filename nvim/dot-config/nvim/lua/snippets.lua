local ls = require('luasnip')
local s = ls.snippet
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local c_cpp_main = s('main', {
  t('int main(int argc, char** argv) {'),
  t({ '', '    ' }), i(1),
  t({ '', '    return 0;' }),
  t({ '', '}' }),
})

return {
  c = {
    c_cpp_main
  },
  cpp = {
    c_cpp_main,
    s('cout', {
      t('std::cout << '),
      i(1),
      t(' << std::endl;'),
    }),
  }
}

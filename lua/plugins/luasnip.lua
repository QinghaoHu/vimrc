local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix
local snip = ls.snippet
local text = ls.text_node
 
-- Define the C++ template snippet.
 
 
ls.add_snippets(nil, {
    all = {
        snip({
            trig = "cppimport",  
            name = "C++ Template",  
            dscr = "C++ Template with common includes and main function structure.",  
        }, {
            text({ "#include <iostream>" }),
            text({ "", "#include <iomanip>" }),
            text({ "", "#include <fstream>" }),
            text({ "", "#include <sstream>" }),
            text({ "", "#include <cstdio>" }),
            text({ "", "#include <algorithm>" }),
            text({ "", "#include <numeric>" }),
            text({ "", "#include <functional>" }),
            text({ "", "#include <vector>" }),
            text({ "", "#include <array>" }),
            text({ "", "#include <list>" }),
            text({ "", "#include <deque>" }),
            text({ "", "#include <set>" }),
            text({ "", "#include <map>" }),
            text({ "", "#include <unordered_set>" }),
            text({ "", "#include <unordered_map>" }),
            text({ "", "#include <queue>" }),
            text({ "", "#include <stack>" }),
            text({ "", "#include <bitset>" }),
            text({ "", "#include <cmath>" }),
            text({ "", "#include <cstdlib>" }),
            text({ "", "#include <cstring>" }),
            text({ "", "#include <cctype>" }),
            text({ "", "#include <ctime>" }),
            text({ "", "#include <climits>" }),
            text({ "", "" }),
            text({ "", "using namespace std;" }),
            text({ "", "using ll = long long;" }),
            text({ "", "" }),
            text({ "", "void solve() {" }),
            text({ "", "\t" }),
            text({ "", "}" }),
            text({ "", "" }),
            text({ "", "int main() {" }),
            text({ "", "\tios::sync_with_stdio(false);" }),
            text({ "", "\tcin.tie (nullptr);" }),
            text({ "", "" }),
            text({ "", "\tint T = 1;" }),
            text({ "", "\t//cin >> T;" }),
            text({ "", "" }),
            text({ "", "\twhile(T --) {" }),
            text({ "", "\t\tsolve();" }),
            text({ "", "\t}" }),
            text({ "", "" }),
            text({ "", "\treturn 0;" }),
            text({ "", "}" }),
            text({ "", "" }),
            text({ "", "/* stuff you should look for" }),
            text({ "", " * int overflow, array bounds" }),
            text({ "", " * special cases (n=1?)" }),
            text({ "", " * do smth instead of nothing and stay organized" }),
            text({ "", " * WRITE STUFF DOWN" }),
            text({ "", " * DON'T GET STUCK ON ONE APPROACH" }),
            text({ "", " */" }),
        }),
    },
})
 
ls.add_snippets(nil, {
    all = {
        snip({
            trig = "constintinf",  -- Change trigger to something meaningful, e.g., "cpptemplate".
            name = "Infinite",  -- Corrected typo: "name" instead of "namr".
            dscr = "0x3f3f3f3f",  -- Corrected typo: "dscr" instead of "dsc".
        }, {
            text({ "const int INF = 0x3f3f3f3f;" }),
        }),
    },
})
 
ls.add_snippets(nil, {
    all = {
        snip({
            trig = "constdoubleeps",  -- Change trigger to something meaningful, e.g., "cpptemplate".
            name = "EPS",  -- Corrected typo: "name" instead of "namr".
            dscr = "eps=1e-12",  -- Corrected typo: "dscr" instead of "dsc".
        }, {
            text({ "const double eps = 1e-12;" }),
        }),
    },
})
 
ls.add_snippets(nil, {
    all = {
        snip({
            trig = "importpair",  -- Change trigger to something meaningful, e.g., "cpptemplate".
            name = "first and second for pairs",  -- Corrected typo: "name" instead of "namr".
            dscr = "f first, s second",  -- Corrected typo: "dscr" instead of "dsc".
        }, {
            text({ "#define f first" }),
            text({"", "#define s second" }),
        }),
    },
})

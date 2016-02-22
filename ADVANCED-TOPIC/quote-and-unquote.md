# 引用与去引用(quote and unquote)

## 引用
elixir程序由三部分组成，例如求合函数sum(1,3,3)可以表示如下：
```elixir
{:sum, [], [1, 2, 3]}
```
任何表达式都可以通过宏引用(quote macro)来表达:
```elixir
iex(1)> quote do: sum(1, 2, 3)
{:sum, [], [1, 2, 3]}
```
第一个元素为函数名；第二个为keyword list，代表元数据；第三个元素为参数列表。许多语言把这种表达
式称为Abstract Syntax Tree(AST)，elixir称之为引用表达式。

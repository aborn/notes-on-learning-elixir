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

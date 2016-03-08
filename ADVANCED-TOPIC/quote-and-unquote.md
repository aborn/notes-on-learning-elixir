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
式称为抽象语法树Abstract Syntax Tree(AST)，elixir称之为引用表达式。

下面是一个复杂一点的用户展开:
```elixir
iex(2)> quote do: sum(1, 2 + 3, 4)
{:sum, [], [1, {:+, [context: Elixir, import: Kernel], [2, 3]}, 4]}
```

## 引用的通用表达
一般，上面的引用元组可以表达成以下结构：
```elixir
{atom | tuple, list, list | atom}
```
其中:
1. 第一个元素为一个原子类型或者同样结构的元组;
2. 第二个元素为一个keyword list,它包含元数据、像numbers和contexts；
3. 第三个元素或者为一个参数列表，或者为原子类型。当它是一个原子类型时，意味着这个引用表达式表示
的是一个变量。

注意，有下面5种elixir字面量类型，它们直接返回自己，不翻译成用户表达式：
```elixir
:sum         #=> Atoms
1.0          #=> Numbers
[1, 2]       #=> Lists
"strings"    #=> Strings
{key, value} #=> Tuples with two elements
```
大部分elixir代码是直接翻译成它对应的引用表达式。

## 引用转义(unquote)
有时候你想在一个引用中对某个变量进行转义，如下：
```elixir
iex(5)> number = 13
13
iex(6)> Macro.to_string(quote do: 11 + number)
"11 + number"
```

这不是我们想要的，因为我们想把number变量换成它的值，那么可采用unquote实现：
```elixir
iex(7)> number = 13
13
iex(8)> Macro.to_string(quote do: 11 + unquote(number))
"11 + 13"
```

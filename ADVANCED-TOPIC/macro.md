# 宏

官方给的建议是宏是不到万不得已才用，因为它的可读性不好，并且写起来不是那么容易。

## 第一个宏
定义宏通过defmacro/2这个表达式来完成。官方给了一个unless的例子，如下：
```elixir
defmodule Unless do
  def fun_unless(clause, expression) do
    if(!clause, do: expression)
  end

  defmacro macro_unless(clause, expression) do
    quote do
      if(!unquote(clause), do: unquote(expression))
    end
  end
end
```

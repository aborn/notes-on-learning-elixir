# elixir的异常处理
[elixir有三种异常处理的机制](http://elixir-lang.org/getting-started/try-catch-and-rescue.html)
分别是Errors, throws和exits

## errors
errors相当于java里的exception，不过，它是运行时抛出的，如下面的例子：
```mix
iex(1)> String.to_integer("s")
** (ArgumentError) argument error
:erlang.binary_to_integer("s")
```
在运行时，想要抛出一个异常，只要调用raise/1，参数为消息
```
iex(1)> raise "exception example"
** (RuntimeError) exception example
```
定义自己的exception模块，相当简单，下面是一个例子：
```elixir
defmodule Nle.ExceptionExample do
  defexception message: "example exception."
end
```

### 异常的捕获
对elixir的异常捕获,可采用try/rescue机制.下面是一个例子：
```elixir
  def demo(arg) do
    try do
      case arg do
        0 ->
          raise Nle.ExceptionExample
        1 ->
          String.to_integer("s")
        _ ->
          raise "running time error"
      end
    rescue
      e in ArgumentError -> e.message
      e in ExceptionExample -> e.message
      e in RuntimeError -> e.message
    end
  end
```
注意rescue后面的Error类型要对应.

## throws

## exits

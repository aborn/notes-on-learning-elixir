defmodule Nle.ExceptionDemo do
  alias Nle.ExceptionExample

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
end

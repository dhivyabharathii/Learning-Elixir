#Abstraction
defmodule MultiDict do
  def new(), do: %{}

  def add(dict, key, value) do
    Map.update(dict, key, [value], &[value | &1])
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end
end

defmodule TodoList do
  def new(), do: MultiDict.new()

  def add_entry(todo_list, date, title) do
    MultiDict.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end
end


todo_list =
  TodoList.new() |>
  TodoList.add_entry(~D[2018-12-19], "Dentist") |>
  TodoList.add_entry(~D[2018-12-20], "Shopping") |>
  TodoList.add_entry(~D[2018-12-19], "Movies")

IO.puts TodoList.entries(todo_list,~D[2018-12-20])

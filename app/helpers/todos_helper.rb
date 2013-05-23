module TodosHelper
  def percent_complete(todos)
    Integer(fraction_complete(todos) * 100)
  end

  def fraction_complete(todos)
    todos.completed.size.to_f / todos.size.to_f
  end
end
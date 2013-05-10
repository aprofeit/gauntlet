module PeopleHelper
  def bar_style(todo)
    todo.complete? ? 'bar-success' : 'bar-warning'
  end
end
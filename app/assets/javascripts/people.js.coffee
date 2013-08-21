send_uncomplete_request_for_todo = (todo) ->
  $.ajax todo.data('complete-url'),
    type: 'DELETE'
    complete: ->
      uncomplete_todo(todo)

uncomplete_todo = (todo) ->
  todo.removeClass('bar-success').addClass('bar-warning')
  todo.data('complete', false)
  todo.attr('data-original-title', '')

send_complete_request_for_todo = (todo) ->
  $.post todo.data('complete-url'), ->
    complete_todo_callback(todo)

complete_todo_callback = (todo) ->
  todo.removeClass('bar-warning').addClass('bar-success')
  todo.data('complete', true)
  $.get todo.data('todo-url'), (data) ->
    enable_tooltip_on_todo(todo, data)

enable_tooltip_on_todo = (todo, data) ->
  todo.attr('data-original-title', data.completed_at)
  todo.tooltip()

todo_complete = (todo) ->
  todo.data('complete')

attach_hide_datepicker_event = ->
  $('.datepicker').on 'changeDate', ->
    $(this).datepicker('hide')

init_datepicker = ->
  $('.datepicker').datepicker()

$(document).on 'click', '.todo', ->
  $todo = $(this)
  if todo_complete($todo)
    send_uncomplete_request_for_todo($todo)
  else
    send_complete_request_for_todo($todo)

$(document).on 'shown', '#modal-form', ->
  init_datepicker()
  attach_hide_datepicker_event()

$ ->
  $('.todo').click ->
    $todo = $(this)
    if $todo.data('complete')
      $.ajax $todo.data('complete-url'),
        type: 'DELETE'
        complete: ->
          $todo.removeClass('bar-success').addClass('bar-warning')
          $todo.data('complete', false)
          $todo.attr('data-original-title', '')
    else
      $.post $todo.data('complete-url'), ->
        $todo.removeClass('bar-warning').addClass('bar-success')
        $todo.data('complete', true)
        $.get $todo.data('todo-url'), (data) ->
          $todo.attr('data-original-title', data.completed_at)
          $todo.tooltip()

  $('.bar').tooltip()

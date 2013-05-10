$ ->
  $('.todo').click ->
    $todo = $(this)
    if $todo.data('complete')
      $.ajax $todo.data('complete-url'),
        type: 'DELETE'
        complete: ->
          $todo.removeClass('bar-success').addClass('bar-warning')
          $todo.data('complete', false)
    else
      $.post $todo.data('complete-url'), ->
        $todo.removeClass('bar-warning').addClass('bar-success')
        $todo.data('complete', true)

  $('.bar').tooltip()

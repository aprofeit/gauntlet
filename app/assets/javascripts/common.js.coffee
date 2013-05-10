$ ->
  $('#modal-form').on 'shown', ->
    $('.datepicker').datepicker()
      .on 'changeDate', ->
        $(this).datepicker('hide')

  $('.objective').hover(
    ->
      $(this).children('a').children('i').show()
    ->
      $(this).children('a').children('i').hide()
  )

  $('.person').hover(
    ->
      $(this).children('.row').children('.name-container').children('h3').children('a').children('i').show()
    ->
      $(this).children('.row').children('.name-container').children('h3').children('a').children('i').hide()
  )

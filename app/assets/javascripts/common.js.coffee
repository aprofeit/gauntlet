$ ->
  $('#modal-form').on 'shown', ->
    $('.datepicker').datepicker()
      .on 'changeDate', ->
        $(this).datepicker('hide')

  $('.objective, .person').hover(
    ->
      $(this).find('i').show()
    ->
      $(this).find('i').hide()
  )

  $('#modal-form').on 'hidden', ->
    $(this).removeData 'modal'
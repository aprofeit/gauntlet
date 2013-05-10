$ ->
  $('#modal-form').on 'shown', ->
    $('.datepicker').datepicker()
      .on 'changeDate', ->
        $(this).datepicker('hide')

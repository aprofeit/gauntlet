$ ->
  $(document).trigger('page:load')

make_objectives_sortable = ->
  $('#objectives').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

show_child_element = (parent_selector, child_selector) ->
  $(parent_selector).find(child_selector).show()

hide_child_element = (parent_selector, child_selector) ->
  $(parent_selector).find(child_selector).hide()

attach_hide_datepicker_event = ->
  $('.datepicker').on 'changeDate', ->
    $(this).datepicker('hide')

init_datepicker = ->
  $('.datepicker').datepicker()

clear_modal = (selector) ->
  $(selector).removeData 'modal'

enable_tooltip_on_element = (selector) ->
  $(selector).tooltip()

$(document).on 'page:fetch', ->
  NProgress.start()

$(document).on 'page:load', ->
  NProgress.done()
  make_objectives_sortable()
  enable_tooltip_on_element('.bar')

$(document).on 'mouseenter', '.objective, .person', ->
  show_child_element(this, 'i')

$(document).on 'mouseleave', '.objective, .person', ->
  hide_child_element(this, 'i')

$(document).on 'shown', '#modal-form', ->
  init_datepicker()
  attach_hide_datepicker_event()

$(document).on 'hidden', '#modal-form', ->
  clear_modal(this)

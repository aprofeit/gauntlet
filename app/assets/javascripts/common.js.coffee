$ ->
  $(document).trigger('page:load')

show_child_element = (parent_selector, child_selector) ->
  $(parent_selector).find(child_selector).show()

hide_child_element = (parent_selector, child_selector) ->
  $(parent_selector).find(child_selector).hide()

clear_modal = (selector) ->
  $(selector).removeData 'modal'

enable_tooltip_on_element = (selector) ->
  $(selector).tooltip()

$(document).on 'page:fetch', ->
  NProgress.start()

$(document).on 'page:load', ->
  NProgress.done()
  enable_tooltip_on_element('.bar')

$(document).on 'mouseenter', '.objective, .person', ->
  show_child_element(this, 'i')

$(document).on 'mouseleave', '.objective, .person', ->
  hide_child_element(this, 'i')

$(document).on 'hidden', '#modal-form', ->
  clear_modal(this)

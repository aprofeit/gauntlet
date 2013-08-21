# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

objectives_sort_callback = (objectives) ->
  $.post(objectives.data('update-url'), objectives.sortable('serialize'))

make_objectives_sortable = ->
  $('#objectives').sortable
    axis: 'y'
    update: ->
      objectives_sort_callback($(this))

$(document).on 'page:load', ->
  make_objectives_sortable()

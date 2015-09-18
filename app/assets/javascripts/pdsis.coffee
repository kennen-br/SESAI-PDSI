# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

element_index = (element_id) ->
  regExp  = /.*(\d)/
  matches = regExp.exec element_id
  return matches[1]

element_type  = (element_id) ->
  regExp  = /use_(\w+)_\d/
  matches = regExp.exec element_id
  return matches[1]

  return

manage_element = (element) ->
  checked = element.attr 'checked'
  id      = element_index element.attr('id')
  type    = element_type element.attr('id')
  new_id  = '#fields_to_'+type+'_time_'+id

  if checked == 'checked'
    $(new_id).show()
  else
    $(new_id).hide()
  return

$(document).ready ->
  $('.use_boat').each (item) ->
    manage_element $(this)
    return

  $('.use_road').each (item) ->
    manage_element $(this)
    return

  $('.use_fly').each (item) ->
    manage_element $(this)

  $('.use_boat').change ->
    manage_element $(this)
    return
  return

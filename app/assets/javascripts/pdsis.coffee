# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

manage_element = (element) ->
  element.parents('.destiny-transport').find('fieldset').toggle()
  return

$(document).ready ->
  $(document).on 'change', '.hide-field', (e) ->
    $this = $(this)
    if $this.data('equal') == $this.find(':selected').text()
      $this.parent().parent().find(".#{$this.data('field')}").prop('selectedIndex',0).hide()
    else
      $this.parent().parent().find(".#{$this.data('field')}").show()
    return

  $('.destiny-transport :checkbox').each (item) ->
    manage_element $(this)
    return

  $(document).on 'change', '.destiny-transport :checkbox', ->
    manage_element $(this)
    return
  return

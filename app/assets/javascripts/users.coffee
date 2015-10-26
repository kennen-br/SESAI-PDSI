# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.user-type').each ->
    $this = $(this)
    $this.find('select').change ->
      console.log $(this).val(), [4, 5]
      if parseInt($(this).val()) in [4, 5]
        $('.user-dsei').show()
      else
        $('.user-dsei').hide()
      return
    return
  return
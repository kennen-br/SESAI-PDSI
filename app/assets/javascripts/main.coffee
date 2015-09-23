# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # Apply numeric mask
  $('input[type=number]').numeric()

  # Apply numeric mask to newly created nodes
  $(document).on 'click', '.add_fields', (e) ->
    $this = $(this)
    node = $this.data 'association-insertion-node'
    setTimeout( ->
      $("#{node} :last-child").find('input[type=number]').numeric()
    , 100)
    return
  return
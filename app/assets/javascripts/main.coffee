# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.menu_estrutura').find('.select_dsei_menu').hide()

  setTimeout( ->
    $('#error_explanation').hide()
  , 12000)
  return


  # Apply numeric mask
  $('input[type=number]').numeric()

  # Apply currency mask
  $(document).on 'change', '.currency-input', (e) ->
    $this = $(this)
    value = $this.val().replace(/^R\$/g, '').replace(/\./g, '').replace(',', '.')
    $this.prev().val value
    return

  $('.currency-input').each ->
    $(this).maskMoney
      prefix: 'R$'
      thousands: '.'
      decimal: ','

  # Apply numeric mask to newly created nodes
  $(document).on 'click', '.add_fields', (e) ->
    $this = $(this)
    node = $this.data 'association-insertion-node'
    setTimeout( ->
      $("#{node} :last-child").find('input[type=number]').numeric()
    , 100)
    return
  return


manage_element = (element) ->
  element.parents('.destiny-transport').find('fieldset').toggle()
  return

$(document).on 'click', '.radio_destination_class', (e) ->
  $this   = $(this)
  parent  = $this.parent().parent().parent().parent()

  if $this.val() == 'aldeia'
    parent.children('.destination_village').show()
    parent.children('.destination_city').hide()
  if $this.val() == 'municipio'
    parent.children('.destination_village').hide()
    parent.children('.destination_city').show()
  return

$(document).ready ->
  # Generate a Default name for all new created EMSI on Capacidade Instalada form
  $('.base-polo-emsi .add_fields').click (e) ->
    $this = $(this)
    node = $this.data 'association-insertion-node'
    setTimeout( ->
      console.log "#{node} .new.emsi-fieldset:last .emsi-name"
      field = $("#{node} .new.emsi-fieldset:last .emsi-name")
      count = $("#{node} .emsi-fieldset").length
      field.val "EMSI #{field.data('base-polo')}.#{count}"
      return
    , 100)
    return

  $(document).on 'change', '.hide-field', (e) ->
    $this = $(this)
    if $this.data('equal') == $this.find(':selected').text()
      $this.parent().parent().find(".#{$this.data('field')}").prop('selectedIndex',0).hide()
    else
      $this.parent().parent().find(".#{$this.data('field')}").show()
    return

  $(document).on 'change', '.destiny-transport :checkbox', ->
    manage_element $(this)
    return



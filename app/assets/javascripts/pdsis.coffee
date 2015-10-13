# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

manage_element = (element) ->
  element.parents('.destiny-transport').find('fieldset').toggle()
  return

$(document).ready ->

  # Projeção Orçamentária
  $('.projection-structure-type').each ->
    $type = $(this)
    type = $type.find('> legend').text()

    # Years 2015-2019
    $type.find('.projection-year').each ->
      $year = $(this)
      $year.find('.structure-qty').on 'change', ->
        value = $(this).val()

        if $year.find('> legend').text() == '2015'
          console.log '2015'
          needed = value - ($type.find('.initial-value').val() || 0)
        else
          needed = value

        $year.find('table tr.new-object').each ->
          $(this).remove() if $(this).find(':text').val() == ''
          return
        needed -= $year.find('table tbody tr').length

        if needed > 0
          $year.find('.new-structures').show()
        else if $year.find('table tbody tr').length == 0
          $year.find('.new-structures').hide()

        for i in [1..needed] by 1
          $year.find('.add_fields').click()
        return
      return


    return

  # Mark input for PDSI Results as red or green
  $(document).on 'blur', '.expected-result', (e) ->
    $this    = $(this)
    expected = $this.data 'expected'
    value    = $this.val()

    $this.removeClass 'red green'

    if value >= expected
      $this.addClass 'green'
    else
      $this.addClass 'red'

    return

  # Generate a Default name for all new created EMSI on Capacidade Instalada form
  $('.base-polo-emsi .add_fields').click (e) ->
    console.log 'new emsi'
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

  $('.destiny-transport :checkbox').each (item) ->
    manage_element $(this)
    return

  $(document).on 'change', '.destiny-transport :checkbox', ->
    manage_element $(this)
    return
  return

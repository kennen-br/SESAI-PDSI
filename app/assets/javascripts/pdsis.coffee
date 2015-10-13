# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

manage_element = (element) ->
  element.parents('.destiny-transport').find('fieldset').toggle()
  return

$(document).ready ->
  $(document).on 'click', '.add_person', (e) ->
    $this       = $(this)
    $parent     = $(this).parent()
    $select     = $parent.children 'select'
    $add_button = $parent.children 'a'
    $id         = $select.attr 'id'

    $select.hide()
    $add_button.hide()

    $new_div        = $('<fieldset><legend>Cadastrar pessoa</legend></fieldset>')
    $field          = $('<input type="text" />')
    $cancel_button  = $('<button id="cancel_person_button" class="button btn-sm pull-right">Cancelar</button>')
    $save_button    = $('<button id="save_person_button" class="button btn-sm pull-right">Salvar</button>')

    $new_div.append($('<label>Nome da pessoa</label>'))
    $new_div.append $field
    $new_div.append $save_button
    $new_div.append $cancel_button
    $parent.append $new_div

    $cancel_button.click ->
      # TODO: Functionalize this
      $select.show()
      $add_button.show()
      $new_div.remove()
      return false

    $save_button.click ->
      $.post('/pessoas/cadastrar', { "name" : $field.val() }).done (data) ->
        # Validate response status, return false
        if !data.status
          alert data.message
          $field.css('border', 'solid 1px #c00')
          return

        # TODO: Functionalize this
        $select.show()
        $add_button.show()
        $new_div.remove()

        $option = $('<option></option>').html(data.name).attr('value', data.id)

        # $select.append $option
        $('select.select-dsei-person').append $option

        # Add new option to all selects
        # $('select.select-dsei-person').each (index) ->
        #   console.log index
        #   $(this).append $option
        #   return

        # Just to current select, set val as new value
        $select.val data.id
      return false

    return

  # Toggle Structures on Projeção Orçamentária show
  $('.budget-table.investiment .toggle-structures').click ->
    $(this).toggleClass('fa-plus-square-o').toggleClass 'fa-minus-square-o'
    index = $(this).parents('tr.item').data 'index'
    $(".budget-table.investiment .structure[data-index='#{index}']").toggle()
    return

  # Sum up all investiments to years 2016-2019 on a final table
  $('.budget-table.investiment.total').each ->
    $total    = $(this)
    $carousel = $total.parent()

    # Categories
    $categories = $carousel.prev().find('.category').clone()
    $categories.each ->
      id = $(this).data 'category'
      total = 0
      $carousel.prevAll().each ->
        value = $(this).find(".category[data-category='#{id}'] td:last-child").text() || '0'
        value = value.replace('R$', '')
        value = value.replace('.', '')
        value = value.replace(',', '.')

        total += (value*1)
        return

      $(this).find('td').eq(1).remove()
      $(this).find('td:last-child').text("R$ " + total.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.'))
      return

    $total.find('tbody').append $categories

    # Items
    $items = $carousel.prev().find('.item').clone()
    $items.find('td:eq(2), .toggle-structures').remove()

    $items.each ->
      index = $(this).data 'index'
      unidades = 0
      total = 0
      $carousel.prevAll().each ->
        value = $(this).find(".item[data-index='#{index}'] td:last-child").text() || '0'
        value = value.replace('R$', '')
        value = value.replace('.', '')
        value = value.replace(',', '.')
        total += (value*1)

        uni = $(this).find(".item[data-index='#{index}'] td:eq(1)").text() || '0'
        unidades += (uni*1)
        return
      $(this).find('td:eq(1)').text unidades
      $(this).find('td:last-child').text("R$ " + total.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.'))
      return

    $total.find('.category').each ->
      id = $(this).data 'category'
      $(this).after($items.filter("[data-category='#{id}']"))
      return
    return

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

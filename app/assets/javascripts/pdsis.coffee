# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

manage_element = (element) ->
  element.parents('.destiny-transport').find('fieldset').toggle()
  return
#Calculate funding balance for both columns TODO
calculate_funding_balance = ->
  console.log "Calculating funding balance"
  for year in [2016..2019]
    console.log "Year #{year}"
    subtotal = 0.0
    el1 = "#input-#{year}-3"
    el2 = "#input-#{year}-10"
    subtotal = parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    console.log "Subtotal el1: #{subtotal}"
    subtotal += parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    console.log "Subtotal el2: #{subtotal}"
    # Negative values
    el1 = "#input-#{year}-3-2"
    el2 = "#input-#{year}-10-2"
    subtotal -= parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    console.log "Subtotal -el1: #{subtotal}"
    subtotal -= parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    console.log "Subtotal -el2: #{subtotal}"
    if subtotal>0
      $("#input-#{year}-0").val("R$#{(subtotal).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
      $("#input-#{year}-0").css({'color' : 'green'})
    else
      $("#input-#{year}-0").val("- R$#{(subtotal).toFixed(2).replace('-','').replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
      $("#input-#{year}-0").css({'color' : 'red'})

  return

calculate_parent_total = (parent_id) ->
  subtotal2 = 0.0
  console.log "Recalculating subtotals by group #{parent_id}"

  $(document).find(".#{parent_id}").each (item) ->
    input_value = parseFloat($(this).prop("value").toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    console.log "input_value: #{input_value}"

    subtotal2 += parseFloat(input_value)
    console.log "subtotal: #{subtotal2}"
    return
  # Value for hidden form (subitems)
  $("#hidden-#{parent_id}-2").val(parseFloat(subtotal2).toFixed(2))
  console.log "#input-#{parent_id.substring(0,4)}-10-2"

  # Value for show form (subitems)
  $("#input-#{parent_id}-2").val("R$#{(subtotal2).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

  # Contratos
  el1 = "#input-#{parent_id.substring(0,4)}-11-2"
  el2 = "#input-#{parent_id.substring(0,4)}-15-2"
  el3 = "#input-#{parent_id.substring(0,4)}-17-2"
  el4 = "#input-#{parent_id.substring(0,4)}-21-2"
  el5 = "#input-#{parent_id.substring(0,4)}-30-2"
  subtotal = parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
  subtotal += parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
  subtotal += parseFloat($(el3).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
  subtotal += parseFloat($(el4).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
  subtotal += parseFloat($(el5).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
  #Value for hidden form (contracts)
  $("#hidden-#{parent_id.substring(0,4)}-10-2").val(subtotal.toFixed(2))

  # Value for show form (contracts)
  $("#input-#{parent_id.substring(0,4)}-10-2").val("R$#{(subtotal).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

  calculate_funding_balance()

  #$("#hidden-#{parent_id}").attr("value", parseFloat(subtotal).toFixed(2))
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
  $cancel_button  = $('<button id="cancel_person_button" class="button btn-sm pull-right cancel-button">Cancelar</button>')
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
$(document).ready ->

  # Add new behavior to cocoon add_fields button
  $('.expected-result.responsabilities').each  ->
    $fieldset = $(this)
    $original = $fieldset.find('.select-dsei-person:first')

    $fieldset.on 'click', '.add_fields', (e) ->
      $this = $(this)

      method = $this.data('association-insertion-method') || 'before'
      setTimeout( ->
        if method == 'append'
          $node = $this.parent().find('> :last-child')
        else
          $node = $this.parent().prev()

        if $node.find('.select-dsei-person').find('option').length != $original.find('option').length
          $node.find('.select-dsei-person').empty().html($original.html())
        return
      , 100)
      return
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

      atualizaTotal = ->
        qty   = parseInt($year.find('.structure-block').length) || 0
        value = $year.find('.currency-input').val() || 0
        value = parseFloat(value.toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))

        $year.find('.total-sum strong').text "R$ #{(qty * value).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}"
        return

      # Calculate the total money necessary for the structures
      atualizaTotal()
      $year.find('.structure-qty, .currency-input').on 'change', atualizaTotal

      # Show/Hide the forms for new structures
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
  $(document).on 'blur', '.expected-result-field', (e) ->
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

  # Recalculate values for 2017-2019 based on 2016 and correction factors
  $(document).on 'change', '.2016-budget-value', ->
    console.log 'Recalculating budgets for years 2017-2019'

    idx = $(this).attr('input_index')
    val = parseFloat($(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    group_parent_id = $(this).attr('group_parent_id')

    for year in [2017..2019]
      el = "#input-#{year}-#{idx}"
      cf = $(el).attr('correction_factor')
      year_parent_id = "#{year}-#{group_parent_id}"
      new_val = val + (val*cf)

      console.log "Recalculating #{el} using correction factor #{cf}: #{new_val}"
      # Value for hidden form
      $("#hidden-#{year}-#{idx}").val(new_val.toFixed(2))

      # Value for show form
      $(el).val("R$#{(new_val).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

      value_index = $(el).attr('value_index')

      if value_index > 10
        calculate_parent_total(year_parent_id)
      if (value_index == '3' || value_index == '10')
        calculate_funding_balance()

    return

  # Update subtotals by group of contracts
  $(document).on 'change', '.2015-group-value, .2016-group-value, .2017-group-value, .2018-group-value, .2019-group-value', ->
    year_parent_id = $(this).attr('year_parent_id')
    year_cost_id = $(this).attr('year_cost_id')
    value = $(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.')
    #$("#hidden-#{year_cost_id}").attr("value", value)
    calculate_parent_total(year_parent_id)
    return

  return

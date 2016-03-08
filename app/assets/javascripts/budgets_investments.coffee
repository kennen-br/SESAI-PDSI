# Subgroup1 sum
group1_sum = (class_item) ->
  fore = class_item.replace(/u/, 'f')
  hidd = class_item.replace(/u/, 'h')
  item = class_item.slice(1)
  subtotal = 0
  $(".#{class_item}").each ->
    value = $(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.')
    subtotal += parseFloat(value) if value != NaN

  $("##{fore}").val("R$#{(subtotal).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
  $("##{hidd}").val(subtotal)
  group_sum(item, 1)

# Subgroup2 sum
group2_sum = (class_item) ->
  subtotal = 0
  item = class_item.attr('id').slice(1)
  unit = 'u' + item
  unit_val = $("##{unit}").val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.')
  quant = 'q' + item
  quant_val = $("##{quant}").val()*1
  fore = 'f' + item
  hidd = 'h' + item
  subtotal = quant_val * unit_val
  $("##{fore}").val("R$#{(subtotal).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
  $("##{hidd}").val(subtotal)

  group_sum(item, 2)

# Increase quantity and sum
quantity_plus = (class_item) ->
  subtotal = 1
  $(document).find(".#{class_item}").each (item) ->
    subtotal += $(this).val()*1
    return
  $("##{class_item}").val(subtotal)

# Decrease quantity and sum
quantity_sum = (class_item) ->
  subtotal = 0
  $(document).find(".#{class_item}").each (item) ->
    subtotal += $(this).val()*1
    return
  $("##{class_item}").val(subtotal)

# Group sum
group_sum = (item, group) ->
  year = item.slice(-4)
  sum = 0
  $(".group#{group}-input-#{year}").each ->
    value = $(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.')
    if value
      sum += parseFloat(value) if value != NaN

  $("#gc#{group}y#{year}").val("R$#{(sum).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
  $("#hgc#{group}y#{year}").val(sum)

$(document).ready ->
  # Sort by group
  for year in [2016..2019]
    $("[data-category='1-#{year}']").after $("[data-category='c1-#{year}']")
    $("[data-category='2-#{year}']").after $("[data-category='c2-#{year}']")
    $("[data-category='3-#{year}']").after $("[data-category='c3-#{year}']")

  # Sum group1 fields on modification
  $(document).on 'keyup', ".group1-input", ->
    modify_element = $(this).attr('class').split(' ')[0]
    group1_sum(modify_element)
    return

  $('#form-investment').on 'cocoon:after-insert', ->
    $('.select2').select2({ dropdownAutoWidth: true })
    $('.village-select').select2
      dropdownAutoWidth : true
      minimumInputLength: 1
      minimumResultsForSearch: 100
      ajax:
        url: '/locations/villages.json'
        dataType: 'json'
        type: 'GET'
        data: (params) ->
          queryParameters = term: params.term
          queryParameters
        processResults: (data) ->
          results: $.map data, (item) ->
            { text: item.name, id: item.id }
    $('.village-select').next('span').next('span').remove()

    $('.currency-input').each ->
      $(this).maskMoney
        prefix: 'R$'
        thousands: '.'
        decimal: ','
    return

  # Sum group2 fields on modification
  $(document).on 'keyup', ".group2-input", ->
    modify_element = $(this)
    group2_sum(modify_element)
    return

  # Insert Items
  $(document).on 'click', '#form-investment .fa-plus', ->
    class_item = $(this).parent().attr('class').split(' ')[0]
    quantity_plus(class_item)

  # Remove items
  $(document).on 'click', '#form-investment input.check_box-destroy', ->
    class_item = $(this).attr('class').split(' ')
    quant = 'q' + class_item[2]
    fore  = 'u' + class_item[2]
    quant_saved = 'q' + class_item[1]

    # Remove unsaved items
    if $(this).hasClass("new-record")
      $(this).parent().parent().remove()
      quantity_sum(quant)
      group1_sum(fore)
    else
      # Remove saved items
      if $(this).is(':checked')
        $('#form-investment input:checkbox').not(this).prop('checked', false)
        $prevtd = $(this).parent().prev('td').find('input')
        $prevprevtd = $(this).parent().prev('td').prev('td').find('input')
        toastr.warning("<div><button type='button' class='button' id='okBtn'>Sim</button>" , 'Deseja excluir este ítem?', {preventDuplicates: true})
        $('#okBtn').click ->
          $prevtd.val(0)
          $prevprevtd.val(0)
          quantity_sum(quant_saved)
          group1_sum(fore)
          $('form').submit()

  # Save form if no errors
  $('#pdsi_save_button').prop('onclick',null)
  $(document).on 'click','#pdsi_save_button', ->
    errors = 0
    $('.new-record:input[type="text"]').map ->
      if !$(this).val()
        $(this).parent().css
          'border-style': 'solid'
          'border-color': 'red'
        errors++
      else if $(this).val()
        $(this).parent().css
          'border-style': 'none'
      return
    if errors > 0
      toastr.warning('Nome do ítem é obrigatório' , 'ERRO!')
      return false
    $('form').submit()
    return

  $('.select2').select2({ dropdownAutoWidth : true })

  $('#form-investment .village-select').select2
    dropdownAutoWidth : true
    minimumInputLength: 1
    minimumResultsForSearch: 100
    ajax:
      url: '/locations/villages.json'
      dataType: 'json'
      type: 'GET'
      data: (params) ->
        queryParameters = term: params.term
        queryParameters
      processResults: (data) ->
        results: $.map data, (item) ->
          { text: item.name, id: item.id }

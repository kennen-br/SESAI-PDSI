# Subgroup1 sum
group1_sum = (class_item) ->
  q = class_item.replace(/u/, 'q')
  forecast = class_item.replace(/u/, 'f')
  quant = $("##{q}").val()
  subtotal = 0
  $(document).find(".#{class_item}").each (item) ->
    subtotal += $(this).val()*1
    return
  $("##{class_item}").val(subtotal)
  $("##{forecast}").val(subtotal)
  group_sum(class_item)

# Subgroup2 sum
group2_sum = (class_item) ->
  subtotal = 0
  item = class_item.attr('id').slice(1,9)
  unit = 'u' + item
  unit_val = $("##{unit}").val()*1
  quant = 'q' + item
  quant_val = $("##{quant}").val()*1
  fore = 'f' + item
  subtotal = quant_val * unit_val
  $("##{fore}").val(subtotal)
  group_sum(class_item)

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
group_sum = (class_item) ->
  group1y2016 = 0
  group2y2016 = 0
  group3y2016 = 0
  group1y2017 = 0
  group2y2017 = 0
  group3y2017 = 0
  group1y2018 = 0
  group2y2018 = 0
  group3y2018 = 0
  group1y2019 = 0
  group2y2019 = 0
  group3y2019 = 0

  for categorie in [4..10]
    group1y2016 += $("#fc#{categorie}y2016").val()*1
    group1y2017 += $("#fc#{categorie}y2017").val()*1
    group1y2018 += $("#fc#{categorie}y2018").val()*1
    group1y2019 += $("#fc#{categorie}y2019").val()*1
  $("#gc1y2016").val(group1y2016)
  $("#gc1y2017").val(group1y2017)
  $("#gc1y2018").val(group1y2018)
  $("#gc1y2019").val(group1y2019)

  for categorie in [11..13]
    group2y2016 += $("#fc#{categorie}y2016").val()*1
    group2y2017 += $("#fc#{categorie}y2017").val()*1
    group2y2018 += $("#fc#{categorie}y2018").val()*1
    group2y2019 += $("#fc#{categorie}y2019").val()*1
  $("#gc2y2016").val(group2y2016)
  $("#gc2y2017").val(group2y2017)
  $("#gc2y2018").val(group2y2018)
  $("#gc2y2019").val(group2y2019)

  for categorie in [14..20]
    group3y2016 += $("#fc#{categorie}y2016").val()*1
    group3y2017 += $("#fc#{categorie}y2017").val()*1
    group3y2018 += $("#fc#{categorie}y2018").val()*1
    group3y2019 += $("#fc#{categorie}y2019").val()*1
  $("#gc3y2016").val(group3y2016)
  $("#gc3y2017").val(group3y2017)
  $("#gc3y2018").val(group3y2018)
  $("#gc3y2019").val(group3y2019)


$(document).ready ->
  # Sort by group
  for year in [2016..2019]
    $("[data-category='1-#{year}']").after $("[data-category='c1-#{year}']")
    $("[data-category='2-#{year}']").after $("[data-category='c2-#{year}']")
    $("[data-category='3-#{year}']").after $("[data-category='c3-#{year}']")

  # Sum group1 fields on modification
  $(document).on 'keyup', ".group1-input", ->
    for year in [2016..2019]
      for categorie in [1..20]
        group1_sum("uc#{categorie}y#{year}")
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
    return

  # Sum group2 fields on modification
  $(document).on 'keyup', ".group2-input", ->
    modify_element = $(this)
    group2_sum(modify_element)
    return

  # Insert Items
  $(document).on 'click', '#form-investment .fa-plus', ->
    class_item = $(this).parent().attr('class').slice(0,9)
    quantity_plus(class_item)

  # Remove items
  $(document).on 'click', '#form-investment input:checkbox', ->
    class_item = $(this).attr('class').slice(-8).replace(/\s+/g, '')
    quant = 'q' + class_item
    fore  = 'u' + class_item

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
        $ ->
          $('#okBtn').click ->
            $prevtd.val(0)
            $prevprevtd.val(0)
            quantity_sum(quant)
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

# Add new item
index = 1
addNewItem = (elId, elClass)->
  item = elClass.split('-')[0]
  year = elClass.split('-')[1]
  html = """
  <tr class="item new-item" id="input-new-item">
    <td class="action">
      <i class="fa fa-trash-o"></i>
      <input name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]" type="hidden" value="0"><input type="checkbox" class="new-item dc#{item}y#{year}" value="1" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]">
    </td>
    <td class="field">
      <input type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][name]">
    </td>
    <td>
      <input type="number" value="1" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][quantity_2016]" id="qid#{index+10}c#{item}y#{year}" class="qc#{item}y#{year} investment-input" disabled>
    </td>
    <td>
      <input value="0" type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][unitary_amount_2016]" id="uid#{index+10}c#{item}y#{year}" class="uc#{item}y#{year} investment-input">
    </td>
    <td>
      <input value="0" type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][forecast_amount_2016]" id="fid#{index+10}c#{item}y#{year}" class="fc#{item}y#{year}">
      <input type="hidden" value="#{year}"name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][year_reference]">
    </td>
  </tr>

  """
  $("#i#{elId}").after html
  quantity_sum("qc#{item}y#{year}")
  index++

# Subgroup sum
forecast_sum = (class_item) ->
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

  # Sum all fields on modification
  $(document).on 'keyup', ".investment-input", ->
    for year in [2016..2019]
      for categorie in [1..20]
        forecast_sum("uc#{categorie}y#{year}")
    return

  # Add new item
  $('.fa-plus').click (event) ->
    event.preventDefault()
    elClass = $(this).attr('class').split(' ')[2]
    elId = $(this).attr('id')
    addNewItem(elId, elClass)

    # Remove not saved item
    $ ->
      $('input.new-item:checkbox').click ->
        if $(this).is(':checked')
          $('#input-new-item').remove()
          class_item = $(this).attr('class').slice(-8)
          class_unitary = class_item.replace(/d/, 'u')
          class_quantity = class_item.replace(/d/, 'q')
          quantity_sum(class_quantity)
          forecast_sum(class_unitary)

  # Remove saved item
  $ ->
    $('#form-investment input:checkbox').click ->
      $('#form-investment input:checkbox').not(this).prop('checked', false) # only one item at time
      if $(this).is(':checked')
        class_item = $(this).attr('class')
        # Confirmation
        toastr.warning("<div><button type='button' class='button' id='okBtn'>Sim</button>" , 'Deseja excluir este ítem?')
        $ ->
          $('#okBtn').click ->
            item_quantity = class_item.replace(/u/, 'q')
            $("##{class_item}").val(0)
            $("##{item_quantity}").val(0)
            class_unitary = 'u' + class_item.slice(-7)
            class_quantity = 'q' + class_item.slice(-7)
            quantity_sum(class_quantity)
            forecast_sum(class_unitary)
            $('form').submit()



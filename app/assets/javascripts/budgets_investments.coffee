index = 1
addNewItem = (elId, elClass)->
  item = elClass.split('-')[0]
  year = elClass.split('-')[1]
  html = """
  <tr class="item new-item" data-category="c1-2016">
    <td class="action">
      <i class="fa fa-trash-o"></i>
      <input name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]" type="hidden" value="0"><input type="checkbox" value="1" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]">
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

forecast_sum = (class_item) ->
  q = class_item.replace(/u/, 'q')
  forecast = class_item.replace(/u/, 'f')
  quant = $("##{q}").val()
  subtotal = 0
  $(document).find(".#{class_item}").each (item) ->
    subtotal += $(this).val()*1
    return
  $("##{class_item}").val(subtotal)
  $("##{forecast}").val(subtotal * quant)
  group_sum(class_item)

quantity_sum = (class_item) ->
  subtotal = 0
  $(document).find(".#{class_item}").each (item) ->
    subtotal += $(this).val()*1
    return
  $("##{class_item}").val(subtotal)

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
  for year in [2016..2019]
    $("[data-category='1-#{year}']").after $("[data-category='c1-#{year}']")
    $("[data-category='2-#{year}']").after $("[data-category='c2-#{year}']")
    $("[data-category='3-#{year}']").after $("[data-category='c3-#{year}']")

  $(document).on 'change', ".investment-input", ->
    for year in [2016..2019]
      for categorie in [1..20]
        forecast_sum("uc#{categorie}y#{year}")
    return

  $('.fa-plus').click (event) ->
    event.preventDefault()
    elClass = $(this).attr('class').split(' ')[2]
    elId = $(this).attr('id')
    addNewItem(elId, elClass)

  $('input[type="checkbox"]').click ->
    if $(this).is(':checked')
      console.log $(this).attr('class')


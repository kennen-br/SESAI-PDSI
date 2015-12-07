index = 1
addNewItem = (elId, elClass)->
  item = elClass.split('-')[0]
  year = elClass.split('-')[1]
  html = """
  <tr class="item new-item" data-category="c1-2016">
    <td class="action">
      <i class="fa fa-trash-o"></i>
      <input name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]" type="hidden" value="0"><input type="checkbox" value="1" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]" id="pdsi_budget_investments_attributes_#{item-1}_investment_items_attributes_#{elId+index}__destroy">
    </td>
    <td class="field">
      <input type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][name]" id="pdsi_budget_investments_attributes_#{item-1}_investment_items_attributes_#{elId+index}_name">
    </td>
    <td>
      <input type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][quantity_2016]" id="pdsi_budget_investments_attributes_3_investment_items_attributes_#{elId+index}_quantity_2016">
    </td>
    <td>
      <input value="0" type="hidden" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][unitary_amount_2016]" id="pdsi_budget_investments_attributes_3_investment_items_attributes_#{elId+index}_unitary_amount_2016"><input type="text" name="" id="" value="0" class="currency-input">
    </td>
    <td>
      <input value="0" type="hidden" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][forecast_amount_2016]" id="pdsi_budget_investments_attributes_3_investment_items_attributes_#{elId+index}_forecast_amount_2016"><input type="text" name="" id="" value="0" class="currency-input">
    </td>
  </tr>
  """
  $("#i#{elId}").after html
  index++
  console.log(elId + index)

$(document).ready ->
  for year in [2016..2019]
    $("[data-category='1-#{year}']").after $("[data-category='c1-#{year}']")
    $("[data-category='2-#{year}']").after $("[data-category='c2-#{year}']")
    $("[data-category='3-#{year}']").after $("[data-category='c3-#{year}']")

  $('.fa-plus').click (event) ->
    event.preventDefault()
    elClass = $(this).attr('class').split(' ')[2]
    elId = $(this).attr('id')
    addNewItem(elId, elClass)

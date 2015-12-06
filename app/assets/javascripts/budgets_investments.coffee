index = 1
addNewItem = (elId, elClass)->
  item = elClass.split('-')[0]
  year = elClass.split('-')[1]
  html = """
  <tr class="nested-fields structure-block new-object">
    <td class="field">
      <input type="text" name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][name]" id="pdsi_budget_investments_attributes_#{item-1}_investment_items_attributes_#{elId+index}_name">
    </td>
    <td class="field destroy">
      apagar?<input name="pdsi[budget_investments_attributes][#{item-1}][investment_items_attributes][#{elId+index}][_destroy]" type="hidden" value="0"><input type="checkbox" value="1" name="pdsi[budget_investments_attributes][3][investment_items_attributes][#{elId+index}][_destroy]" id="pdsi_budget_investments_attributes_#{item-1}_investment_items_attributes_#{elId+index}__destroy">
    </td>
    <td class="field">
      -
    </td>
    <td class="field">
      -
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

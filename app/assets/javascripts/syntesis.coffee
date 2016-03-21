string_to_number = (string) ->
  parseFloat(string.html().replace(/(R\$|\.)/g, '').replace(/\,/, '.'))

number_to_string = (number) ->
  "R$ #{(number).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}"

$(document).ready ->
  if location.pathname.match('ver/projecao-orcamentaria')
    sum_synthesis()
    sum_synthesis_total()
    sum_synthesis_rows()
    sum_balance()
    colorize_balance()

sum_synthesis = ->
  for cost_type in ['cost_', 'invest_']
    for year in [2016..2019]
      sum = 0
      $(".#{cost_type}#{year}").each ->
        cost = string_to_number($(this))
        if !isNaN(cost) and cost.length != 0
          sum += parseFloat(cost)
      $("##{cost_type}#{year}").html(number_to_string(sum))

sum_synthesis_rows = ->
  $('#synthesis tr').each ->
    sum = 0
    $(this).find('.cost').each ->
      cost = string_to_number($(this))
      if !isNaN(cost) and cost.length != 0
        sum += parseFloat(cost)
      return
    $('.sum-cost', this).html(number_to_string(sum))
    return
  return

sum_synthesis_total = ->
  for year in [2016..2019]
    obj = "invest_#{year}" : string_to_number($("#invest_#{year}")),
    "cost_#{year}": string_to_number($("#cost_#{year}"))

    $("#total_#{year}").html(number_to_string(obj["invest_#{year}"] + obj["cost_#{year}"]))

sum_balance = ->
  balance_2016_2019 = string_to_number($("#sesai_cost_2016_2019")) - string_to_number($("#cost_2016_2019"))
  $("#balance_cost_2016_2019").html(number_to_string(balance_2016_2019))

  for year in [2016..2019]
    obj = "sesai_cost_#{year}" : string_to_number($("#sesai_cost_#{year}")),
    "cost_#{year}": string_to_number($("#cost_#{year}"))

    $("#balance_cost_#{year}").html(number_to_string(obj["sesai_cost_#{year}"] - obj["cost_#{year}"]))

colorize_balance = ->
  $('#balance').each ->
    $(this).find('td').each ->
      cost = string_to_number($(this))
      if !isNaN(cost) and cost < 0
        $(this).css({'color' : 'red'})
      else if isNaN(cost)
      else
        $(this).css({'color' : 'green'})

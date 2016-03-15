$(document).ready ->
  sum_synthesis()
  sum_synthesis_total()
  sum_synthesis_rows()

sum_synthesis = ->
  for cost_type in ['cost_', 'invest_']
    for year in [2016..2019]
      sum = 0
      $(".#{cost_type}#{year}").each ->
        cost = parseFloat($(this).html().replace(/(R\$|\.)/g, '').replace(/\,/, '.'))
        if !isNaN(cost) and cost.length != 0
          sum += parseFloat(cost)
      $("##{cost_type}#{year}").html("R$ #{(sum).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

sum_synthesis_rows = ->
  $('#synthesis tr').each ->
    sum = 0
    $(this).find('.cost').each ->
      cost = parseFloat($(this).html().replace(/(R\$|\.)/g, '').replace(/\,/, '.'))
      if !isNaN(cost) and cost.length != 0
        sum += parseFloat(cost)
      return
    $('.sum-cost', this).html("R$ #{(sum).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
    return
  return

sum_synthesis_total = ->
  for year in [2016..2019]
    a = "invest_#{year}" : parseFloat($("#invest_#{year}").html().replace(/(R\$|\.)/g, '').replace(/\,/, '.')),
    "cost_#{year}": parseFloat($("#cost_#{year}").html().replace(/(R\$|\.)/g, '').replace(/\,/, '.'))

    $("#total_#{year}").html("R$ #{(a["invest_#{year}"] + a["cost_#{year}"])
    .toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")



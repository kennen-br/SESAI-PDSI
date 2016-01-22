$(document).on 'change', '.village-population', ->
  sum = 0
  $(this).find('.population-count').each ->
    population = $(this).val()
    if !isNaN(population) and population.length != 0
      sum += population * 1
    return
  $(this).find('.population-total').val sum
  return


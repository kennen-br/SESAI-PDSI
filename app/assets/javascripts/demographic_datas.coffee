$(document).ready ->
  $('.pdsi-fisiographic-data tr').each ->
    sum = 0
    $(this).find('.population').each ->
      population = $(this).text()
      if !isNaN(population) and population.length != 0
        sum += parseFloat(population)
      return
    $(this).find('.sum-population').html sum
    return

$(document).on 'change', '.village-population', ->
  sum = 0
  $(this).find('.population-count').each ->
    population = $(this).val()
    if !isNaN(population) and population.length != 0
      sum += population * 1
    return
  $(this).find('.population-total').val sum
  return


$(document).on 'click', '.remove', ->
  chk = $(this).parent().find('.remove-chk')
  notie.confirm 'Deseja realmente apagar este campo?', 'Sim', 'Cancelar', ->
    chk.prop('checked', true)
    $('form').submit()
    return
  return

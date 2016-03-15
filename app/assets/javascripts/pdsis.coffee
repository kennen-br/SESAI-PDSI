#Check if this script is executing from form_custeio
$ ->
  if $('#form-custeio').length > 0
    calculate_funding_balance()

turl = window.location.href

startLoading = ->
  $pace = $('<div></div>', { class: 'pace pace-active results-loading'})
  $pace.append $('<div></div>', { class: 'pace-activity' })
  $('body').prepend $pace
  return

stopLoading = ->
  $('.pace.results-loading').remove()
  return

calculate_funding_balance = ->
  # console.log "Calculating funding balance"
  for year in [2016..2019]
    subtotal = 0.0
    el1 = "#input-#{year}-3"
    el2 = "#input-#{year}-10"
    if (!isNaN(parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))))
      subtotal = parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    if (!isNaN(parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))))
      subtotal += parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    # Negative values
    el1 = "#input-#{year}-3-2"
    el2 = "#input-#{year}-10-2"
    if (!isNaN(parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))))
      subtotal -= parseFloat($(el1).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    if (!isNaN(parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))))
      subtotal -= parseFloat($(el2).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    if subtotal>0
      $("#input-#{year}-0").val("R$#{(subtotal).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
      $("#input-#{year}-0").css({'color' : 'green'})
    else
      $("#input-#{year}-0").val("- R$#{(subtotal).toFixed(2).replace('-','').replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")
      $("#input-#{year}-0").css({'color' : 'red'})
  return

calculate_parent_total = (parent_id) ->
  subtotal2 = 0.0
  # console.log "Recalculating subtotals by group #{parent_id}"

  $(document).find(".#{parent_id}").each (item) ->
    input_value = parseFloat($(this).prop("value").toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    if (!isNaN(input_value))
      subtotal2 += parseFloat(input_value)
    return

  # Value for hidden form (subitems)
  $("#hidden-#{parent_id}-2").val(parseFloat(subtotal2).toFixed(2))

  # Value for show form (subitems)
  $("#input-#{parent_id}-2").val("R$#{(subtotal2).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

  #Calculate parent totals
  if ($("#input-#{parent_id}-2").attr('cost_type') == '2')
    calculate_parent_total $("#input-#{parent_id}-2").attr('year_parent_id')

  calculate_funding_balance()
  return

# SEND COMMENT
$(document).on 'click', '.budget .modal.comments .send-comment', ->
  $this  = $(this)
  $field = $this.prev()
  $modal = $this.parents('.modal-inner:eq(0)')

  id = $this.data('id')
  year = $this.data('year')
  comment = $field.val()

  if comment.trim() == ''
    toastr.error 'Comentário em branco'
    return false

  params = { 'comment' : {}}
  params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

  params['comment']['budget_id'] = id
  params['comment']['year'] = year
  params['comment']['comment'] = comment

  startLoading()

  url = $('#budget-new-comment-url').val()
  $.post url, params, (data) ->
    stopLoading()
    $field.val('')

    $modal.find('.comments-list .comment.empty').remove()
    $modal.find('.comments-list table').removeClass('hidden')
    $modal.find('.comments-list table tbody').append(data)

    toastr.success 'Comentário enviado.'
    return
  return

# DELETE COMMENT
$(document).on 'click', '.budget .modal.comments .delete-comment', ->
  $this  = $(this)
  $field = $this.prev()
  $modal = $this.parents('.modal-inner:eq(0)')

  id = $this.data('id')

  params = { 'comment' : {}}
  params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

  params['comment']['id'] = id

  startLoading()

  url = $('#budget-delete-comment-url').val()
  $.post url, params, (data) ->
    stopLoading()

    $modal.find('.comments-list .comment.empty').remove()
    $modal.find('.comments-list table').removeClass('hidden')
    $modal.find('.comments-list table tbody tr.comment[data-id="'+id+'"]').remove()

    toastr.success 'Comentário apagado.'
    return
  return

$(document).ready ->
  # Toggle Structures on Projeção Orçamentária show
  $('.budget-table.investiment .toggle-structures').click ->
    $(this).toggleClass('fa-plus-square-o').toggleClass 'fa-minus-square-o'
    index = $(this).parents('tr.item').data 'index'
    $(".budget-table.investiment .structure[data-index='#{index}']").toggle()
    return

  # Sum up all investiments to years 2016-2019 on a final table
  $('.budget-table.investiment.total').each ->
    $total    = $(this)
    $carousel = $total.parent()

    # Categories
    $categories = $carousel.prev().find('.category').clone()
    $categories.each ->
      id = $(this).data 'category'
      total = 0
      $carousel.prevAll().each ->
        value = $(this).find(".category[data-category='#{id}'] td:last-child").text() || '0'
        value = value.replace('R$', '')
        value = value.replace('.', '')
        value = value.replace(',', '.')

        total += (value*1)
        return

      $(this).find('td').eq(1).remove()
      $(this).find('td:last-child').text("R$ " + total.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.'))
      return

    $total.find('tbody').append $categories

    # Items
    $items = $carousel.prev().find('.item').clone()
    $items.find('td:eq(2), .toggle-structures').remove()

    $items.each ->
      index = $(this).data 'index'
      unidades = 0
      total = 0
      $carousel.prevAll().each ->
        value = $(this).find(".item[data-index='#{index}'] td:last-child").text() || '0'
        value = value.replace('R$', '')
        value = value.replace('.', '')
        value = value.replace(',', '.')
        total += (value*1)

        uni = $(this).find(".item[data-index='#{index}'] td:eq(1)").text() || '0'
        unidades += (uni*1)
        return
      $(this).find('td:eq(1)').text unidades
      $(this).find('td:last-child').text("R$ " + total.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.'))
      return

    $total.find('.category').each ->
      id = $(this).data 'category'
      $(this).after($items.filter("[data-category='#{id}']"))
      return
    return

  # Projeção Orçamentária
  $('.projection-structure-type').each ->
    $type = $(this)
    type = $type.find('> legend').text()

    # Years 2015-2019
    $type.find('.projection-year').each ->
      $year = $(this)

      atualizaTotal = ->
        qty   = parseInt($year.find('.structure-block').length) || 0
        value = $year.find('.currency-input').val() || 0
        value = parseFloat(value.toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))

        $year.find('.total-sum strong').text "R$ #{(qty * value).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}"
        return

      # Calculate the total money necessary for the structures
      atualizaTotal()
      $year.find('.structure-qty, .currency-input').on 'change', atualizaTotal

      # Show/Hide the forms for new structures
      $year.find('.structure-qty').on 'change', ->
        value = $(this).val()

        if $year.find('> legend').text() == '2015'
          # console.log '2015'
          needed = value - ($type.find('.initial-value').val() || 0)
        else
          needed = value

        $year.find('table tr.new-object').each ->
          $(this).remove() if $(this).find(':text').val() == ''
          return

        needed -= $year.find('table tbody tr').length

        if needed > 0
          $year.find('.new-structures').show()
        else if $year.find('table tbody tr').length == 0
          $year.find('.new-structures').hide()

        for i in [1..needed] by 1
          $year.find('.add_fields').click()
        return
      return
    return

  # Recalculate values for 2017-2019 based on 2016 and correction factors
  $(document).on 'change', '.2016-budget-value', ->
    # console.log 'Recalculating budgets for years 2017-2019'
    idx = $(this).attr('input_index')
    val = parseFloat($(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))
    group_parent_id = $(this).attr('group_parent_id')

    for year in [2017..2019]
      el = "#input-#{year}-#{idx}"
      cf = $(el).attr('correction_factor')
      year_parent_id = "#{year}-#{group_parent_id}"
      val += val*cf

      # console.log "Recalculating #{el} using correction factor #{cf}: #{val}"
      # Value for hidden form
      $("#hidden-#{year}-#{idx}").val(val.toFixed(2))

      # Value for show form
      $(el).val("R$#{(val).toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, '$1.')}")

      value_index = $(el).attr('value_index')
      if group_parent_id > 0
        calculate_parent_total(year_parent_id)
      if value_index == "3" || value_index == "10"
        calculate_funding_balance()
    return

  # Update subtotals by group of contracts
  $(document).on 'change', '.2015-group-value, .2016-group-value, .2017-group-value, .2018-group-value, .2019-group-value', ->
    year_parent_id = $(this).attr('year_parent_id')
    year_cost_id = $(this).attr('year_cost_id')
    value = $(this).val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.')
    #$("#hidden-#{year_cost_id}").attr("value", value)
    calculate_parent_total(year_parent_id)
    return

  # Add new rows to the tables and bind events to new fields
  $('.add_new_row').click ->
    # Start showing loading
    startLoading()
    turl = window.location.href
    if turl.lastIndexOf("?") > 0
      url = turl.substr(0, turl.lastIndexOf("?")) + '/new_budget_forecast_by_cost'
    else
      url = turl.substr(0, turl.lastIndexOf("/")+1) + 'new_budget_forecast_by_cost'
    # Prepare POST params
    params = {}
    params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
    parent_id = $(this).attr('id')
    params['parent_id'] = parent_id
    params['cost_type'] = 3
    $.post url, params, (data) ->
      id = data.cost_id
      html = {}
      last_id = 0
      bfcount = data.bfcount * 4
      $(document).find(".2016-#{parent_id}").each (item) ->
        if parseInt($(this).attr('value_index')) > parseInt(last_id)
          last_id = $(this).attr('value_index')
      for year in [2016..2019]
        style = ''
        #check if element is hidden
        if $("#tr-#{year}-#{last_id}").css('display') == 'none'
          style = '="display: none;"'
        #bcf
        if year!=2016
          bcf = $("#bcf-#{year}").attr('bcf')
        else
          bcf = 0
        html[year] = """
        <tr class="structure" data-index="#{year}-#{parent_id}" id="#{id}" style#{style}>
          <td>
            <input type="text" id="input-nome-custo-#{id}-#{year}" cost_id="#{id}">
          </td>
          <td></td>
          <td>
            <input value="0" id="hidden-#{year}-#{id}-2" type="hidden" name="pdsi[budget_forecasts_attributes][#{bfcount}][dsei_forecast_#{year}]" >
            <input type="text" name id="input-#{year}-#{id}-2" value="0,00" class="currency-input #{year}-budget-value #{year}-group-value #{year}-#{parent_id}" group_parent_id="#{parent_id}" year_parent_id="#{year}-#{parent_id}" input_index="#{id}-2" correction_factor="#{bcf}" year_cost_id="#{year}-#{id}" value_index="#{id}" cost_type="3" disabled="disabled">
          </td>
          <td></td>
        </tr>
        <input type="hidden" value="#{data.id}" name="pdsi[budget_forecasts_attributes][#{bfcount}][id]" id="pdsi_budget_forecasts_atributes_#{bfcount}_id">
        """
        bfcount++
        # Insert HTML
        $("#tr-#{year}-#{last_id}").after html[year]
        # Update cost name on change (event binding)
        $("#input-nome-custo-#{id}-#{year}").on 'change', ->
          id = $(this).attr('cost_id')
          startLoading()
          params = {}
          # console.log $(this).val()
          params['cost_name'] = $(this).val()
          params['cost_id'] = $(this).attr('cost_id')
          # console.log "Nome: #{params['cost_name']}, id: #{params['cost_id']}"
          if turl.lastIndexOf("?") > 0
            url = turl.substr(0, turl.lastIndexOf("?")) + '/update_cost_name'
          else
            url = turl.substr(0, turl.lastIndexOf("/")+1) + 'update_cost_name'
          params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
          $.post url, params, (data2) ->
            if data2.status
              # Find all fields and update them
              for year in [2016..2019]
                $("#input-nome-custo-#{params['cost_id']}-#{year}").val(params['cost_name'])
              stopLoading()
            else
              # Alert the user it couldn't save on database
              alert "Não foi possível mudar o nome"
              stopLoading()
            return
          return

        # Money mask and hidden field data update
        $("#input-#{year}-#{id}-2").on 'change', ->
          $this = $(this)
          value = $this.val().replace(/^R\$/g, '').replace(/\./g, '').replace(',', '.')
          $this.prev().val value
          return
        $("#input-#{year}-#{id}-2").maskMoney
          prefix: 'R$'
          thousands: '.'
          decimal: ','
        # Stop showing loading
        stopLoading()
    return

  # TOGGLE OVERLAY WHEN MODAL IS OPENED
  $(document).on 'change', '.modal-state', ->
    if $(this).is(":checked")
      $("body").addClass "modal-open"
    else
      $("body").removeClass "modal-open"
    return

  # OPEN MODAL MODAL WITH COMMENTS
  $(document).on 'click', '.budget-table .budget-actions .toggle-comments', ->
    $this = $(this)

    $budget = $this.parents('tr.budget:eq(0)')
    $modal = $budget.find('> td .modal.comments')
    comments = $budget.find('.comment.colored-border.empty')

    $modal.find('.modal-state').click()

    if $budget.find('.budget-actions .unread-comment').length > 0
      comment_id = $budget.find('.budget-actions .unread-comment').data('commentId')
      readComment(comment_id, $budget.find('.budget-actions .unread-comment'))

    # console.log(comments.html()) if comments.html()
    return

  # MARK A COMMENT AS READ
  readComment = (comment_id, $comment) ->
    params = {}

    params['comment'] = comment_id
    params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
    url = $('#budget-see-comment-url').val()

    $.post url, params, (data) ->
      $comment.remove() if data.status
      return
    return
  return

$(document).on 'click', '.modal-window.investment', ->
  icon =  $(this).parent().parent().find('i')

  if $(this).find('.user').html()
    icon.addClass('fa-comments red').removeClass('fa-comment')
  else
    icon.addClass('fa-comment').removeClass('fa-comments red')

expect_result_color = (item) ->
  $this = item
  initial_forecast = $this.parent().prev('td').find('input').val()
  dsei_forecast = parseFloat($this.val().toString().replace(/(^R\$|\.)/g, '').replace(/\,/, '.'))

  if dsei_forecast > initial_forecast
    $this.css({'color' : 'red'})
  else
    $this.css({'color' : 'green'})
  return

$(document).ready ->
  $('.expected-result-field').each ->
    expect_result_color($(this))
  sum_synthesis()
  sum_synthesis_total()
  sum_synthesis_rows()

# Mark input for PDSI Results as red or green
$(document).on 'change', '.expected-result-field', ->
  expect_result_color($(this))

$(document).on 'blur', '.expected-result-modfier', ->
  $('.expected-result-field').each ->
    _this = $(this)
    setTimeout (->
      expect_result_color _this
    ), 100

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


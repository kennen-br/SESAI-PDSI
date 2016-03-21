startLoading = ->
  $pace = $('<div></div>', { class: 'pace pace-active results-loading' })
  $pace.append $('<div></div>', { class: 'pace-activity' })
  $('body').prepend $pace
  return

stopLoading = ->
  $('.pace.results-loading').remove()
  return

# SEND justifier
$(document).on 'blur', '.budget .modal.justifiers', ->
  $this  = $(this)
  $field = $this.find('textarea')
  $modal = $this.parents('.modal-inner:eq(0)')

  id = $field.attr('id')
  justifier = $field.val()

  if justifier.trim() == ''
    toastr.error 'Justificativa em branco'
    return false

  params = { 'justifier' : {}}
  params["utf8"] = "✓"
  params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

  params['justifier']['budget_investment_id'] = id
  params['justifier']['description'] = justifier

  startLoading()

  url = $('#budget-edit-justifier-url').val()

  $.post url, params, (data) ->
    stopLoading()

    $modal.find('.justifiers-list .justifier.empty').remove()
    $modal.find('.justifiers-list table').removeClass('hidden')
    $modal.find('.justifiers-list table tbody').append(data)

    toastr.success 'Justificativa enviada.'
    return
  return

# OPEN MODAL MODAL WITH justifierS
$(document).on 'click', '.budget-table .budget-justifier-actions .toggle-justifiers', ->
  $this = $(this)

  $budget = $this.parents('tr.budget:eq(0)')
  $modal = $budget.find('> td .modal.justifiers')
  justifiers = $budget.find('.justifier.colored-border.empty')

  $modal.find('.modal-state').click()

  if $budget.find('.budget-actions .unread-justifier').length > 0
    justifier_id = $budget.find('.budget-actions .unread-justifier').data('justifierId')
    readjustifier(justifier_id, $budget.find('.budget-actions .unread-justifier'))

  return

# TOGGLE OVERLAY WHEN MODAL IS OPENED
$(document).on 'change', '.modal-state', ->
  if $(this).is(":checked")
    $("body").addClass "modal-open"
  else
    $("body").removeClass "modal-open"
  return

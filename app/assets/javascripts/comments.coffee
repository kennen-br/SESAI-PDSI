startLoading = ->
  $pace = $('<div></div>', { class: 'pace pace-active results-loading'})
  $pace.append $('<div></div>', { class: 'pace-activity' })
  $('body').prepend $pace
  return

stopLoading = ->
  $('.pace.results-loading').remove()
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

# TOGGLE OVERLAY WHEN MODAL IS OPENED
$(document).on 'change', '.modal-state', ->
  if $(this).is(":checked")
    $("body").addClass "modal-open"
  else
    $("body").removeClass "modal-open"
  return

$(document).on 'click', '.modal-window.investment', ->
  icon =  $(this).parent().parent().find('i')

  if $(this).find('.user').html()
    icon.addClass('fa-comments red').removeClass('fa-comment')
  else
    icon.addClass('fa-comment').removeClass('fa-comments red')


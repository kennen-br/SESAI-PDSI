$(document).ready ->

  # Basic
  $('textarea.basic-editable').on 'editable.initialized', (e, editor) ->
    setTimeout( ->
      console.log 'froala'
      $(".froala-box div:contains('Unlicensed Froala Editor')").hide()
    , 1000)
    return
  $('textarea.basic-editable').each ->
    limit = $(this).data('limit') || 2500
    $(this).editable
      maxCharacters: limit
      buttons: [
        'bold'
        'italic'
        'underline'
        'strikeThrough'
        'sep'
        'formatBlock'
        'align'
        'indent'
        'outdent'
        'sep'
        'insertOrderedList'
        'insertUnorderedList'
        'sep'
        'createLink'
        'insertImage'
        'insertHorizontalRule'
        'undo'
        'redo'
        'fullscreen'
      ]
      inlineMode: false
      imageUploadParam: 'image'
      imageUploadURL: '/image-upload'
      imageUploadParams:
        authenticity_token: $('input[name=authenticity_token]').val()
    return

  return

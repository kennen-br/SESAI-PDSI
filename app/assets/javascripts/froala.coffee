$(document).ready ->

  # Basic
  $('textarea.basic-editable').editable
    inlineMode: false
    imageUploadParam: 'image'
    imageUploadURL: '/image-upload'
    imageUploadParams: { authenticity_token: $('input[name=authenticity_token]').val() }

  $('textarea.basic-editable').on 'editable.initialized', (e, editor) ->
    $(".froala-box div:contains('Unlicensed Froala Editor')").hide()
    return

  return
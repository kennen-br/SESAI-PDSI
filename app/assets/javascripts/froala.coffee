$(document).ready ->

  # Basic
  $('textarea.basic-editable').on 'editable.initialized', (e, editor) ->
    setTimeout( ->
      console.log 'froala'
      $(".froala-box div:contains('Unlicensed Froala Editor')").hide()
    , 1000)
    return
  $('textarea.basic-editable').editable
    inlineMode: false
    imageUploadParam: 'image'
    imageUploadURL: '/image-upload'
    imageUploadParams: { authenticity_token: $('input[name=authenticity_token]').val() }

  return

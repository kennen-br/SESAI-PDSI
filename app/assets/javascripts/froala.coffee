$(document).ready ->

  # Basic
  $('textarea.basic-editable').editable
    inlineMode: false
    imageUploadParam: 'image'
    imageUploadURL: '/image-upload'
    imageUploadParams: { authenticity_token: $('input[name=authenticity_token]').val() }
  return
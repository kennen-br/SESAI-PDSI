$ ->
  $(".modal-window").on "click", ->
    $(".modal-state:checked").prop("checked", false).change()
    return

  $(".modal-inner").on "click", (e) ->
    e.stopPropagation()
    return

  return


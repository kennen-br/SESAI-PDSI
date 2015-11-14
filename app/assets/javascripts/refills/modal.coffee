$ ->
  $(document).on "click", ".modal-window", (e) ->
    if e.target == this
      $(".modal-state:checked").prop("checked", false).change()
    return
  return


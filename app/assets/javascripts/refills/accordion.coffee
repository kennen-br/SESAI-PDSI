$(document).ready ->
  $(".js-accordion-trigger").on "click", (e) ->
    e.stopPropagation()
    unless $(this).parent().hasClass 'is-expanded'
      $(this)
        .parents('.accordion')
        .find('.is-expanded')
        .removeClass('is-expanded')
        .find(".submenu, .accordion-content")
        .slideToggle "fast"
    $(this).parent().find(".submenu, .accordion-content").slideToggle "fast" # apply the toggle to the ul
    $(this).parent().toggleClass "is-expanded"
    e.preventDefault()
    return
  return

$(document).ready ->
  $(".accordion-tabs-minimal").each (index) ->
    if $(this).find('.default-active').length == 0
      $(this).children("li").first().children("a").addClass("is-active").next().addClass("is-open").show()
    else
      $(this).find('.default-active').children("a").addClass("is-active").next().addClass("is-open").show()
    return

  $(".accordion-tabs-minimal:not(.active-links)").on "click", "> li > a", (event) ->
    unless $(this).hasClass("is-active")
      event.preventDefault()
      accordionTabs = $(this).closest(".accordion-tabs-minimal")
      accordionTabs.find(".is-open").removeClass("is-open").hide()
      $(this).next().toggleClass("is-open").toggle()
      accordionTabs.find(".is-active").removeClass "is-active"
      $(this).addClass "is-active"
    else
      event.preventDefault()
    return

  return


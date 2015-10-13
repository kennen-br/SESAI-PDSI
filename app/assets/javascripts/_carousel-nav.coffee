# When pressing the arrow keys
$(document).ready ->

  navigate = (dir) ->
    $('.carousel-nav:visible').each ->
      $(this).find(".carousel-arrows a.pull-#{dir}").click()
      return
    return

  $(document).keyup (e) ->
    switch e.which
      when 39 then navigate('right')
      when 37 then navigate('left')
      else return false
    return

  $('.carousel-nav').each ->
    $nav = $(this)

    animationClasses = "fadeInLeft fadeOutLeft fadeInRight fadeOutRight"
    animationEnd     = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
    $nav.find('.carousel-items .item-content').on animationEnd, ->
      $(this).removeClass animationClasses

    set_list_position = (c_index) ->
      w = 0
      $c_link = $nav.find(".carousel-list a[data-index='#{c_index}']")
      $c_link.prevAll().map ->
        w -= $(this).outerWidth(true)

      max = 0
      $nav.find('.carousel-list a').map ->
        max -= $(this).outerWidth(true)
      max += $nav.find('.carousel-list').outerWidth(true)

      w = w + ($nav.find('.carousel-list').outerWidth(true) / 2) - ($c_link.outerWidth(true) / 2)

      if w > 0
        w = 0
      else if w < max
        w = max

      $nav.find('.carousel-list .slider').css 'margin-left', w
      return

    change_item = (p_index, c_index) ->
      set_list_position(c_index)

      in_dir  = if p_index < c_index then 'Right' else 'Left'
      out_dir = if in_dir == 'Left' then 'Right' else 'Left'

      $current  = $nav.find(".carousel-items .item-content[data-index='#{c_index}']")
      $previous = $nav.find(".carousel-items .item-content[data-index='#{p_index}']")

      $previous.addClass "fadeOut#{out_dir}"
      $current.addClass "is-active fadeIn#{in_dir}"

      $previous.one animationEnd, ->
        return false if $(this).data('index') == $nav.find('.carousel-list .is-active').data('index')
        $(this).removeClass "is-active"

      return

    # When clicking the arrows
    $nav.on 'click', '.carousel-arrows a', ->
      dir     = $(this).attr('class').replace 'pull-', ''
      $p_link = $nav.find('.carousel-list a.is-active')

      if (dir == 'left' && $p_link.is(':first-child')) || (dir == 'right' && $p_link.is(':last-child'))
        console.log 'EXIT'
        return false

      p_index = $p_link.data 'index'
      c_index = if dir == 'left' then p_index - 1 else p_index + 1

      if dir == 'left'
        $c_link = $nav.find(".carousel-list a[data-index='#{c_index}']")
      else
        $c_link = $nav.find(".carousel-list a[data-index='#{c_index}']")

      $p_link.removeClass 'is-active'
      $c_link.addClass 'is-active'

      change_item(p_index, c_index)
      return

    # When clicking the links directly
    $nav.on 'click', '.carousel-list a', ->
      $p_link = $nav.find('.carousel-list a.is-active')
      $c_link = $(this)

      p_index   = $p_link.removeClass('is-active').data 'index'
      c_index   = $c_link.addClass('is-active').data 'index'

      change_item(p_index, c_index)

      return
    return
  return
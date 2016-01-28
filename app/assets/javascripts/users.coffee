# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # PEOPLE SEARCH
  peopleTime = null
  $('#user_profile_attributes_name').keyup (e) ->
    
    e.stopPropagation()
    return false if ($('#user_dsei_id').val() < 1)
    if $(this).val().trim() == ''
      clearPeopleSearch($(this).parent())
      clearTimeout(peopleTime) if peopleTime

    return false if (e.which < 48 || e.which > 90)
    clearTimeout(peopleTime) if peopleTime

    $this = $(this)
    $people = $this.parent()

    return false if $this.val().trim().length < 3
    startLoading()
    value = $this.val()

    $people.find('ul').show()
    $people.find('.loading').show()
    $people.find('ul').addClass 'searching'
    $people.find('.clear-search').hide()
    $people.find('ul .new-person').remove()

    peopleTime = setTimeout( ->
      params = {}
      params['query'] = value
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      $.post '/procurar-pessoa', params, (data) ->
        stopLoading()
        $people.find('.fa').toggle()
        if data.length == 0
          $people.find('ul').append('<li class="new-person empty">Nenhuma pessoa encontrada.</li>')
        else
          $.each data, (key, person) ->
            $li = personSearchCheckbox(person, true)
            if $people.find("ul .person input[data-person-id='#{person.id}']").length > 0
              $li.find('input').prop 'checked', true
            $people.find('ul').append($li)
            return
        return
      , 'json'
    , 1000)
    return

  # CLEAR PEOPLE SEARCH
  $('.users-people').on 'click', '.users-clear-search', ->
    clearPeopleSearch($(this).parent())
    return

  # CLEAR PEOPLE SEARCH
  clearPeopleSearch = ($people) ->
    $people.find('.search').val('')
    $people.find('ul .new-person').remove()
    $people.find('ul').removeClass('searching')
    $people.find('.fa').hide()
    $people.find('ul').hide()
    return

  # ADD NEW PERSON CHECKBOX ON SEARCH SUCCESS
  personSearchCheckbox = (person, new_person) ->
    klass = if new_person then 'new-person' else 'person'
    $li = $("<li></li>")
    $li.addClass(klass)
    $label = $('<label></label>', { class: 'people-checkbox' })
    $label.html("<input type='checkbox' data-person-id='#{person.id}' /><strong>#{person.name}</strong> <span>(#{person.location})</span>")
    $li.append $label
    $li

  removePerson = ($person) ->
    id = $person.find(':checkbox').data('id')
    if id?
      $person.addClass 'remove'
    else
      $person.remove()
    return

  # SHOW PACE LOADING
  startLoading = ->
    $pace = $('<div></div>', { class: 'pace pace-active results-loading'})
    $pace.append $('<div></div>', { class: 'pace-activity' })
    $('body').prepend $pace
    return

  # HIDE PACE LOADING
  stopLoading = ->
    $('.pace.results-loading').remove()
    return

  # ACCESS TYPE
  $('.user-type').each ->
    $this = $(this)
    $this.find('select').change ->
      if parseInt($(this).val()) in [4, 5]
        $('.user-dsei').show()
      else
        $('.user-dsei').hide()
      return
    return
  return
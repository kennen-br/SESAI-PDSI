# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('.field').on 'click', '.new-person .people-checkbox :checkbox', (e) ->
    $this = $(this)
    $people = $('#user_profile_attributes_name').parent()

    person  = {}
    person['id']       = $this.data 'personId'
    person['name']     = $this.next().text()
    person['location'] = $this.next().next().text().replace(/[()]/g, '')

    $people.find('p').show()
    $people.find('p').text("Selecionado: #{person['location']} (#{person['name']})")
    $('#people_id').val("#{person['id']}")

    $people.find('.search').val(person['name'])
    $people.find('ul .new-person').remove()
    $people.find('ul').removeClass('searching')
    $people.find('.fa').hide()
    $people.find('ul').hide()


  # PEOPLE SEARCH
  peopleTime = null
  $('#user_profile_attributes_name').keyup (e) ->
    if ($('#user_user_type_id').val()>3)
      e.stopPropagation()
      return false if ($('#user_dsei_id').val() < 1)

      return false if (e.which < 48 || e.which > 90)
      clearTimeout(peopleTime) if peopleTime

      $this = $(this)
      $people = $this.parent()

      return false if $this.val().trim().length < 3
      value = $this.val()
      dsei_id = $('#user_dsei_id').val()

      unless $people.find('p').is(":visible")
        $people.find('ul').show()
      $people.find('.loading').show()
      $people.find('ul').addClass 'searching'
      $people.find('.clear-search').hide()
      $people.find('ul .new-person').remove()

      peopleTime = setTimeout( ->
        params = {}
        params['query'] = value
        params['dsei_id'] = dsei_id
        params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
        $.post '/procurar-pessoa-com-dsei', params, (data) ->
          $people.find('.fa').toggle()
          if data.length == 0
            if $people.find('p').is(":visible")
              $people.find('ul').removeClass('searching')
              $people.find('.fa').hide()
              $people.find('ul').hide()
            else
              if $people.find('p').is(":visible")
                $people.find('ul').show()
              $people.find('ul').append('<li class="new-person empty">Nenhuma pessoa encontrada.</li>')
          else
            if $people.find('p').is(":visible")
              $people.find('ul').show()
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

  # CLEAR PEOPLE ON DSEI CHANGE
  $('#user_dsei_id').change ->
    clearPeopleSearch($('#user_profile_attributes_name').parent())
    return

  # CLEAR PEOPLE SEARCH
  $('.users-people').on 'click', '.users-clear-search', ->
    clearPeopleSearch($(this).parent())
    return

  # CLEAR PEOPLE SEARCH
  clearPeopleSearch = ($people) ->
    $('#people_id').val('')
    $people.find('.search').val('')
    $people.find('ul .new-person').remove()
    $people.find('ul').removeClass('searching')
    $people.find('.fa').hide()
    $people.find('ul').hide()
    $people.find('p').hide()
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

  # ACCESS TYPE
  $('.user-type').each ->
    $this = $(this)
    $this.find('select').change ->
      if parseInt($(this).val()) in [4, 5]
        $('.user-dsei').show()
      else
        clearPeopleSearch($('#user_profile_attributes_name').parent())
        $('.user-dsei').hide()
      return
    return
  return
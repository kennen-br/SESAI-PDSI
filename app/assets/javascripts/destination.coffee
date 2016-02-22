select_city = ->
  $('.city-select').select2
    dropdownAutoWidth : true
    minimumInputLength: 1
    minimumResultsForSearch: 100
    ajax:
      url: '/locations/cities.json'
      dataType: 'json'
      type: 'GET'
      data: (params) ->
        queryParameters = term: params.term
        queryParameters
      processResults: (data) ->
        results: $.map data, (item) ->
          { text: item.city, id: item.city }
  return

sum_total_travel = ->
  $('.transport').each ->
    sum = ['00:00', '00:00', '00:00']
    $(this).find('.travel-time:input:text').each (i, e)->
      sum[i] = $(this).val() if $(this).val()
      return
    $(this).find('.total-travel').val sum_time(sum[0], sum[1], sum[2])
    return

sum_time = (t1, t2, t3) ->
  return formatTime(timestrToSec(t1) + timestrToSec(t2) + timestrToSec(t3))

timestrToSec = (timestr) ->
  parts = timestr.split(':')
  parts[0] * 3600 + parts[1] * 60

pad = (num) ->
  if num < 10
    '0' + num
  else
    '' + num

formatTime = (seconds) ->
  [
    pad(Math.floor(seconds / 3600) % 60)
    pad(Math.floor(seconds / 60) % 60)
  ].join ':'

$(document).on 'click', '.radio_destination_class', (e) ->
  $this   = $(this)
  parent  = $this.parent().parent().parent().parent()

  if $this.val() == 'aldeia'
    parent.children('.destination_village').show()
    parent.children('.destination_city').hide()
  if $this.val() == 'municipio'
    parent.children('.destination_village').hide()
    parent.children('.destination_city').show()
  return

$(document).on 'change', '.hide-field', (e) ->
  $this = $(this)
  if $this.data('equal') == $this.find(':selected').text()
    $this.parent().parent().find(".#{$this.data('field')}").prop('selectedIndex',0).hide()
  else
    $this.parent().parent().find(".#{$this.data('field')}").show()
  return

$(document).on 'change', '.destiny-transport :checkbox', ->
  $(this).parents('.destiny-transport').find('fieldset').toggle()
  return

$(document).on 'change', '.transport', ->
  sum_total_travel()
  return

$(document).ready ->
  # Generate a Default name for all new created EMSI on Capacidade Instalada form
  $('.base-polo-emsi .add_fields').click (e) ->
    $this = $(this)
    node = $this.data 'association-insertion-node'
    setTimeout( ->
      # console.log "#{node} .new.emsi-fieldset:last .emsi-name"
      field = $("#{node} .new.emsi-fieldset:last .emsi-name")
      count = $("#{node} .emsi-fieldset").length
      field.val "EMSI #{field.data('base-polo')}.#{count}"
      return
    , 100)
    return

  sum_total_travel()
  $('form').on 'cocoon:after-insert', ->
    $(".travel-time").mask("99:99")
    return

  $('form').on 'cocoon:after-insert', ->
    select_city()

  select_city()

  $('#destination-show').click ->
    $("#destination-show-0").click().parent().css({ 'border': "none"  })
    for link in [0..2]
      $("#destination-show-#{link}").parent().css({ 'border': "none"  })
    return

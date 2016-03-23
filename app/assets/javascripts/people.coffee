$(document).on 'click', '.add_person', (e) ->
  $this       = $(this)
  $parent     = $(this).parent()
  $select     = $parent.children 'select'
  $add_button = $parent.children 'a'
  $id         = $select.attr 'id'

  $select.hide()
  $add_button.hide()

  $new_div        = $('<fieldset><legend>Cadastrar pessoa</legend></fieldset>')
  $field          = $('<input type="text" />')
  $cancel_button  = $('<button id="cancel_person_button" class="button btn-sm pull-right cancel-button">Cancelar</button>')
  $save_button    = $('<button id="save_person_button" class="button btn-sm pull-right">Salvar</button>')

  $new_div.append($('<label>Nome da pessoa</label>'))
  $new_div.append $field
  $new_div.append $save_button
  $new_div.append $cancel_button
  $parent.append $new_div

  $cancel_button.click ->
    # TODO: Functionalize this
    $select.show()
    $add_button.show()
    $new_div.remove()
    return false

  $save_button.click ->
    $.post('/pessoas/cadastrar', { "name" : $field.val() }).done (data) ->
      # Validate response status, return false
      if !data.status
        alert data.message
        $field.css('border', 'solid 1px #c00')
        return

      # TODO: Functionalize this
      $select.show()
      $add_button.show()
      $new_div.remove()

      $option = $('<option></option>').html(data.name).attr('value', data.id)

      # $select.append $option
      $('select.select-dsei-person').append $option

      # Add new option to all selects
      # $('select.select-dsei-person').each (index) ->
      #   console.log index
      #   $(this).append $option
      #   return

      # Just to current select, set val as new value
      $select.val data.id
    return false

  return

$(document).ready ->
  $('#workforce').click ->
    $('#workforce-show').click().parent().css({ 'border': "none"  })
    return

$(document).ready ->
  $('.workforce').click ->
    setTimeout ->
      $('.workforce-show').click().parent().css({ 'border': "none"  })
    , 100
    return


  #$(".actions").sticky({topSpacing:0, className:"actions-fixed"});

  #$(".menu_estrutura ul .child a").innerHeight($(window).innerHeight()/4)

  # Add new behavior to cocoon add_fields button
  $('.expected-result.responsabilities').each  ->
    $fieldset = $(this)
    $original = $fieldset.find('.select-dsei-person:first')

    $fieldset.on 'click', '.add_fields', (e) ->
      $this = $(this)

      method = $this.data('association-insertion-method') || 'before'
      setTimeout( ->
        if method == 'append'
          $node = $this.parent().find('> :last-child')
        else
          $node = $this.parent().prev()

        if $node.find('.select-dsei-person').find('option').length != $original.find('option').length
          $node.find('.select-dsei-person').empty().html($original.html())
        return
      , 100)
      return
    return



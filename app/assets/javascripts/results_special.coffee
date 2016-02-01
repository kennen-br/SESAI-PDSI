# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('#result-index').each ->
    $page = $(this)

    applyDateMask = ($elements) ->
      $elements.each ->
        picker = new Pikaday
          field: $(this)[0]
          format: 'DD/MM/YYYY'
          yearRange: [2000,2020]
          i18n:
            previousMonth : 'Mês Antarior',
            nextMonth     : 'Próximo Mês',
            months        : ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
            weekdays      : ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
            weekdaysShort : ['Dom','Seg','Ter','Qua','Qui','Sex','Sab']
        return
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

    # START SORTABLE
    startSortable = ($list, tipo) ->
      $list.sortable
        items: '.resp-item'
        handle: '.sortable-icon'
        placeholder: "<div class='sortable-placeholder colored-bg'>#{tipo}</div>"
      .bind 'sortupdate', (e, ui) ->
        $parent = ui.item.parent()
        order = []
        $parent.find('> .resp-item').each (index) ->
          order.push { id: $(this).data('id'), order: index }
          return

        params = { 'order' : {}}
        params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
        params['order'] = order
        startLoading()

        url = $('#result-product-order-url', $page).val()
        $.post url, params, (data) ->
          stopLoading()
          toastr.success 'Ordem atualizada.'
          return
        return
      return

    applyDateMask $page.find('.date-field')


    ###
    # EVENT HANDLERS
    ###

    # MOUSE OVER IN CARROUSEL ICONS

    $('.carousel-list .slider a img').hover -> $(this).next().toggle( "visible" );

    # RESET TO DEFAULT VALUES
    $('.show-default-values').click ->
      current_id = $(this).attr("default-values-result-id")
      for year in [2016..2019]
        if $("#data_value_#{current_id}_#{year}").val() != $("#data_value_#{current_id}_#{year}").attr("data-limit")
          $("#data_value_#{current_id}_#{year}").val($("#data_value_#{current_id}_#{year}").attr("data-limit"))
          $("#data_value_#{current_id}_#{year}").change()
      if $("#global_#{current_id}").val() !=  $("#global_#{current_id}").attr("data-limit")
        $("#global_#{current_id}").val($("#global_#{current_id}").attr("data-limit"))
        $("#global_#{current_id}").change()

    # LINK PRODUCT TO ANOTHER DSEI
    # TO-DO
    
    # OPEN MODAL TO LINK PRODUCT TO ANOTHER DSEI
    $('.strategy', $page).on 'click', '.plano-anual .responsability .product .link-product-dsei', ->
      $this = $(this)

      $modal   = $('.modal.link-product-dsei', $page)
      $product = $this.parents('.product:eq(0)')

      product_id = $product.data('id')

      $modal.find('.fa').removeClass('fa-check-square-o').addClass('fa-square-o').removeData('newId')
      $modal.find('input.product-id').val(product_id)

      $modal.find('.modal-state').click()
    # SORTABLE
    $('.product .children').each ->
      startSortable $(this), 'AÇÃO'
      return
    $('.product-list').each ->
      startSortable $(this), 'PRODUTO'
      return
    # UPDATE A SPECIFIC RESULT
    $('.strategy', $page).on 'keyup', '.specific-result .result-products .value :input', (e) ->
      e.stopPropagation()
      return
    $('.strategy', $page).on 'change', '.specific-result .result-products .value :input', (e) ->
      $this = $(this)

      params = { 'specific_result' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

      params['specific_result']['field']     = $this.data('field')
      console.log $this.data('field')
      params['specific_result']['value']     = $this.val()
      params['specific_result']['result_id'] = $this.parents('.specific-result:eq(0)').data('resultId')

      startLoading()

      url = $('#result-specific-update-url', $page).val()
      $.post url, params, (data) ->
        stopLoading()
        flashField $this
        toastr.success 'Informação atualizada.'
        return
      return

    # CREATE A SPECIFIC RESULT
    $('.strategy .create-specific-result :input', $page).focus ->
      $this = $(this)

      original = $this.data('original')
      value = $this.val()

      if original == value
        $this.val('')
      return
    $('.strategy .create-specific-result :input', $page).blur ->
      $this = $(this)

      original = $this.data('original')
      value = $this.val()

      if  value.trim() == ''
        $this.val(original)
      return
    $('.strategy .create-specific-result .new-specific-result ', $page).click ->
      $this = $(this)
      strategy_id = $this.data('strategyId')
      j_value = $("#j_#{strategy_id}").last().val()
      $("#j_#{strategy_id}").val(parseInt(j_value)+1)
      name = "Descreva o resultado específico do DSEI [#{parseInt(Math.random()*1000000)}]"
      text = "Descreva o resultado "

      params = { 'specific_result' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      #RESULT NUMBER PARAM
      params['specific_result']['result_number'] = j_value
      #SPECIFIC RESULT PARAMS (OLD)
      params['specific_result']['name']     = name
      params['specific_result']['text']     = text
      params['specific_result']['strategy'] = strategy_id

      startLoading()

      url = $('#result-specific-result-url', $page).val()
      $.post url, params, (data) ->
        stopLoading()
        id = $(data).attr 'id'
        $("#specific_block_#{strategy_id}", $page).append(data)
        toastr.success 'Resultado específico adicionado.'
        startSortable $(".specific-results-block ##{id}").find('.product-list'), 'PRODUTO'
        return
      return

    # RESULT DESCRIPTION TEXT CHANGE
    $('.strategy', $page).on 'change', '.specific-result-text', (e) ->
      # MIRROR FROM SPECIFIC RESULT VALUE CHANGES
      $this = $(this)

      params = { 'specific_result' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

      params['specific_result']['field']     = $this.data('field')
      params['specific_result']['value']     = $this.val()
      params['specific_result']['result_id'] = $this.parents('.specific-result:eq(0)').data('resultId')

      startLoading()

      url = $('#result-specific-update-url', $page).val()
      $.post url, params, (data) ->
        stopLoading()
        flashField $this
        toastr.success 'Informação atualizada.'
        return
      return

    # DELETE SPECIFIC RESULT
    $('.strategy', $page).on 'click', '.delete-result', (e) ->
      result_id = $(this).attr('data-id')

      params = { 'specific_result' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      #RESULT NUMBER PARAM
      params['specific_result']['id'] = result_id

      startLoading()

      url = $('#result-delete-specific-result-url', $page).val()
      $.post url, params, (data) ->
        stopLoading()
        if data.status
          $("#result-#{result_id}").remove()
          toastr.success 'Resultado específico deletado com sucesso!'
        else
          toastr.error 'Não foi possível deletar resultado específico.'
        return
      return

    # LINK PRODUCT TO ANOTHER RESULT
    # TO-DO

    # OPEN MODAL TO LINK PRODUCT TO ANOTHER RESULT
    $('.strategy', $page).on 'click', '.plano-anual .responsability .product .link-product', ->
      $this = $(this)

      $modal   = $this.parents('.strategy').find('.modal.link-product')
      $product = $this.parents('.product:eq(0)')

      product_id = $product.data('id')
      result_id  = $product.parents('.result-container:eq(0)').data('resultId')

      $modal.find('ul li').show().find('.fa').removeClass('fa-check-square-o').addClass('fa-square-o').removeData('newId')
      $modal.find('input.product-id').val(product_id)
      $modal.find("#link-result-#{result_id}").hide()

      $modal.find('.modal-state').click()
      return
    # DELETE A RESPONSABILITY
    $('.strategy', $page).on 'click', '.plano-anual .responsability .responsability-actions .delete-responsability', ->

      $this = $(this)
      $resp = $this.parents('.resp-item:eq(0)')

      if $resp.hasClass('product')
        message = 'O produto será removido junto com todas suas ações. Desejar continuar?'
      else
        message = 'A ação será removida. Desejar continuar?'
      return false unless confirm(message)

      params = { 'delete' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      params['delete']['resp_id'] = $resp.data('id')

      startLoading()

      url = $('#result-delete-url', $page).val()
      $.post url, params, (data) ->
        stopLoading()
        if data.status
          if $resp.hasClass 'product'
            name = 'Produto removido.'
          else
            name = 'Ação removida.'

          toastr.success "#{name}"
          $parent = $resp.parents('.children:eq(0)')
          $resp.remove()
          if $parent.find('.resp-item').length == 0
            $parent.addClass('hidden')
        return
      return
    # SEND COMMENT
    $('.strategy', $page).on 'click', '.plano-anual .modal.comments .send-comment', ->

      $this  = $(this)
      $field = $this.prev()
      $modal = $this.parents('.modal-inner:eq(0)')

      id = $this.data('id')
      comment = $field.val()

      if comment.trim() == ''
        toastr.error 'Comentário em branco'
        return false

      params = { 'comment' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

      params['comment']['resp_id'] = id
      params['comment']['comment'] = comment

      startLoading()

      url = $('#result-new-comment-url', $page).val()

      $.post url, params, (data) ->
        stopLoading()
        $field.val('')

        $modal.find('.comments-list .comment.empty').remove()
        $modal.find('.comments-list table').removeClass('hidden')
        $modal.find('.comments-list table tbody').append(data)

        toastr.success 'Comentário enviado.'
        return

      return

    # TOGGLE OVERLAY WHEN MODAL IS OPENED
    $(document).on 'change', '.modal-state', ->
      if $(this).is(":checked")
        $("body").addClass "modal-open"
      else
        $("body").removeClass "modal-open"
      return
    # OPEN MODAL MODAL WITH COMMENTS
    $('.strategy', $page).on 'click', '.plano-anual .responsability .responsability-actions .toggle-comments', ->
      $this = $(this)
      $resp = $this.parents('.resp-item:eq(0)')
      $modal = $resp.find('> .modal.comments')

      $modal.find('.modal-state').click()

      if $resp.find('.responsability-actions .unread-comment').length > 0
        comment_id = $resp.find('.responsability-actions .unread-comment').data('commentId')
        readComment(comment_id, $resp.find('.responsability-actions .unread-comment'))

      return

    # MARK RESULT AS FALSE FOR DSEI
    falseResultAjax = null
    $('.dsei-false-result', $page).click ->
      $this = $(this)

      params = { 'false_result' : {}}
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

      params['false_result']['not_apply'] = if $this.find('.fa-square').length > 0 then true else false
      params['false_result']['dsei_id']   = $this.data 'dseiId'
      params['false_result']['result_id'] = $this.data 'resultId'

      startLoading()

      url = $('#result-false-url', $page).val()
      falseResultAjax.abort() if falseResultAjax
      falseResultAjax = $.post url, params, (data) ->
        stopLoading()
        toastr.success 'Resultado marcado como não aplicável para este DSEI'
        $this.find('.fa').toggleClass('fa-square').toggleClass('fa-check-square')
        return
      return

    # TOGGLE PRODUCT ACTIONS
    $('.strategy', $page).on 'click', '.plano-anual .responsability .responsability-actions .toggle-children', ->
      if $(this).parent().parent().find('> .children > .resp-item').length == 0
        toastr.warning 'O produto não possui nenhuma ação'
        return false
      $(this).parent().parent().find('> .children').toggleClass('hidden')
      $(this).toggleClass('fa-caret-right').toggleClass('fa-caret-down')
      return

    # ADD NEW ACTION TO PRODUCT
    $('.strategy', $page).on 'click', '.plano-anual .responsability .product > .actions .add-action', ->
      startLoading()
      $product  = $(this).parents('.product')
      product_id = $product.data('id')

      createResponsabilityDOM 'Ação', product_id, (data) ->
        stopLoading()
        $action = $(data)
        applyDateMask $action.find('.date-field')
        $product.find('> .children').removeClass('hidden').append($action)
        $product.find('> .children').sortable('reload')
        return
      return

    # ADD NEW PRODUCT TO RESULT
    $('.strategy', $page).on 'click', '.plano-anual .responsability > .actions .add-product', ->
      startLoading()
      $result   = $(this).parents('.responsability')
      result_id = $result.data('id')

      createResponsabilityDOM 'Produto', result_id, (data) ->
        stopLoading()
        $product = $(data)
        applyDateMask $product.find('.date-field')
        $result.find('> .children').removeClass('hidden').find('.product-list').append($product)
        $result.find('> .children .product-list').sortable('reload')
        startSortable $product.find('.children'), 'AÇÃO'
        return

      return

    # UPDATE RESPONSABILITIES VALUES
    $('.strategy', $page).on 'change', '.plano-anual .resp-item .product-name, .resp-item .product-date', ->
      $field = $(this)

      field     = $field.data 'field'
      result_id = $field.parents('.resp-item ').data 'id'
      value     = $field.val()

      item = {}
      item[field] = value
      params = responsabilityParams($field, item)

      runAjaxRequest $field, params, (data) ->
        toastr.success 'Informação atualizada.'
        return
      , (data) ->
        return
      return

    # DELETING A PERSON
    $('.strategy', $page).on 'click', '.plano-anual .people .person :checkbox', (e) ->
      $this = $(this)
      $people = $this.parents('.people')

      if $people.hasClass('single')
        params = responsabilityParams($this, {'person_id': null})
        runAjaxRequest $people, params, (data) ->
          $people.find('ul li').remove()
          toastr.success "Responsável removido com successo!"
          return
        , (data) ->
          return
      else
        item = {}
        item['id'] = $this.data('id')
        item['_destroy'] = '1'

        params = responsabilityParams($this, {'corresponsabilities_attributes': [item]})
        runAjaxRequest $people, params, (data) ->
          $this.parents('.person').remove()
          toastr.success "Corresponsável removido com successo!"
          return
        , (data) ->
          return
      return

    # SELECTING PERSON
    $('.strategy', $page).on 'click', '.plano-anual .people .new-person :checkbox', (e) ->

      $this = $(this)
      $people = $this.parents('.people')

      person  = {}
      person['id']       = $this.data 'personId'
      person['name']     = $this.next().text()
      person['location'] = $this.next().next().text().replace(/[()]/g, '')

      # SELECT ONE PERSON
      if $people.hasClass('single')

        params = responsabilityParams($this, {'person_id': person.id})
        runAjaxRequest $people, params, (data) ->
          toastr.success "#{person.name} adicionado como responsável."
          clearPeopleSearch($people)
          $people.find('ul li').remove()
          $li = personSearchCheckbox(person, false)
          $li.find(':checkbox').prop 'checked', true
          $people.find('ul').append $li
          return
        , (data) ->
          return

      # SELECT MORE THAN ONE PERSON
      else
        checked = $this.prop('checked')

        if checked

          loopCreate = ($object, item, callBack) ->
            params = {}
            url    = $('#result-loop-url', $page).val()

            params['item'] = item
            params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')

            $.post url, params, (data) ->
              callBack(data) if callBack?
              return
            return

          parent_id = $people.parents('.resp-item:eq(0)').data('id')

          loopCreate $this, { class: 'Corresponsability', values: { responsability_id: parent_id, person_id: person.id }}, (data) ->
            toastr.success "#{person.name} foi adicionado como corresponsável!"
            $li = personSearchCheckbox(person, false)
            $li.find(':checkbox').attr('data-id', data.id).prop('checked', true)
            $people.find('ul').append $li
            flashField $people
            return
        else
          $people.find("ul .person input[data-person-id='#{person.id}']").click()
      return

    # PEOPLE SEARCH
    peopleTime = null
    $('.strategy', $page).on 'keyup', '.plano-anual .people .search', (e) ->
      e.stopPropagation()

      if $(this).val().trim() == ''
        clearPeopleSearch($(this).parent())
        clearTimeout(peopleTime) if peopleTime

      return false if (e.which < 48 || e.which > 90)
      clearTimeout(peopleTime) if peopleTime

      $this = $(this)
      $people = $this.parent()

      return false if $this.val().trim().length < 3

      value = $this.val()

      $people.find('.loading').show()
      $people.find('ul').addClass 'searching'
      $people.find('.clear-search').hide()
      $people.find('ul .new-person').remove()

      peopleTime = setTimeout( ->
        params = {}
        params['query'] = value
        params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
        $.post '/procurar-pessoa', params, (data) ->
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
    $('.strategy', $page).on 'click', '.plano-anual .people .clear-search', ->
      clearPeopleSearch($(this).parent())
      return

    # HIDE PLANO ANUAL
    $('.strategy', $page).on 'click', '.plano-anual a.button.close', ->
      $(this).parents('.plano-anual').find('.show-more').click()
      return

    # TOGGLE RESULTADOS DSEI
    $('.strategy', $page).on 'click', '.result .show-more', ->
      $(this).find('span').toggle()
      $(this).parent().next().toggle()
      return

    # HIDE PLANO ANUAL
    $('.strategy', $page).on 'click', '.plano-anual .show-more', ->
      $(this).toggleClass 'visible'
      $(this).find('span, h2').toggle()
      $(this).parent().find('.responsability').toggle()
      return

    # POST A FIELD CHANGE
    $('.result-container:not(.specific-result) .result-products .years .result-field', $page).each ->
      $field = $(this)

      field     = $field.data 'field'
      result_id = $field.parents('.result-container').data 'id'
      value     = $field.val()

      $field.on 'keyup', (e) ->
        e.stopPropagation()
        return

      $field.on 'change', ->
        if $(this).val() < $(this).data('limit')
          toastr.error "Valor não pode ser menor do que #{$(this).data('limit')}."
          $(this).val($(this).data('limit')).focus()
          flashField $(this)
          return false

        new_value = $(this).val()

        params = {}
        params['pdsi_results_attributes'] = [{}]
        params['pdsi_results_attributes'][0]['id']  = result_id
        params['pdsi_results_attributes'][0][field] = new_value

        runAjaxRequest $field, params, (data) ->
          toastr.success 'Informação atualizada.'
          if field == 'value_2019'
            $field.parents('.result-container:eq(0)').find('> .result .result-name span.value').text(new_value)
          if field == 'value_2016'
            result_text = $("#textfield_for_2016_#{result_id}").attr('data-result-text')
            console.log new_value
            result_text = result_text.replace(/\[VALUE\]/, new_value.toString())
            $("#textfield_for_2016_#{result_id}").val(result_text)
          return
        , (data) ->
          return
        return
      return

    # POST A FIELD CHANGE (VALUE_GLOBAL)
    $('.global-value-cs').each ->
      $field = $(this)

      field     = $field.data 'field'
      result_id = $field.data 'result-id'
      value     = $field.val()

      $field.on 'keyup', (e) ->
        e.stopPropagation()
        return

      $field.on 'change', ->
        if $(this).val() < $(this).data('limit')
          toastr.error "Valor não pode ser menor do que #{$(this).data('limit')}."
          $(this).val($(this).data('limit')).focus()
          flashField $(this)
          return false

        new_value = $(this).val()

        params = {}
        params['pdsi_results_attributes'] = [{}]
        params['pdsi_results_attributes'][0]['id']  = result_id
        params['pdsi_results_attributes'][0][field] = new_value

        runAjaxRequest $field, params, (data) ->
          toastr.success 'Informação atualizada.'
          return
        , (data) ->
          return
        return
      return


    ####################
    ##### HELPERS ######
    ####################

    # MARK A COMMENTAS READ
    readComment = (comment_id, $comment) ->
      params = {}

      params['comment'] = comment_id
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      url = $('#result-see-comment-url', $page).val()

      $.post url, params, (data) ->
        $comment.remove() if data.status
        return
      return

    # CREATEA THE HTML FOR RESPONSABILITIES
    createResponsabilityDOM = (level, parent_id, callBack) ->
      params = {}

      params['level'] = level
      params['parent_id'] = parent_id
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      url = $('#result-responsability-url', $page).val()

      $.post url, params, (data) ->
        callBack(data) if callBack?
        return
      return

    # RUN THE AJAX REQUEST TO UPDATE VALUES
    runAjaxRequest = ($field, params, successCallback, failCallback) ->

      $field.removeClass 'success error'
      params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
      url = $('#result-edit-url', $page).val()

      startLoading()

      $.post url, params, (data) ->
        stopLoading()

        if data.status
          klass = 'success'
          successCallback(data) if successCallback?
        else
          klass = 'error'
          $field.focus()
          failCallback(data) if failCallback?

        flashField $field

        return
      return

    # FLASH FIELD TO ATTENTION
    flashField = ($field) ->
      $field.addClass "animated flash"
      $field.one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
        $field.removeClass "animated flash"
        return
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

    responsabilityParams = ($object, item) ->
      # Responsability ACTION
      if $object.parents('.action').length > 0
        action = { 'children_attributes': [] }
        action['children_attributes'][0] = item
        action['children_attributes'][0]['id'] = $object.parents('.action').data('id')
        responsabilityParams($object.parents('.action'), action)

      # Responsability PRODUCT
      else if $object.parents('.product').length > 0
        product = { 'children_attributes': [] }
        product['children_attributes'][0] = item
        product['children_attributes'][0]['id'] = $object.parents('.product').data('id')
        responsabilityParams($object.parents('.product'), product)

      # Responsability RESULT
      else
        params = {'responsabilities_attributes': []}
        params['responsabilities_attributes'][0] = item
        params['responsabilities_attributes'][0]['id'] = $object.parents('.responsability').data('id')

        params

    # CLEAR PEOPLE SEARCH
    clearPeopleSearch = ($people) ->
      $people.find('.search').val('')
      $people.find('ul .new-person').remove()
      $people.find('ul').removeClass('searching')
      $people.find('.fa').hide()
      return

    return
  return
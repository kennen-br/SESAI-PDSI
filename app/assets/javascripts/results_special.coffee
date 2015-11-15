# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('#result-index').each ->
    $page = $(this)

    applyDateMask = ($elements) ->
      $elements.mask("99/99/9999")
      return

    # SHOW PACE LOADING
    startLoading = ->
      $pace = $('<div></div>', { class: 'pace results-loading'})
      $pace.append $('<div></div>', { class: 'pace-activity' })
      $('body').prepend $pace
      return

    # HIDE PACE LOADING
    stopLoading = ->
      $('.pace.results-loading').remove()
      return

    applyDateMask $page.find('.date-field')

    # LINK PRODUCT TO ANOTHER RESULT
    $('.strategy .modal.link-product .results-list li', $page).click ->
      $this = $(this)
      $modal = $this.parents('.modal.link-product')

      result_id = $this.data('id')
      product_id = $modal.find('.product-id').val()

      if $this.find('.fa-square-o').length > 0

        params = { 'link_product' : {}}
        params[$("meta[name='csrf-param']").attr('content')] = $('meta[name="csrf-token"]').attr('content')
        params['link_product']['product_id'] = product_id
        params['link_product']['result_id']  = result_id

        startLoading()

        url = $('#result-link-product-url', $page).val()
        $.post url, params, (data) ->
          stopLoading()
          $("#result-#{result_id}.result-container .plano-anual .responsability > .children").removeClass('hidden').append(data)
          $this.data('newId', $(data).data('id'))
          $this.find('.fa').toggleClass('fa-square-o').toggleClass('fa-check-square-o')
          toastr.success 'Produto adicionado ao resultado escolhido'
          return

      else
        new_id = $this.data('newId')
        $("#result-#{result_id}.result-container .plano-anual .responsability > .children .product[data-id='#{new_id}'] .responsability-actions .delete-responsability").click()
        $this.find('.fa').toggleClass('fa-square-o').toggleClass('fa-check-square-o')
        $this.removeData('newId')

      return
    # OPEN MODAL TO LINK PRODUCT TO ANOTHER RESULT
    $('.plano-anual .responsability', $page).on 'click', '.product .link-product', ->
      $this = $(this)

      $axis    = $this.parents('.strategy')
      $modal   = $axis.find('.modal.link-product')
      $product = $this.parents('.product:eq(0)')

      product_id = $product.data('id')
      result_id  = $product.parents('.result-container:eq(0)').data('resultId')

      $modal.find('ul li').show().find('.fa').removeClass('fa-check-square-o').addClass('fa-square-o').removeData('newId')
      $modal.find('input.product-id').val(product_id)
      $modal.find("#link-result-#{result_id}").hide()

      $modal.find('.modal-state').click()
      return
    # DELETE A RESPONSABILITY
    $('.plano-anual .responsability', $page).on 'click', '.responsability-actions .delete-responsability', ->

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
          $parent = $resp.parent()
          $resp.remove()
          if $parent.find('.resp-item').length == 0
            $parent.addClass('hidden')
        return
      return
    # SEND COMMENT
    $('.plano-anual', $page).on 'click', '.modal.comments .send-comment', ->

      $this  = $(this)
      $field = $this.prev()
      $modal = $this.parents('.modal-inner:eq(0)')

      id = $this.data('id')
      comment = $field.val()

      console.log 'NEW COMMENT', comment

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
    # SHOW COMMENTS MODAL WINDOW
    $('.plano-anual .responsability', $page).on 'click', '.responsability-actions .toggle-comments', ->
      $this = $(this)
      $resp = $this.parents('.resp-item:eq(0)')
      $modal = $resp.find('> .modal.comments')

      $modal.find('.modal-state').click()

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
    $('.plano-anual .responsability', $page).on 'click', '.responsability-actions .toggle-children', ->
      if $(this).parent().parent().find('> .children > .resp-item').length == 0
        toastr.warning 'O produto não possui nenhuma ação'
        return false
      $(this).parent().parent().find('> .children').toggleClass('hidden')
      $(this).toggleClass('fa-caret-right').toggleClass('fa-caret-down')
      return

    # ADD NEW ACTION TO PRODUCT
    $('.plano-anual .responsability', $page).on 'click', '.product > .actions .add-action', ->
      startLoading()
      $product  = $(this).parents('.product')
      product_id = $product.data('id')

      createResponsabilityDOM 'Ação', product_id, (data) ->
        stopLoading()
        $action = $(data)
        applyDateMask $action.find('.date-field')
        $product.find('> .children').removeClass('hidden').append($action)
        return
      return

    # ADD NEW PRODUCT TO RESULT
    $('.plano-anual .responsability > .actions', $page).on 'click', '.add-product', ->
      startLoading()
      $result   = $(this).parents('.responsability')
      result_id = $result.data('id')

      createResponsabilityDOM 'Produto', result_id, (data) ->
        stopLoading()
        $product = $(data)
        applyDateMask $product.find('.date-field')
        $result.find('> .children').removeClass('hidden').append($product)
        return

      return

    # UPDATE RESPONSABILITIES VALUES
    $('.plano-anual', $page).on 'change', '.resp-item .product-name, .resp-item .product-date', ->
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
    $('.plano-anual', $page).on 'click', '.people .person :checkbox', (e) ->
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
        console.log 'REMOVE PERSON', params
        runAjaxRequest $people, params, (data) ->
          $this.parents('.person').remove()
          toastr.success "Corresponsável removido com successo!"
          return
        , (data) ->
          return
      return

    # SELECTING PERSON
    $('.plano-anual', $page).on 'click', '.people .new-person :checkbox', (e) ->

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
    $('.plano-anual', $page).on 'keyup', '.people .search', (e) ->
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
          console.log 'SEARCH RESULTS'
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
    $('.plano-anual', $page).on 'click', '.people .clear-search', ->
      clearPeopleSearch($(this).parent())
      return

    # HIDE PLANO ANUAL
    $('.plano-anual a.button.close', $page).click ->
      $(this).parents('.plano-anual').find('.show-more').click()
      return

    # TOGGLE RESULTADOS DSEI
    $('.result .show-more', $page).click ->
      $(this).find('span').toggle()
      $(this).parent().next().toggle()
      return

    # HIDE PLANO ANUAL
    $('.plano-anual .show-more', $page).click ->
      $(this).toggleClass 'visible'
      $(this).find('span, h2').toggle()
      $(this).parent().find('.responsability').toggle()
      return

    # POST A FIELD CHANGE
    $('.result-products .years .result-field', $page).each ->
      $field = $(this)

      field     = $field.data 'field'
      result_id = $field.parents('.result-container').data 'id'
      value     = $field.val()

      $field.on 'keyup', (e) ->
        e.stopPropagation()
        return

      $field.on 'change', ->
        params = {}
        params['pdsi_results_attributes'] = [{}]
        params['pdsi_results_attributes'][0]['id']  = result_id
        params['pdsi_results_attributes'][0][field] = value

        runAjaxRequest $field, params, (data) ->
          toastr.success 'Informação atualizada.'
          return
        , (data) ->
          return
        return
      return

    # $('.result-products .years .result-checkbox', $page).each ->
    #   $field = $(this).find('input')

    #   field     = $field.data 'field'
    #   result_id = $field.parents('.result-container').data 'id'

    #   $field.on 'click', ->
    #     value = if this.checked then 1 else 0
    #     params =
    #       object_id: result_id
    #       relation: 'pdsi_results'
    #       field: field
    #       value: value
    #     console.log 'Updating Checkbox', params
    #     runAjaxRequest $field.parent(), params
    #     return

      return


    ####################
    ##### HELPERS ######
    ####################

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

        console.log 'POSTED', data
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
      console.log 'CLEAR SEARCH'
      $people.find('.search').val('')
      $people.find('ul .new-person').remove()
      $people.find('ul').removeClass('searching')
      $people.find('.fa').hide()
      return

    return
  return
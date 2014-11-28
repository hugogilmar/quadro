class Widget
  constructor: (@element) ->
    @id = @element.data 'id'
    @name = @element.data 'name'
    @type = @element.data 'type'
    @airmode = @element.data 'airmode'
    @changed = false
    @summernote()
    return

  summernote: ->
    @element.summernote
      airMode: @airmode
      codemirror:
        lineNumbers: true
        lineWrapping: true
        tabSize: 2
        mode: 'htmlmixed'
        theme: 'monokai'
      onChange: =>
        @setChanged()
        return

  save: ->
    @getContent()
    if @id then @update() else @create()
    @unsetChanged()
    return

  reload: ->
    $.ajax
      url: "/widgets/#{@id}.json"
      type: "GET"
      dataType: "json"
      success: (data) ->
        return
      error: ->
        console.log "something failed"
        return
    return

  create: ->
    $.ajax
      url: "/widgets.json"
      type: "POST"
      data:
        widget:
          name: @name
          content: @content
      success: (data) =>
        $(".summernote[data-name=#{@name}]").attr('data-id', data.id)
        $(".summernote[data-name=#{@name}]").data('id', data.id)
        @id = data.id
        return
      error: ->
        console.log "something failed"
        return
    return

  update: ->
    $.ajax
      url: "/widgets/#{@id}.json"
      type: "PUT"
      data:
        widget:
          content: @content
      success: (data) ->
        return
      error: ->
        console.log "something failed"
        return
    return

  destroy: ->
    $.ajax
      url: "/widgets/#{@id}.json"
      type: "DELETE"
      success: (data) ->
        return
      error: ->
        console.log "something failed"
        return
    return

  getContent: ->
    @content = $(".summernote[data-name=#{@name}]").code()
    return

  setChanged: ->
    @changed = true
    $('#quadro-toolbar').show()
    return

  unsetChanged: ->
    @changed = false
    $('#quadro-toolbar').hide()
    return
window.Widget = Widget

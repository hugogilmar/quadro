class Widget
  constructor: (@element) ->
    @id = @element.data 'id'
    @name = @element.data 'name'
    @type = @element.data 'type'
    @page = @element.data 'page'
    @path = @element.data 'path'
    @airmode = true
    @focus = false
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
      onfocus: =>
        @setFocus()
        return
    return

  switchAirmodeOn: ->
    @element.destroy()
    @airmode = true
    @summernote()
    return

  switchAirmodeOff: ->
    @element.destroy()
    @airmode = false
    @summernote()
    return

  save: ->
    @getContent()
    if @id then @update() else @create()
    @unsetChanged()
    return

  create: ->
    $.ajax
      url: "#{@path}"
      type: "POST"
      data:
        widget:
          name: @name
          content: @content
        type: @type
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
      url: "#{@path}"
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
      url: "#{@path}"
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

  setFocus: ->
    @focus = true
    return

  setChanged: ->
    @changed = true
    $('#quadro-actions').show()
    return

  unsetChanged: ->
    @changed = false
    $('#quadro-actions').hide()
    return

window.Widget = Widget

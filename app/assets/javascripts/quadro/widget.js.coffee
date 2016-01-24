class Widget
  constructor: (@element) ->
    @id = @element.data 'id'
    @name = @element.data 'name'
    @type = @element.data 'type'
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
        new Message "Save success"
        return
      error: ->
        new Message "Save failed"
        return
    return

  update: ->
    console.log @path
    $.ajax
      url: "#{@path}"
      type: "PUT"
      data:
        widget:
          content: @content
      success: (data) ->
        new Message "Save success"
        return
      error: ->
        new Message "Save failed"
        return
    return

  destroy: ->
    $.ajax
      url: "#{@path}"
      type: "DELETE"
      success: (data) ->
        new Message "Save success"
        return
      error: ->
        new Message "Save failed"
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
    $('#quadro-save').removeClass 'hide'
    return

  unsetChanged: ->
    @changed = false
    $('#quadro-save').addClass 'hide'
    return

window.Widget = Widget

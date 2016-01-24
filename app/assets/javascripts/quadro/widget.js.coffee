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
    @update()
    @unsetChanged()
    return

  update: ->
    $.ajax
      url: "#{@path}"
      type: "PUT"
      data:
        widget:
          content: @content
      success: (data) ->
        new Message "Content updated"
        return
      error: ->
        new Message "Content not updated"
        return
    return

  getContent: ->
    @content = $(".widget-html[data-name=#{@name}]").code()
    return

  setFocus: ->
    @focus = true
    return

  setChanged: ->
    @changed = true
    $('#quadro-save').removeClass('hide')
    return

  unsetChanged: ->
    @changed = false
    $('#quadro-save').addClass('hide')
    return

window.Widget = Widget

class Widget
  constructor: (@id, @type, @name, @content=null) ->
    return

  save: ->
    @getContent()
    if @id then @update() else @create()
    return

  reload: ->
    $.ajax
      url: "/widgets/#{@id}.json"
      type: "GET"
      success: (data) ->
        console.log data
        return
      error: ->
        console.log "something failed"
        return
    return

  getContent: ->
    @content = $(".summernote[data-name=#{@name}]").code()
    return

  create: ->
    $.ajax
      url: "/widgets.json"
      type: "POST"
      data:
        widget:
          name: @name
          content: @content
      success: (data) ->
        console.log data
        @id = data.id
        $(".summernote[data-name=#{@name}]").data('id', data.id)
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
        console.log data
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
        console.log data
        return
      error: ->
        console.log "something failed"
        return
    return

window.Widget = Widget

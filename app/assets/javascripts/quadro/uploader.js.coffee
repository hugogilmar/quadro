class Uploader
  constructor: (@element) ->
    @page = @element.data 'page'
    @type = @element.data 'type'
    @dropper()
    @binding()
    return

  binding: ->
    @element.on 'fileComplete.dropper', (e, f) ->
      console.log f

  dropper: ->
    @element.dropper
      action: "/#{@page}/assets.js"
      postData:
        type: @type
      postKey: 'asset[attachment]'
    return

window.Uploader = Uploader

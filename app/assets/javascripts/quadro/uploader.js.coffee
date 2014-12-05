class Uploader
  constructor: (@element) ->
    @page = @element.data 'page'
    @dropzone()
    return

  dropzone: ->
    @element.dropzone
      url: "/#{page}/assets"
    return

window.Uploader = Uploader

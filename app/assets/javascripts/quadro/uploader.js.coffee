class Uploader
  constructor: (@element) ->
    @path = @element.data 'path'
    @type = @element.data 'type'
    @dropper()
    return

  dropper: ->
    @element.dropper
      action: "#{@path}"
      label: '<p><i class="fa fa-picture-o fa-2x"></i></p><p>Drag and drop files or click to select</p>'
      postData:
        type: @type
      postKey: 'asset[attachment]'
    return

window.Uploader = Uploader

class Uploader
  constructor: (@element) ->
    @path = @element.data 'path'
    @type = @element.data 'type'
    @hint = @element.data 'hint'
    @dropper()
    return

  dropper: ->
    @element.dropper
      action: "#{@path}"
      label: "<p><i class=\"fa fa-picture-o fa-2x\"></i></p><p>#{@hint}</p>"
      postData:
        type: @type
      postKey: 'asset[attachment]'
    return

window.Uploader = Uploader

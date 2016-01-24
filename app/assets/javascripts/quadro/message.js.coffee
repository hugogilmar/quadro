class Message
  constructor: (@message) ->
    humane.log @message
    return

window.Message = Message

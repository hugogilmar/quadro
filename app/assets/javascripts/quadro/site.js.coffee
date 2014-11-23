$ ->
  $('.summernote[data-airmode=false]').summernote
    focus: true
    oninit:
      console.log 'initialize'
    onfocus: ->
      console.log 'focus'
    onblur: ->
      console.log 'blur'

  $('.summernote[data-airmode=true]').summernote
    focus: true
    airMode: true
    oninit:
      console.log 'initialize'
    onfocus: ->
      console.log 'focus'
    onblur: ->
      console.log 'blur'

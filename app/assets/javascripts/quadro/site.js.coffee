$ ->
  $('.summernote[data-airmode=false]').summernote
    codemirror:
      lineNumbers: true
      lineWrapping: true
      tabSize: 2
      mode: 'htmlmixed'
      theme: 'monokai'
    oninit:
      console.log 'initialize'
    onfocus: ->
      console.log 'focus'
    onblur: ->
      console.log 'blur'
    onChange: ->
      console.log 'change'

  $('.summernote[data-airmode=true]').summernote
    airMode: true
    oninit:
      console.log 'initialize'
    onfocus: ->
      console.log 'focus'
    onblur: ->
      console.log 'blur'
    onChange: ->
      console.log 'change'

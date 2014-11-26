$ ->
  $('.summernote[data-airmode=false]').each ->
    widget = new Widget $(this)

    $(this).summernote
      codemirror:
        lineNumbers: true
        lineWrapping: true
        tabSize: 2
        mode: 'htmlmixed'
        theme: 'monokai'
      oninit: ->
        console.log 'initialize'
        return
      onfocus: ->
        console.log 'focus'
        return
      onblur: ->
        console.log 'blur'
        return
      onChange: ->
        console.log 'change'
        widget.save()
        return

  $('.summernote[data-airmode=true]').each ->
    widget = new Widget $(this)

    $(this).summernote
      airMode: true
      oninit: ->
        console.log 'initialize'
        return
      onfocus: ->
        console.log 'focus'
        return
      onblur: ->
        console.log 'blur'
        return
      onChange: ->
        console.log 'change'
        widget.save()
        return

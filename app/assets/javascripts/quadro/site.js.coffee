$ ->
  $('.summernote[data-airmode=false]').each ->
    id = $(this).data('id')
    type = $(this).data('type')
    name = $(this).data('name')

    widget = new Widget id, type, name

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
    id = $(this).data('id')
    type = $(this).data('type')
    name = $(this).data('name')

    widget = new Widget id, type, name

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

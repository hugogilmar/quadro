$ ->
  $("pre code").each (i, block) ->
    hljs.highlightBlock block
    return

  widgets = {}

  $('.summernote').each ->
    widget = new Widget $(this)

    widgets[widget.name] = widget

  window.widgets = widgets

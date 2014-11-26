$ ->
  widgets = {}

  $('.summernote').each ->
    widget = new Widget $(this)

    widgets[widget.name] = widget

  window.widgets = widgets

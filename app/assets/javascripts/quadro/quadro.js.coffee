$ ->
  widgets = {}

  $('.summernote').each ->
    widget = new Widget $(this)

    widgets[widget.name] = widget

  window.widgets = widgets

  $('#quadro-save').on 'click', ->
    for widget in Object.keys(widgets)
      widgets[widget].save()
    return

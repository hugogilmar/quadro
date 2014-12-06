$ ->
  widgets = {}

  $('.summernote').each ->
    widget = new Widget $(this)

    widgets[widget.name] = widget

  window.widgets = widgets

  $('#quadro-airmode-on').on 'click', ->
    $('#quadro-airmode-off').removeClass 'active'
    $(this).addClass 'active'
    for widget in Object.keys(widgets)
      widgets[widget].switchAirmodeOn()

  $('#quadro-airmode-off').on 'click', ->
    $('#quadro-airmode-on').removeClass 'active'
    $(this).addClass 'active'
    for widget in Object.keys(widgets)
      widgets[widget].switchAirmodeOff()

  $('#quadro-save').on 'click', ->
    for widget in Object.keys(widgets)
      widgets[widget].save()
    return

  $('#quadro-gallery-toggle').on 'click', ->
    if $('#quadro-gallery').hasClass 'collapsed' then $('#quadro-gallery').removeClass('collapsed').addClass 'expanded' else $('#quadro-gallery').removeClass('expanded').addClass 'collapsed'

  uploader = new Uploader $('#quadro-uploader')

  window.uploader = uploader

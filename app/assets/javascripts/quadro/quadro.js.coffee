$(document).ready ->
  widgets = {}

  $('.widget-slider').slick(
    autoplay: true
    arrows: true
    fade: true
    mobileFirst: true
    pauseOnHover: false
  )

  $('.widget-html').each ->
    widget = new Widget $(this)

    widgets[widget.name] = widget

  window.widgets = widgets

  $('.asset-dropper').each ->
    uploader = new Uploader $(this)

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
    if $('#quadro-gallery').hasClass('collapsed')
      $('#quadro-gallery').removeClass('collapsed').addClass('expanded')
    else
      $('#quadro-gallery').removeClass('expanded').addClass('collapsed')

$ ->
  $("pre code").each (i, block) ->
    hljs.highlightBlock block
    return

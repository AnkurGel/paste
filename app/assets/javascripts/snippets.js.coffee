# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('.code_block .raw').size() > 0
    $(document).ready ->
      interval = setInterval ->
        request = $.ajax
          type: 'get'
          url: window.location.pathname + "/highlighted_code"
          dataType: 'json'
          success: (data)->
            if data.highlighted?
              $('.code_block').html(data.highlighted)
              stopInterval()
      , 1000
      stopInterval = -> clearInterval(interval)

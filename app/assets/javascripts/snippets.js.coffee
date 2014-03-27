# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  #If highlighted code is not available, request(poll) highlighted code every second
  #by sending AJAX GET request. When acquired, update that in page asynchronously.
  #That highlighted code will only be available when delayed_job processes it.
  if $('.code_block .raw').size() > 0
    $(document).ready ->
      interval = setInterval ->
        request = $.ajax
          type: 'get'
          url: '/snippets/' + $("span.name").text() + "/highlighted_code"
          dataType: 'json'
          success: (data)->
            if data.highlighted?
              $('.code_block').html(data.highlighted)
              stopInterval()
      , 1000
      stopInterval = -> clearInterval(interval)
  #When highlighted code is already present, send a new GET request to highlighted_code
  #and update it again. This solves the weird excessive-indent-spaces issue.
  else if $('.code_block').size() > 0
    $(document).ready ->
      setTimeout ->
        $.ajax
          type: 'get'
          url: '/snippets/' + $("span.name").text() + "/highlighted_code"
          dataType: 'json'
          success: (data) ->
            if data.highlighted?
              $(".code_block").html(data.highlighted)
      , 250

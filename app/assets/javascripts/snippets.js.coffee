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

  # Select the language dynamically by inferring from file extension
  # JS #FTW
  $(document).ready ->
    lang = {}
    if($("#snippet_name").size() > 0)
      # Send a GET request to acquire the map b/w extensions and ids
      $.ajax
        type: 'get'
        url: '/snippets/get_languages'
        dataType: 'json'
        success: (data) ->
          lang = data

      $("#snippet_name").on "input", (event) ->
        # on input, capture the value
        val = $("#snippet_name").val()

        # infer the extension and filename
        [filename, extension] = val.split(".")

        #from the lang(uage) object, check if that language is present, else plain
        if extension?
          selected_language = lang[extension] || lang['']
        else if filename?
          selected_language = lang['']
        # update the selected option
        $("#snippet_language_id").val(selected_language) if selected_language?

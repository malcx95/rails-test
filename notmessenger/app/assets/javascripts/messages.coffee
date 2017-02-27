# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

renderMessages = (messages) ->
    for m in messages
        message = "<div class='message'>"
        message += "#{m.user}<br>"
        message += "#{m.body}<br><br>"
        message += "</div>"
        hejhej = $("#messages").append -> message


requestMessages = (url) ->
    $.ajax
        url: url
        type: "GET"
        dataType: "json"
        success: (data, textStatus, jqXHR) ->
            renderMessages(data)
        error: (jqXHR, textStatus, errorThrown) ->
            $('#errorout').append "AJAX Error: #{errorThrown}"


@message_handler = (url) ->
    requestMessages(url)


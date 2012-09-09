# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->

  $('#message').css('width', $('.message').width() - 12)
  $('#messages').css('height', $(window).height() - 300)
  $('#messages').css('min-height', 250)

  $(document).keypress (e) -> 
    if e.which == 13
      if $('input#message').val().trim().length > 0
        messages.add new Message({ 
            message: $('input#message').val(), 
            room_id: $('.room-id').data('room-id'), 
            user_string: $('.user-string').data('user-string')
          })
        messages.save()
        $('input#message').val('')

  $(window).resize ->
    $('#message').css('width', $('.message').width() - 12)
    $('#messages').css('height', $(window).height() - 300)
    $('#messages').css('min-height', 250)
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import consumer from "../channels/consumer"
// import * as ActionCable from "@rails/actioncable"
// import * as App from "@rails/actioncable/app/assets/javascripts/action_cable";
import "channels"
import "bootstrap"

Rails.start()
ActiveStorage.start()

// console.log("RAILS");
// console.log(Rails);
// console.log("/RAILS");
// import "../assets/stylesheets/application.css"

import "./main.scss"

// debugger;

$(function() {
  console.log("HOLA")
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    console.log("bind on success");
    $(this).find('input[type="text"]').val('');
  });
  $('[data-channel-subscribe="room"]').each(function(index, element) {
    console.log("subscribiendo...")
    var $element = $(element)
    var room_id = $element.data('room-id')
    var messageTemplate = $('[data-role="message-template"]');
    console.log(messageTemplate)

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

    // App.cable.subscriptions.create(

    consumer.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function(data) {
          console.log("evento received", data)
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(data.updated_at);
          $element.append(content);
          $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
        }
      }
    );
  });
});

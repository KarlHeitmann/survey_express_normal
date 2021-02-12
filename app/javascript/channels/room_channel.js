// import * as ActiveStorage from "@rails"
// $(function() {
//   $('[data-channel-subscribe="room"]').each(function(index, element) {
//     console.log("subscribiendo...")
//     var $element = $(element)
//     var room_id = $element.data('room-id')
//     var messageTemplate = $('[data-role="message-template"]');
//     console.log(messageTemplate)

//     $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

//     App.cable.subscriptions.create(
//       {
//         channel: "RoomChannel",
//         room: room_id
//       },
//       {
//         received: function(data) {
//           console.log("evento received", data)
//           var content = messageTemplate.children().clone(true, true);
//           content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
//           content.find('[data-role="message-text"]').text(data.message);
//           content.find('[data-role="message-date"]').text(data.updated_at);
//           $element.append(content);
//           $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
//         }
//       }
//     );
//   });
// });

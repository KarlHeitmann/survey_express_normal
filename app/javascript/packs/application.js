// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
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

// Esta instruccion SIRVE!!!! en el browser
document.documentElement.addEventListener('turbo:render', (v1, v2)=> {console.log('render')})
document.documentElement.addEventListener('turbo:before-stream-render', async (v1, v2)=> {
  console.log(v1);
  console.log(v2);
  // const room_messages = document.getElementById('room_messages')
  console.log("MAMA MIA");
  // await room_messages.animate({scrollTo: 0});
  setTimeout(() => {
    console.log("TIMEOUT LISTO")
    const q=document.getElementById('chat-box')
    q.scrollTop = q.scrollHeight;

  }, 250)
  console.log("END")
})

// debugger;


import "controllers"

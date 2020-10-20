// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("semantic-ui-sass")


$(document).on('turbolinks:load', ()=>{

  close_keyboard_when_enter()

  //flash close js
  $('.message .close')
    .on('click', function() {
      $(this)
        .closest('.message')
        .transition('fade')
      ;
    })
  ;

  //dropdown menu
  $(".ui.dropdown").dropdown();

  //my btn for submit
  fake_btn = document.querySelector("#message_submit_btn")
  real_btn=document.querySelector('#real_message_submit')
  fake_btn.addEventListener("click", ()=>{
    real_btn.click()
  });

  main_box = document.querySelector('#chat_main_box')

  if(window.innerWidth <= 600){
    main_box.classList.remove('twelve')
    main_box.className = ('sixteen '+main_box.className)
  }else{
    main_box.classList.remove('sixteen')
    main_box.className = ('twelve '+main_box.className)
  }

});

function close_keyboard_when_enter(){
  $('#message_body').on('keydown', function(e) {
    if (e.keyCode == 13) {
      e.preventDefault()
     
      document.querySelector('#message_submit_btn').click()
      document.querySelector('#message_body').blur();
      document.querySelector('#message_body').value = ''
    };
  });
}

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

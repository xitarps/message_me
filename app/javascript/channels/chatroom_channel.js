import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    
    let list = document.querySelector('#message-container-custom')

    let owner = data.owner;
    let is_your = data.is_your;
    let time = data.time;
    let msg = data.msg;

    let tmp_message = '';

    let div_event = document.createElement('div')
    div_event.classList.add('event')

    let div_content = document.createElement('div')
    div_content.classList.add('content')

    let div_summary = document.createElement('div')
    div_summary.classList.add('summary')

    let em = document.createElement('em')


    if(is_your){
      em.classList.add('your_message')
    }

    em.innerHTML = `${owner} : `

    tmp_message += `${msg} - ${time}`




    div_summary.appendChild(em)
    div_summary.append(tmp_message)

    div_content.appendChild(div_summary)

    div_event.appendChild(div_content)

    list.appendChild(div_event)
  }
});

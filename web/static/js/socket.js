import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let channel = socket.channel("live-html", {})

let liveDiv = $("#live-div")
liveDiv.empty()

let textInput = $("#live-text")
let blueButton = $("#blue-button")
let redButton = $("#red-button")

blueButton.click(() => {
  channel.push('paint_it', {color: 'blue', text: textInput.val()})
})

redButton.click(() => {
  channel.push('paint_it', {color: 'red', text: textInput.val()})
})

channel.on('live_response', payload => {
  liveDiv.empty()
  liveDiv.append(payload.html)
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket

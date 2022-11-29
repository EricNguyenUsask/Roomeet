window.onload = init;
var socket = new WebSocket("ws://localhost:8080/room/" + user_id);
socket.onmessage = onMessage;
function onMessage(event) {
    var device = JSON.parse(event.data);
    console.log(device, 'test')
    if (device.action === "add") {
        loadMessage(device);
    }
    if(device.action === "init" && device.room_id == room_id){
        printDeviceElement(device.list_active)
    }

    if(device.action === "remove" && device.room_id == room_id){
        printDeviceElement(device.list_active)
    }
}

function loadMessage(device) {
    if(device.room_id === room_id) {
        myAreaMessage.value += device.user_name + ': ' + device.message + " \n";
        document.getElementById("myMessage").value = '';
    }
}

function printDeviceElement(device) {
    var content = document.getElementById("content");
    content.innerHTML = `<p>${device}</p>`
}

function sendMessage() {
    var message = document.getElementById("myMessage").value;

    if(message) {
        const user = {
            user_id: user_id,
            room_id: room_id,
            user_name: user_name,
            message: message,
            action: 'add'
        }
        socket.send(JSON.stringify(user));
    }
}

function init() {
    window.addEventListener('beforeunload', function (e) {

            e.preventDefault()
            console.log('tab')
            return (e.returnValue = 'Are you sure you want to close?')
    });

    const user = {
        user_id: user_id,
        room_id: room_id,
        user_name: user_name,
        action: 'init'
    }
    setTimeout(() => {
        socket.send(JSON.stringify(user));
    }, 100)
}
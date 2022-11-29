var addBtn = document.querySelector(".add");

// const removeBtn = document.querySelector(".remove");
var input = document.querySelector(".inp-group");


function removeInput() {
    this.parentElement.remove();
    // console.log("event remove", input);
}

function addInput() {
    var email = document.createElement("input");
    email.type = "text";
    email.placeholder = "shawn.mendez@gmail.com";

    var btn = document.createElement("a");
    btn.className = "delete";
    btn.innerHTML = "&times";
    btn.addEventListener("click", removeInput);

    var flex = document.createElement("div");
    flex.className = "flex";

    input.appendChild(flex);
    flex.appendChild(email);
    flex.appendChild(btn);
}

addBtn.addEventListener("click", addInput);


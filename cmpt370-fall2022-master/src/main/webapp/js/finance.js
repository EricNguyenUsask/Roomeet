var price = document.getElementById("cost");

var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
var pay = document.getElementById("pay");

var slider2 = document.getElementById("myRange2");
var output2 = document.getElementById("demo2");
var pay2 = document.getElementById("pay2");

var slider3 = document.getElementById("myRange3");
var output3 = document.getElementById("demo3");
var pay3 = document.getElementById("pay3");

var slider4 = document.getElementById("myRange4");
var output4 = document.getElementById("demo4");
var pay4 = document.getElementById("pay4");

output.innerHTML = slider.value;
pay.innerHTML = price.value;

output2.innerHTML = slider2.value;
pay2.innerHTML = price.value;

output3.innerHTML = slider3.value;
pay.innerHTML = price.value;

output4.innerHTML = slider4.value;
pay4.innerHTML = price.value;

slider.oninput = function () {
    output.innerHTML = this.value;
    pay.innerHTML = (price.value / 100 * output.innerHTML).toFixed(2);
}


slider2.oninput = function () {
    output2.innerHTML = this.value;
    pay2.innerHTML = (price.value / 100 * output2.innerHTML).toFixed(2);
}

slider3.oninput = function () {
    output3.innerHTML = this.value;
    pay3.innerHTML = (price.value / 100 * output3.innerHTML).toFixed(2);
}

slider4.oninput = function () {
    output4.innerHTML = this.value;
    pay4.innerHTML = (price.value / 100 * output4.innerHTML).toFixed(2);
}

function mcheckValidShare() {
    var total =parseInt(slider.value) +parseInt(slider2.value) + parseInt(slider3.value) + parseInt(slider4.value);
    if (total > 100||total<100) {
        alert("You share buill inccorectly");

    }

}





// Dynamic Field Creation with javascript

const addBtn = document.querySelector(".add");

// const removeBtn = document.querySelector(".remove");
const input = document.querySelector(".inp-group");


function removeInput() {
    this.parentElement.remove();
    // console.log("event remove", input);
}

function addInput() {

    const email = document.createElement("input");
    email.type = "text";
    email.placeholder = "shawn.mendez@gmail.com";

    const btn = document.createElement("a");
    btn.className = "delete";
    btn.innerHTML = "&times";
    btn.addEventListener("click", removeInput);

    const flex = document.createElement("div");
    flex.className = "flex";

    input.appendChild(flex);
    flex.appendChild(email);
    flex.appendChild(btn);
}

addBtn.addEventListener("click", addInput);


document.querySelectorAll(".payment").forEach(pill => {
    pill.addEventListener("click", () =>
        pill.classList.toggle("payment-active"))

})




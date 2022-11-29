

document.getElementById("textfield").value = getSavedValue("textfield");    // set the value to this input
document.getElementById("textfield1").value = getSavedValue("textfield1");   // set the value to this input
document.getElementById("textfield2").value = getSavedValue("textfield2");
document.getElementById("textfield3").value = getSavedValue("textfield3");
document.getElementById("textfield4").value = getSavedValue("textfield4");
document.getElementById("textfield5").value = getSavedValue("textfield5");
document.getElementById("textfield6").value = getSavedValue("textfield6");
document.getElementById("textfield7").value = getSavedValue("textfield7");
document.getElementById("textfield8").value = getSavedValue("textfield8");
document.getElementById("textfield9").value = getSavedValue("textfield9");
document.getElementById("textfield10").value = getSavedValue("textfield10");
document.getElementById("textfield11").value = getSavedValue("textfield11");
document.getElementById("textfield12").value = getSavedValue("textfield12");
document.getElementById("textfield13").value = getSavedValue("textfield13");
document.getElementById("textfield14").value = getSavedValue("textfield14");
document.getElementById("textfield15").value = getSavedValue("textfield15");
document.getElementById("textfield16").value = getSavedValue("textfield16");


function saveValue(e){
    var id = e.id;
    var val = e.value;
    localStorage.setItem(id, val);
}


function getSavedValue  (v){
    if (!localStorage.getItem(v)) {
        return "";
    }
    return localStorage.getItem(v);
}




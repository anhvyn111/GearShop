document.querySelectorAll(".dropdown > a").forEach((e) => {
    e.addEventListener("click", (event) => event.preventDefault());
});

document
    .querySelector("#mb-menu-toggle")
    .addEventListener("click", () =>
        document.querySelector("#header-wrapper").classList.add("active")
    );

document
    .querySelector("#mb-menu-close")
    .addEventListener("click", () =>
        document.querySelector("#header-wrapper").classList.remove("active")
    );

// modal login
var x = document.getElementById("login");
var y = document.getElementById("register");
var z = document.getElementById("btn");
function register() {
    x.style.left = "-400px";
    y.style.left = "50px";
    z.style.left = "110px";
}
function login() {
    x.style.left = "50px";
    y.style.left = "450px";
    z.style.left = "0";
}
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function () {
    modal.style.display = "block";
};

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};
var ck_span = document.getElementsByClassName("ck_close")[0];
var ck_modal = document.getElementById("ck_Modal");
function openModal() {
    ck_modal.style.display = "block";
}
ck_span.onclick = function () {
    ck_modal.style.display = "none";
};
window.onclick = function (event) {
    if (event.target == ck_modal) {
        ck_modal.style.display = "none";
    }
};

//==============================================//
function User_Info() {
    //=======Update info=========//
    btn_update = document.getElementById("user__update");
    modal_update = document.getElementById("update_Modal");
    cancel_update = document.getElementById("cancel_update");
    showModal(modal_update, btn_update, cancel_update);

    //=======Change Pwd=========//
    change_password_btn = document.getElementById("change_password");
    change_password_modal = document.getElementById("pass_Modal");
    change_password_cancel = document.getElementById("cancel_change");
    showModal(change_password_modal, change_password_btn, change_password_cancel);
}
function User_Order() {
    btn_order = document.getElementById("btn_order");
    modal_order = document.getElementById("order_Modal");
    cancel_order = document.getElementById("close");
    showModal(modal_order, btn_order, cancel_order);
}

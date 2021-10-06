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
// Get the modal
var modal = document.getElementById("myModal");
// Get the button that opens the modal
var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
// When the user clicks the button, open the modal
btn.onclick = function () {
  modal.style.display = "block";
};
// When the user clicks on <span> (x), close the modal
span.onclick = function () {
  modal.style.display = "none";
};
// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

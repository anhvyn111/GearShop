//add hovered class in selected item
let list = document.querySelectorAll(".navigation li");
function activeLink() {
    list.forEach((item) => {
        item.classList.remove("hovered");
        this.classList.add("hovered");
    });
}
list.forEach((item) => {
    item.addEventListener("mouseover", activeLink);
});

//toggle
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function () {
    navigation.classList.toggle("active");
    main.classList.toggle("active");
};
//Modal
function showModal(modal, btn, span) {
    btn.onclick = function () {
        modal.style.display = "block";
    };

    span.onclick = function () {
        modal.style.display = "none";
    };
}

//Cus Modal
function CusModal() {
    document.querySelector("#cancel_read_cus").onclick = function () {
        document.querySelector("#read_cus_Modal").style.display = "none";
    };
    //Delete Modal
    document.querySelector("#cancel_delete").onclick = function () {
        document.querySelector("#delete_Modal").style.display = "none";
    };
}

//Category Modal
function CateModel() {
    // add brand Modal
    var brand_modal = document.getElementById("add_brand_Modal");
    var brand_btn = document.getElementById("brand_Btn");
    var brand_span = document.getElementsByClassName("brand_close")[0];
    showModal(brand_modal, brand_btn, brand_span);
    document.querySelector("#cancel_add_brand").onclick = function () {
        brand_modal.style.display = "none";
    };

    //update brand
    document.querySelector("#cancel_update_brand").onclick = function () {
        document.querySelector("#update_brand_Modal").style.display = "none";
    };

    //add cate Modal
    var cate_modal = document.getElementById("add_cate_Modal");
    var cate_btn = document.getElementById("cate_Btn");
    var cate_span = document.getElementsByClassName("cate_close")[0];
    showModal(cate_modal, cate_btn, cate_span);
    document.querySelector("#cancel_add_cate").onclick = function () {
        cate_modal.style.display = "none";
    };
    //update cate modal
    document.querySelector("#cancel_update_cate").onclick = function () {
        document.querySelector("#update_cate_Modal").style.display = "none";
    };
    //Delete Modal
    document.querySelector("#cancel_delete").onclick = function () {
        document.querySelector("#delete_Modal").style.display = "none";
    };
}

//order Modal
function OrderModal() {
    var order_modal = document.getElementById("add_order_Modal");
    var order_btn = document.getElementById("add_order_Btn");
    var order_span = document.getElementsByClassName("add_oder_close")[0];
    showModal(order_modal, order_btn, order_span);
    document.querySelector("#cancel_add_order").onclick = function () {
        order_modal.style.display = "none";
    };

    document.querySelector("#cancel_order").onclick = function () {
        document.querySelector("#order_Modal").style.display = "none";
    };
    //Delete Modal
    document.querySelector("#cancel_delete").onclick = function () {
        document.querySelector("#delete_Modal").style.display = "none";
    };
}

//product Modal
function ProductModal() {
    var product_modal = document.getElementById("add_product_Modal");
    var product_btn = document.getElementById("add_product_Btn");
    var product_span = document.getElementsByClassName("add_product_close")[0];
    showModal(product_modal, product_btn, product_span);
    document.querySelector("#cancel_add_order").onclick = function () {
        product_modal.style.display = "none";
    };
    document.querySelector("#cancel_update_product").onclick = function () {
        document.querySelector("#update_product_Modal").style.display = "none";
    };
    document.querySelector(".update_product_close ").onclick = function () {
        document.querySelector("#update_product_Modal").style.display = "none";
    };
    //Delete Modal
    document.querySelector("#cancel_delete").onclick = function () {
        document.querySelector("#delete_Modal").style.display = "none";
    };
}

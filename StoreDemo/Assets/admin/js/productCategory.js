$('#sumbit-create-pro-cate').on('click', function () {
    let name = $('#tb-product-category-create').val();
    let menuID = $('#dropdown-menu-create').val();
    if (name == "") {
        $('#alert-product-category-create').html("Vui lòng nhập thông tin")
        $('#alert-product-category-create').addClass("text-danger");
    }
    else {
        $.ajax({
            url: '/Admin/ProductCategory/Create',
            type: 'POST',
            data: { name: name, menuID: menuID },
            dataType: 'json',
            success: function (res) {
                console.log(res);
                if (res == 1) {
                    $('#addProductCategoryModal').modal('hide');
                    $('#alert-product-category').addClass('alert-success');
                    $('#alert-product-category').html(`Thêm danh mục ${name} thành công`);
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#datatable-category').load('/Admin/ProductCategory/DataTable');
                    $('#tb-product-category-create').val() = "";
                }
                if (res == 0) {
                    $('#alert-product-category-create').html("Tên đã tồn tại")
                    $('#alert-product-category-create').addClass("text-danger");
                }
                if (res == -1) {
                    $('#addProductCategoryModal').modal('hide');
                    $('#alert-product-category').addClass('alert-danger');
                    $('#alert-product-category').html(`Thêm thất bại, đã có lỗi xảy ra`);
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#tb-product-category-create').val() = "";
                }
            }
        })

    }
})

function ShowEditCateModal(id) {
    $.ajax({
        url: '/Admin/ProductCategory/Edit',
        data: { id: id },
        type: 'GET',
        success: function (res) {
            $('#editProductCategoryModal .modal-body').html(res);
            $('#editProductCategoryModal').modal('show');
        }
    })
}

$('.submit-edit-pro-cate').on('click', function () {
    var id = $('#edit-id-cate').val();
    console.log(id);
    var name = $('#edit-name-cate').val();
    var menuId = $('#edit-menu-cate').find(":selected").val();
    if (name == "") {
        $('#alert-product-category-create').html("Vui lòng nhập thông tin")
        $('#alert-product-category-create').addClass("text-danger");
    }
    else {
        $.ajax({
            url: '/Admin/ProductCategory/Edit',
            type: 'POST',
            data: { id: id, name: name, menuId: menuId },
            dataType: 'json',
            success: function (res) {
                console.log(res);
                if (res == 1) {
                    $('#editProductCategoryModal').modal('hide');
                    $('#alert-product-category').addClass('alert-success');
                    $('#alert-product-category').html(`Sửa danh mục ${name} thành công`);
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#datatable-category').load('/Admin/ProductCategory/DataTable');
                }
                if (res == 0) {
                    $('#alert-product-category-edit').addClass("text-danger");
                    $('#alert-product-category-edit').html("Tên đã tồn tại")
                }
                if (res == -1) {
                    $('#editProductCategoryModal').modal('hide');
                    $('#alert-product-category').addClass('alert-danger');
                    $('#alert-product-category').html(`Sửa thất bại, đã có lỗi xảy ra`);
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#tb-product-category-edit').val() = "";
                }
            }
        })
    }
})
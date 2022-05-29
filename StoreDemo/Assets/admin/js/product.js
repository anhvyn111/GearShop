
//Kiểm tra tên đã tồn tại trong tạo sản phẩm
$('#tb-product-name-create').on('keyup', function () {
    var name = $(this).val();
    var id = 0;
    $.ajax({
        url: '/Admin/Product/CheckNameExist',
        type: 'POST',
        data: {
            name: name, id: id
        },
        dataType: 'json',
        success: function (res) {
            if (!res) {
                $('#ms-product-name-create').removeClass("text-success");
                $('#ms-product-name-create').addClass("text-danger");
                $('#ms-product-name-create').html("Tên đã tồn tại");
                $('#tb-product-name-create').css("border-color", "Red");
            }
            else {
                $('#ms-product-name-create').html("Có thể sử dụng");
                $('#ms-product-name-create').removeClass("text-danger");
                $('#ms-product-name-create').addClass("text-success");
                $('#tb-product-name-create').css("border-color", "Green");
            }
        }
    });
});


//Kiểm tra tên đã tồn tại trong chỉnh sửa sản phẩm
$('#tb-product-name-edit').on('keyup', function () {
    var name = $(this).val();
    var id = $('#product-id-edit').val();
    $.ajax({
        url: '/Admin/Product/CheckNameExist',
        type: 'POST',
        data: {
            name: name, id: id
        },
        dataType: 'json',
        success: function (res) {
            if (!res) {
                $('#ms-product-name-edit').removeClass("text-success");
                $('#ms-product-name-edit').addClass("text-danger");
                $('#ms-product-name-edit').html("Tên đã tồn tại");
                $('#tb-product-name-edit').css("border-color", "Red");
            }
            else {
                $('#ms-product-name-edit').html("Có thể sử dụng");
                $('#ms-product-name-edit').removeClass("text-danger");
                $('#ms-product-name-edit').addClass("text-success");
                $('#tb-product-name-edit').css("border-color", "Green");
            }
        }
    });
});


//Load danh sách gắn thẻ của thể loại
$('#dropdown-category-edit').on('change', function (e) {
    e.preventDefault();
    var id = $(this).val();
    var productID = $('#product-id-edit').val();
    ListEditTagsByCategory(id, productID);
});

function ListEditTagsByCategory(id, productID) {
    $.ajax({
        url: '/Admin/Product/ListEditTagsByCategory',
        type: 'GET',
        data: {
            id: id, productID: productID
        },
        dataType: 'json',
        success: function (res) {
            var data = ``;
            for (var item of res) {
                if (item.ProductID == productID) {
                    data += `
                    <div class="form-check">
                      <input class="form-check-input"  name="CheckBoxTags" type="checkbox" value="${item.TagID}" checked>
                      <label class="form-check-label">${item.TagName}</label>
                    </div>
                `;
                }
                else {
                    data += `
                    <div class="form-check">
                      <input class="form-check-input" name="CheckBoxTags" type="checkbox" value="${item.TagID}">
                      <label class="form-check-label">${item.TagName}</label>
                    </div>
                `;
                }
            }
            $('#checkbox-product-tag-edit').html(data);
        }

    });
}






function DetailProduct(id) {
    $('#productDetailModal').modal('show');
    $.ajax({
        url: '/Admin/Product/LoadDetail',
        type: 'GET',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (response) {
            console.log(response.product)
            var data = `
                <dl class="dl-horizontal">
                    <dt>
                        Tên sản phẩm:
                    </dt>
                    <dd>
                        ${response.product.ProductName}
                    </dd>
                    <dt>
                        Loại sản phẩm:
                    </dt>
                    <dd>
                        ${response.category.CategoryName}
                    </dd>
                    <dt>
                        Giá:
                    </dt>
                    <dd>
                        ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(response.product.Price)}
                    </dd>
                    <dt>
                        Giá khuyến mãi:
                    </dt>
                    <dd>
                        ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(response.product.PromotionPrice)}
                    </dd>
                    <dt>
                        Chú thích:
                    </dt>
                    <dd>
                        ${response.product.Description}
                    </dd>
                    <dt>
                        Mô tả chi tiết:
                    </dt>
                    <dd>
                        ${response.product.Detail}
                    </dd>
                    <dt>
                        Tags:
                    </dt>
                    <dd>
                        ${response.product.ProductTag}
                    </dd>
                </dl>
            `;
            $('#modal-body-detail').html(data);
        }
    });
}
    

var id;
$('.btn-manage-images').on('click', function (e) {
    id = $(this).data('id');
    e.preventDefault();
    $('#manageImagesModal').modal('show');
    var id = $(this).data('id');
    LoadImages(id);
})

function DeleteImage(id) {
    if (confirm("Bạn có chắc sẽ xóa ảnh số " + id + " không?")) {
        $.ajax({
            url: '/Admin/Product/DeleteImages',
            type: 'POST',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (response) {
                if (response) {
                    $('#image-' + id).hide();
                }
                else {
                    alert("Không thể xóa vì sản phẩm phải có ít nhất 1 ảnh.");
                }
            }
        });
    } 
}

$('#btn-submit-images').on('click', function () {
    var fileUpload = $("#input-product-images").get(0);
    var files = fileUpload.files;
    var id = $('#hidden-product-id').val();
    // Create  a FormData object
    var fileData = new FormData();

    // if there are multiple files , loop through each files
    for (var i = 0; i < files.length; i++) {
        fileData.append(files[i].name, files[i]);
    }
    $.ajax({
        url: '/Admin/Product/UploadImages',
        type: 'POST',
        processData: false,
        contentType: false,
        data: { fileData },
        success: function (result) {
            alert(result);
        }
    });

});


function ChangeStatus(id) {
    if (confirm("Bạn có chắc muốn tắt sản phẩm " + id + " không?")) {
        $.ajax({
            url: '/Admin/Product/ChangeStatus',
            type: 'POST',
            data: { id },
            success: function (result) {
                if (result) {
                    $("#alert-product").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product").slideUp(500);
                    });
                    $('#alert-product').addClass('alert-success');
                    $('#alert-product').html('Cập nhật thành công');
                    $('#datatable-product').load('/Admin/Product/DataTable');
                }
                else {
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#alert-product').addClass('alert-danger');
                    $('#alert-product').html('Cập nhật thất bại');
                }
            }
        });
    }
}

function DeleteProduct(id) {
    if (confirm("Bạn có chắc muốn xóa sản phẩm " + id + " không?")) {
        $.ajax({
            url: '/Admin/Product/Delete',
            type: 'POST',
            data: { id },
            success: function (status) {
                if (status == 1) {
                    $("#alert-product").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product").slideUp(500);
                    });
                    $('#alert-product').addClass('alert-success');
                    $('#alert-product').html("Xóa sản phẩm thành công");
                    $('#datatable-product').load('/Admin/Product/DataTable');
                }
                else if (status == -1) {
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#alert-product').addClass('alert-danger');
                    $('#alert-product').html("Sản phẩm không tồn tại.");
                }
                else {
                    $("#alert-product-category").fadeTo(2000, 500).slideUp(500, function () {
                        $("#alert-product-category").slideUp(500);
                    });
                    $('#alert-product').addClass('alert-danger');
                    $('#alert-product').html("Không thể xóa vì sản phẩm đã được bán.");
                }
            }
        });
    }
}
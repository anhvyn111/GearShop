

$('.btn-detail-product').on('click', function (e) {
    e.preventDefault();
    $('#productDetailModal').modal('show');
    var id = $(this).data('id');
    $.ajax({
        url: '/Admin/Product/LoadDetail',
        type: 'GET',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (response) {
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
                        Thương hiệu:
                    </dt>
                    <dd>
                        ${response.product.Brand}
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
                        ${response.product.Decription}
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
                        ${response.product.Tags}
                    </dd>
                </dl>
            `;
            console.log(data);
            $('#modal-body-detail').html(data);
        }
    });
})

function LoadImages(id) {
    var data;
    $.ajax({
        url: '/Admin/Product/LoadImages',
        type: 'GET',
        data: {
            id: id
        },
        dataType: 'json',
        success: function (response) {
            data = `           
                    <table class="table">
                       `
            for (item of response) {
                data += `
                    <tr id="image-${item.ImageID}">
                        <td><img class="align-right float-end" src="/Images/Products/${item.ImageName}" style="width: 60%;"></td>
                        <td style="text-align: center;"><button type="button" class="btn btn-danger btn-delete-images" onclick="DeleteImage(${item.ImageID})" data-id="${ item.ImageID } ">Xóa</button></td>
                    </tr>   
                `;
            }
            data += `</table>`;
            console.log(data);
            $('#modal-body-manage-images').html(data);
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
                    $('#image-' + id).html('');
                    console.log("hello");
                }
            }
        });
    } 
}

var formData = new FormData();
$('#input-product-images').on('change', function () {
    var images = document.getElementById("input-product-images");
    for (i = 0; i < images.files.length; i++) {
        //Appending each file to FormData object
        formdata.append(images.files[i].name, images.files[i]);
    }
    //for (var i = 0; i < images.length; i++) {
    //}
    console.log(images);
})

//$('#btn-submit-images').on('click', function () {
//    var id = 29;
    
//})
function UploadImages() {
    $.ajax({
        url: "/Admin/Product/UploadImages",
        type: 'POST',
        data: { formData },
        dataType: "json",
        cache: false,
        processData: false,
        success: function (result, status, xhr) {
            console.log(result);
        }
    });
}

   


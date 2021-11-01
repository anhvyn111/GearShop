$('.btn-delete-cart').on('click', function (e) {
    e.preventDefault();
    id = $(this).data('id');
    if (confirm('Bạn có chắc sẽ xóa sản phẩm này?')) {
        $.ajax({
            url: "Cart/Delete",
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: function (res) {
                if (res == true) {
                    window.location.href = '/vo-hang';
                }
            },
            error: function (error) {
                console.log(error)
            }
        })
    }
})
$('.cart_value').on('change', function (e) {
    e.preventDefault();
    productID = $(this).data('id');
    quanlity = $(this).val();
    $.ajax({
        url: "Cart/UpdateQuanlity",
        type: 'POST',
        data: { productID: productID, quanlity: quanlity },
        dataType: 'json',
        success: function (res) {
            if (res == true) {     
                window.location.href = "/vo-hang";
            }
        },
        error: function (error) {
            console.log(error)
        }
    })    
})
function LoadOrders(id) {
    $.ajax({
        url: "/Admin/Order/DataTable",
        type: "GET",
        data: { id: id },
        dataType: 'json',
        success: function (res) {
            if (res != null) {
                var data = ``;
                for (item of res) {
                    data += `
                    <tr>
                                <td><p id="order_id">${item.OrderID}</p></td>
                                <td>
                                    <p id="order_cus">
                                        ${item.Email}
                                    </p>
                                </td>
                                <td>
                                    <p id="order_price"> ${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.TotalPrice)}<sup>đ</sup></p>
                                </td>
                                <td>
                                    <a href="/admin/xem-don-hang/${item.OrderID}" role="button" class="btn btn-success text-white">
                                        Xem đơn
                                    </a>
                                </td>
                    </tr>

                    `;
                }
                $('#order_body').html(data);
            }
        }
    })
}

$('#btn-pending').on('click', function () {
    $('#btn-pending').removeClass();
    $('#btn-pending').addClass("btn btn-success");
    $('#btn-delivering').removeClass();
    $('#btn-delivering').addClass("btn btn-outline-success me-2");
    $('#btn-delivered').removeClass();
    $('#btn-delivered').addClass("btn btn-outline-success me-2");
    $('#btn-cancelled').removeClass();
    $('#btn-cancelled').addClass("btn btn-outline-success me-2");
    LoadOrders(0);
})

$('#btn-delivering').on('click', function () {
    $('#btn-pending').removeClass();
    $('#btn-pending').addClass("btn btn-outline-success me-2");
    $('#btn-delivering').removeClass();
    $('#btn-delivering').addClass("btn btn-success");
    $('#btn-delivered').removeClass();
    $('#btn-delivered').addClass("btn btn-outline-success me-2");
    $('#btn-cancelled').removeClass();
    $('#btn-cancelled').addClass("btn btn-outline-success me-2");
    LoadOrders(1);
})

$('#btn-delivered').on('click', function () {
    $('#btn-pending').removeClass();
    $('#btn-pending').addClass("btn btn-outline-success me-2");
    $('#btn-delivering').removeClass();
    $('#btn-delivering').addClass("btn btn-outline-success me-2");
    $('#btn-delivered').removeClass();
    $('#btn-delivered').addClass("btn btn-success");
    $('#btn-cancelled').removeClass();
    $('#btn-cancelled').addClass("btn btn-outline-success me-2");
    LoadOrders(2);
})

$('#btn-cancelled').on('click', function () {
    $('#btn-pending').removeClass();
    $('#btn-pending').addClass("btn btn-outline-success me-2");
    $('#btn-delivering').removeClass();
    $('#btn-delivering').addClass("btn btn-outline-success me-2");
    $('#btn-delivered').removeClass();
    $('#btn-delivered').addClass("btnbtn-outline-success me-2");
    $('#btn-cancelled').removeClass();
    $('#btn-cancelled').addClass("btn btn-success");
    LoadOrders(-1);
})
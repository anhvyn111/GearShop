//$('.btn-detail-order').on('click', function (e) {
//    id = $(this).data('id');
//    $.ajax({
//        url: "Customer/OrderDetail",
//        type: "GET",
//        data: { id: id },
//        success: function (res) {
//            if (res) {
//                var data = `
//                    <thead>
//                        <tr>
//                            <td>Tên sản phẩm</td>
//                            <td>Số lượng</td>
//                            <td>Số tiền</td>
//                        </tr>
//                    </thead>
//                    <tbody>
//                    `;
//                if (res != null) {
//                    for (item of res) {
//                        data +=
//                            `
//                             <tr>
//                                <td>${item.Product.ProductName}</td>
//                                <td>${item.Quanlity}</td>
//                                <td${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.Price)}</td>
//                             </tr>           
//                            `;                              
//                    }
//                    data += '</tbody>';
//                }
//                $('#detail__order').html(data);
//            }
//        },
//        error: function (error) {
//            console.log(error);
//        }
//    })
//})

function viewOrderDetail(id) {
    user__order
    $.ajax({
        url: "Customer/OrderDetail",
        type: "GET",
        data: { id: id },
        success: function (res) {
            if (res) {
                var data = `
                    <thead>
                        <tr>
                            <td>Tên sản phẩm</td>
                            <td>Số lượng</td>
                            <td>Số tiền</td>
                        </tr>
                    </thead>
                    <tbody>
                    `;
                if (res != null) {
                    for (item of res) {
                        data +=
                            `
                             <tr>
                                <td>${item.Product.ProductName}</td>
                                <td>${item.Quanlity}</td>
                                <td${new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.Price)}</td>
                             </tr>           
                            `;                              
                    }
                    data += '</tbody>';
                }
                $('#detail__order').html(data);
            }
        },
        error: function (error) {
            console.log(error);
        }
    })
}
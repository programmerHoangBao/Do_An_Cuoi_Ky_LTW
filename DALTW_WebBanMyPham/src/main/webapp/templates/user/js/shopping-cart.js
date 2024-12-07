function deleteCartItem(event, userId, productId) {
    event.preventDefault(); // Ngừng hành động mặc định của form (reload trang)

    // Gửi yêu cầu POST tới API xóa giỏ hàng
    fetch(`/api/delete-cart/${userId}&${productId}`, {
        method: 'POST',
    })
        .then(response => response.json())  // Chờ nhận dữ liệu phản hồi dưới dạng JSON
        .then(data => {
            if (data.message === "Sản phẩm đã được xóa") {
                alert('Sản phẩm đã được xóa khỏi giỏ hàng!');

                // Sau khi xóa thành công, cập nhật lại giỏ hàng trên giao diện
                updateCartTable(userId);
            } else {
                alert('Có lỗi xảy ra khi xóa sản phẩm.');
            }
        })
        .catch(error => {
            console.error("Lỗi khi xóa sản phẩm:", error);
        });
}
function updateTotalPrice() {
    // Lấy tất cả các hàng trong giỏ hàng
    const rows = document.querySelectorAll('#cart-items-body tr');
    let totalPrice = 0;

    rows.forEach(row => {
        // Lấy giá từ cột thứ 5 (index 4)
        const price = parseFloat(row.cells[4].textContent.replace(' VNĐ', '').trim()); // Cột giá

        totalPrice += price;
    });

    // Kiểm tra sự tồn tại của phần tử trước khi cập nhật
    const totalPriceElement = document.querySelector('#total-price');
    if (totalPriceElement) {
        totalPriceElement.textContent = totalPrice + " VNĐ";
    } else {
        console.error("Không tìm thấy phần tử có id 'total-price'.");
    }
}

document.addEventListener('DOMContentLoaded', function() {
    updateTotalPrice();  // Gọi hàm sau khi DOM đã được tải
});
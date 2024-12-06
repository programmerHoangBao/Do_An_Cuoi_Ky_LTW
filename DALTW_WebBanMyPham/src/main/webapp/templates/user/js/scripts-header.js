// Add any additional JavaScript functionality if needed
document.addEventListener('DOMContentLoaded', function() {
    // Slide in the "Cosmetics" text from the position of the logo
    const nameLabel = document.getElementById('name');
    nameLabel.style.opacity = '1';
});
// Hàm để mở sidebar giỏ hàng và tải dữ liệu giỏ hàng
function openNav() {
    // Lấy userId từ session hoặc từ đâu đó
    const userId = document.getElementById("userId-cart").value; // Giả sử bạn lưu userId trong input ẩn

    // Gửi yêu cầu GET để lấy giỏ hàng của người dùng
    fetch(`/api/cart/user/${userId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch cart items");
            }
            return response.json();
        })
        .then(data => {
            console.log("Dữ liệu giỏ hàng nhận được:", data);  // Kiểm tra cấu trúc dữ liệu
            loadShoppingCart(data.items);  // Sử dụng data.items nếu dữ liệu trả về có thuộc tính items
        })
        .catch(error => {
            console.error("Lỗi khi tải giỏ hàng:", error);
        });

    // Hiển thị sidebar giỏ hàng
    document.getElementById("shoppingNavbar").style.width = "300px"; // Mở sidebar
}

// Hàm đóng sidebar giỏ hàng
function closeNav() {
    document.getElementById("shoppingNavbar").style.width = "0"; // Ẩn sidebar
}

// Hàm để hiển thị sản phẩm trong giỏ hàng
function loadShoppingCart(items) {
    const shoppingNavbar = document.getElementById("shoppingNavbar");
    const cartItemsBody = document.getElementById("cart-items-body");

    // Kiểm tra xem phần tử có tồn tại không
    if (!cartItemsBody) {
        console.error("Không tìm thấy phần tử cart-items-body.");
        return; // Dừng hàm nếu không tìm thấy phần tử
    }

    // Làm sạch giỏ hàng hiện tại
    cartItemsBody.innerHTML = "";  // Đảm bảo xóa phần tử cũ trước khi thêm mới

    if (items.length === 0) {
        cartItemsBody.innerHTML = "<tr><td colspan='2'>Giỏ hàng của bạn trống.</td></tr>";
    } else {
        items.forEach(item => {
            const row = document.createElement("tr");

            // Tính tổng tiền
            const totalPrice = item.shoppingCartQuantity * item.productPrice;

            row.innerHTML = `
                <td class="product-image">
                    <img src="${item.productImage}" alt="${item.productName}" class="product-image" />
                </td>
                <td class="product-details">
                    <div class="product-name">${item.productName}</div>
                    <div class="product-price-quantity">
                        <span class="product-quantity">Số lượng: ${item.shoppingCartQuantity}</span>
                        <span class="product-price">Giá: ${item.productPrice} VNĐ</span>
                    </div>
                    <div class="product-total-price">
                        <span><strong>Tổng tiền: ${totalPrice.toFixed(2)} VNĐ</strong></span>
                    </div>
                </td>
            `;
            cartItemsBody.appendChild(row);
        });
    }
}

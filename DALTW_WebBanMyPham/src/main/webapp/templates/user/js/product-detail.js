// Giải phóng dấu $
const jqEasyZoom = jQuery.noConflict();

jqEasyZoom(document).ready(function($) {
    // Khởi tạo EasyZoom
    const $easyzoom = $('.easyzoom').easyZoom();

    // Khởi tạo Owl Carousel
    const owlthumnail = $('.thumbnails');
    owlthumnail.owlCarousel({
        margin: 10,
        lazyLoad: true,
        responsive: {
            0: { items: 4 },
            480: { items: 4 },
            600: { items: 4 },
            1000: { items: 4 }
        }
    });

    // Điều khiển Owl Carousel
    $('.thumnail-nex').click(() => owlthumnail.trigger('next.owl.carousel'));
    $('.thumnail-pre').click(() => owlthumnail.trigger('prev.owl.carousel'));
});

// Biến toàn cục để lưu colorId được chọn
let selectedColorId = null;

function initializeDefaultColor() {
    // Lấy nút màu đầu tiên
    const firstColorButton = document.querySelector('.btn-color');
    if (firstColorButton) {
        const defaultColorId = firstColorButton.getAttribute('data-color-id');
        selectColor(defaultColorId, { target: firstColorButton });
    }
}

function selectColor(colorId, event) {
    // Cập nhật giá trị selectedColorId
    selectedColorId = colorId;
    console.log("Màu đã chọn (ID):", selectedColorId);

    // Xóa class 'selected' khỏi tất cả các nút
    document.querySelectorAll('.btn-color').forEach(button => {
        button.classList.remove('selected');
    });

    // Thêm class 'selected' vào nút được nhấn
    if (event && event.target) {
        event.target.classList.add('selected');
    } else {
        console.error("Event hoặc event.target không tồn tại.");
    }
}

// Gọi hàm chọn mặc định khi trang được tải
document.addEventListener('DOMContentLoaded', () => {
    initializeDefaultColor();
});
function followShop(idShop, idUser) {
    $.ajax({
        url: `/followshop/${idShop}&${idUser}`, // Gửi request tới URL
        type: 'GET',
        success: function(result) {
            // Xử lý kết quả sau khi gửi thành công (nếu cần)
            console.log('Follow shop thành công!');
            // Bạn có thể thực hiện thêm thao tác UI nếu muốn, ví dụ: thông báo cho người dùng
        },
        error: function(xhr, status, error) {
            // Xử lý lỗi nếu có
            console.log('Error:', error);
        }
    });
}
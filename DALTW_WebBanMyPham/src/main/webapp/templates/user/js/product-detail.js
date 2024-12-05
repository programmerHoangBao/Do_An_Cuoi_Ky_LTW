// Sử dụng jQuery với noConflict
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

    // Các đoạn mã khác
    const $followButton = $('#followButton');
    const shopId = $followButton.data('shop-id');
    const userId = $followButton.data('user-id');

    // Kiểm tra trạng thái Follow
    $.ajax({
        url: `/api/check-follow/${shopId}/${userId}`,
        type: 'GET',
        success: function (isFollowed) {
            if (isFollowed) {
                $followButton.find('i').removeClass('bx-heart').addClass('bxs-heart');
            } else {
                $followButton.find('i').removeClass('bxs-heart').addClass('bx-heart');
            }
        },
        error: function () {
            console.log('Không thể kiểm tra trạng thái follow');
        }
    });

    // Toggle Follow
    $followButton.click(function () {
        $.ajax({
            url: `/followshop/${shopId}&${userId}`,
            type: 'GET',
            success: function () {
                const icon = $followButton.find('i');
                if (icon.hasClass('bx-heart')) {
                    icon.removeClass('bx-heart').addClass('bxs-heart');
                } else {
                    icon.removeClass('bxs-heart').addClass('bx-heart');
                }
            },
            error: function () {
                console.log('Không thể cập nhật trạng thái follow');
            }
        });
    });
});
function loadReviews(productId) {
    const fragment = document.createDocumentFragment();
    // Kiểm tra productId trước khi gọi API
    if (!productId) {
        alert("Không có productId được cung cấp.");
        return;
    }

    // Gửi yêu cầu đến API
    fetch(`/reviews/${productId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch reviews");
            }
            return response.json();
        })
        .then(reviews => {
            const commentList = document.getElementById("comment-list");

            // Xử lý khi không có bình luận
            if (!reviews || reviews.length === 0) {
                commentList.innerHTML = "<p>Chưa có bình luận nào.</p>";
                return;
            }

            reviews.forEach(review => {
                // Lấy template
                const template = document.getElementById("comment-template").content;

                // Xóa nội dung cũ
                commentList.innerHTML = "";

                // Lặp qua các review và thêm vào DOM
                reviews.slice(0, 3).forEach(review => {
                    const clone = template.cloneNode(true);


                    // Gán dữ liệu cho các phần tử trong template
                    clone.querySelector(".userName").textContent = "Khách hàng: " + review.userName;
                    clone.querySelector(".productQuality").textContent = " Điểm :"+review.productQuality;
                    clone.querySelector(".reviewContent").textContent = " Đánh giá: " + review.reviewContent;
                    // Kiểm tra nếu imageUrls có giá trị, nếu có thì hiển thị, nếu không thì không thêm phần này
                    if (review.imageUrls) {
                        clone.querySelector(".imageUrls").textContent = " Hình ảnh: " + review.imageUrls;
                    } else {
                        clone.querySelector(".imageUrls").textContent = "";
                    }
                    // Thêm phần tử vào danh sách
                    commentList.appendChild(clone);
                });
            });


        })
        .catch(error => {
            console.error("Error:", error);
            alert("Không thể tải các bình luận. Vui lòng thử lại sau.");
        });
}
// Gọi hàm loadReviews khi tài liệu đã sẵn sàng
document.addEventListener("DOMContentLoaded", function () {
    const productId = document.getElementById("productId").value;
    loadReviews(productId);  // Gọi hàm load bình luận
});
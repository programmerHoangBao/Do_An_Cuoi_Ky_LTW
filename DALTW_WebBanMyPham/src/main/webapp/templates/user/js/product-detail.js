// Sử dụng jQuery với noConflict
const jqEasyZoom = jQuery.noConflict();

jqEasyZoom(document).ready(function() {
    // Khởi tạo EasyZoom
    const $easyzoom = jqEasyZoom('.easyzoom').easyZoom();

    // Khởi tạo Owl Carousel
    const owlthumnail = jqEasyZoom('.thumbnails');
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
    jqEasyZoom('.thumnail-nex').click(() => owlthumnail.trigger('next.owl.carousel'));
    jqEasyZoom('.thumnail-pre').click(() => owlthumnail.trigger('prev.owl.carousel'));

    // Các đoạn mã khác
    const $followButton = jqEasyZoom('#followButton');
    const shopId = $followButton.data('shop-id');
    const userId = $followButton.data('user-id');

    // Kiểm tra trạng thái Follow
    jqEasyZoom.ajax({
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
        // Kiểm tra nếu đã Follow, gọi API để hủy Follow
        const icon = $followButton.find('i');
        if (icon.hasClass('bxs-heart')) {
            // Nếu đã follow, gọi API hủy Follow
            jqEasyZoom.ajax({
                url: `/deletefollowshop/${shopId}&${userId}`,
                type: 'GET',
                success: function () {
                    icon.removeClass('bxs-heart').addClass('bx-heart');
                },
                error: function () {
                    console.log('Không thể hủy follow');
                }
            });
        } else {
            // Nếu chưa follow, gọi API để Follow
            jqEasyZoom.ajax({
                url: `/followshop/${shopId}&${userId}`,
                type: 'GET',
                success: function () {
                    icon.removeClass('bx-heart').addClass('bxs-heart');
                },
                error: function () {
                    console.log('Không thể cập nhật trạng thái follow');
                }
            });
        }
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

            // Kiểm tra dữ liệu trả về
            console.log(reviews);  // Kiểm tra xem dữ liệu có trả về đúng hay không

            // Xử lý khi không có bình luận
            if (!reviews || reviews.length === 0) {
                commentList.innerHTML = "<p>Chưa có bình luận nào.</p>";
                return;
            }

            // Xóa nội dung cũ chỉ một lần
            commentList.innerHTML = "";

            // Lặp qua các review và thêm vào DOM
            reviews.slice(0, 3).forEach(review => {
                // Lấy template
                const template = document.getElementById("comment-template").content;

                // Tạo clone của template
                const clone = template.cloneNode(true);

                // Gán dữ liệu cho các phần tử trong template
                clone.querySelector(".userName").textContent = "Khách hàng: " + review.userName;

                // Chuyển đổi thời gian thành đối tượng Date
                const reviewDate = new Date(review.reviewDate);

                // Lấy các thành phần của ngày
                const year = reviewDate.getFullYear();
                const month = String(reviewDate.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
                const day = String(reviewDate.getDate()).padStart(2, '0');

                // Định dạng ngày theo yyyy-mm-dd
                const formattedDate = `${year}-${month}-${day}`;

                // Gán ngày bình luận
                clone.querySelector(".reviewDate").textContent = formattedDate;
                clone.querySelector(".productQuality").textContent = " Điểm: " + review.productQuality;
                clone.querySelector(".reviewContent").textContent = " Đánh giá: " + review.reviewContent;

                // Kiểm tra nếu có imageUrls
                if (review.imageUrls) {
                    const anchorElement = document.createElement('a'); // Tạo thẻ <a>
                    anchorElement.href = `${window.location.origin}${review.imageUrls}`; // Gán đường dẫn cho thẻ <a>

                    const imageElement = document.createElement('img'); // Tạo thẻ <img>
                    imageElement.src = `${window.location.origin}${review.imageUrls}`; // Gán đường dẫn hình ảnh
                    imageElement.alt = 'Review Image'; // Thêm alt text cho hình ảnh
                    imageElement.classList.add('img-responsive'); // Thêm class 'img-responsive'

                    // Điều chỉnh kích thước ảnh
                    imageElement.width = 100;  // Thiết lập chiều rộng 100px
                    imageElement.height = 100; // Thiết lập chiều cao 100px

                    // Thêm thẻ <img> vào thẻ <a>
                    anchorElement.appendChild(imageElement);

                    // Thêm thẻ <a> vào phần tử .imageUrls
                    clone.querySelector(".imageUrls").appendChild(anchorElement);
                } else {
                    // Nếu không có hình ảnh, để trống hoặc hiển thị thông báo
                    clone.querySelector(".imageUrls").textContent = "";
                }


                // Thêm clone vào document fragment
                fragment.appendChild(clone);
            });

            // Thêm fragment vào commentList (chỉ thêm một lần)
            commentList.appendChild(fragment);

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

// Thêm đoạn mã liên quan đến đánh giá sao
jqEasyZoom(document).ready(function () {
    loadStar();

    /* 1. Visualizing things on Hover - See next part for action on click */
    jqEasyZoom('#stars li').on('mouseover', function () {
        var onStar = parseInt(jqEasyZoom(this).data('value'), 10); // Ngôi sao đang hover

        // Highlight tất cả các ngôi sao trước ngôi sao hiện tại
        jqEasyZoom(this).parent().children('li.star').each(function (e) {
            if (e < onStar) {
                jqEasyZoom(this).find('.bxs-star').addClass('hover');
            }
            else {
                jqEasyZoom(this).find('.bxs-star').removeClass('hover');
            }
        });
    }).on('mouseout', function () {
        jqEasyZoom(this).parent().children('li.star').each(function (e) {
            jqEasyZoom(this).find('.bxs-star').removeClass('hover');
        });
    });

    /* 2. Action to perform on click */
    jqEasyZoom('#stars li').on('click', function () {
        const onStar = parseInt(jqEasyZoom(this).data('value'), 10); // Ngôi sao được chọn
        const stars = jqEasyZoom(this).parent().children('li.star');

        // Loại bỏ lớp "bx-star-filled" từ tất cả các ngôi sao
        stars.find('.bxs-star').removeClass('bxs-star-filled');

        // Thêm lớp "bx-star-filled" cho tất cả các ngôi sao từ 1 đến ngôi sao được chọn
        for (let i = 0; i < onStar; i++) {
            jqEasyZoom(stars[i]).find('.bxs-star').addClass('bxs-star-filled');
        }

        // Lấy giá trị đánh giá (không cần thiết phải làm gì với nó, nhưng có thể dùng nếu cần)
        const ratingValue = parseInt(jqEasyZoom('#stars li.selected').last().data('value'), 10);
    });
});

function loadStar() {
    const starNumber = jqEasyZoom(".rating-stars").data("star");
    const star = document.querySelectorAll(".star");
    let dem = 0;
    star.forEach(function (e) {
        if (dem < starNumber) {
            e.classList.add('selected');
        }
        dem++;
    });
}

function chooseReview(el) {
    const stars = document.querySelectorAll('#stars li');
    const value = parseInt(el.getAttribute('data-value'), 10);

    // Gán giá trị sao vào phần tử chứa sao
    document.querySelector('.rating-stars').setAttribute('data-star', value);

    // Reset trạng thái sao
    stars.forEach(star => {
        star.querySelector('i').classList.remove('bx-star-filled');
    });

    // Gắn trạng thái đã chọn cho các sao được chọn
    for (let i = 0; i < value; i++) {
        stars[i].querySelector('i').classList.add('bx-star-filled');
    }
}
function addReview() {
    // Lấy thông tin từ form
    const userId = document.getElementById('userId').value;
    const productId = document.getElementById('productId').value;
    const comment = document.getElementById('comment').value;

    // Lấy số sao đã chọn
    const rating = document.querySelector('.rating-stars').getAttribute('data-star');

    // Kiểm tra người dùng đã đăng nhập
    if (userId == "") {
        alert('Vui lòng đăng nhập để gửi bình luận.');
        return;
    }

    // Kiểm tra các trường bắt buộc
    if (!comment) {
        alert('Vui lòng nhập nội dung bình luận.');
        return;
    }

    if (!rating || parseInt(rating, 10) === 0) {
        alert('Vui lòng chọn số sao.');
        return;
    }

    // Lấy hình ảnh
    const commentImages = document.getElementById('commentImages').files;
    const formData = new FormData();

    // Thêm dữ liệu vào formData
    formData.append('userId', userId);
    formData.append('productId', productId);
    formData.append('comment', comment);
    formData.append('rating', rating);

    // Thêm từng hình ảnh vào formData
    for (let i = 0; i < commentImages.length; i++) {
        formData.append('images', commentImages[i]);
    }

    // Gửi AJAX request
    fetch('/reviews/add-review', {
        method: 'POST',
        body: formData,
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Có lỗi xảy ra khi gửi bình luận.');
            }
            return response.json();
        })
        .then(data => {
            alert('Bình luận của bạn đã được gửi thành công!');
            // Reset form
            document.getElementById('comment-form').reset();
            document.querySelectorAll('#stars .bx-star-filled').forEach(star => {
                star.classList.remove('bx-star-filled');
            });

            // Sau khi gửi thành công, load lại các bình luận
            loadReviews(productId);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Không thể gửi bình luận. Vui lòng thử lại sau.');
        });
}
function addToCart() {
    // Lấy số lượng từ input
    const quantityInput = document.getElementById("quantity");
    const quantity = parseInt(quantityInput.value);
    const productId = document.getElementById("product_id").value; // ID sản phẩm từ thuộc tính data
    const userId = document.getElementById("userId-cart").value; // Lấy từ input ẩn

    if (!quantity || quantity < 1) {
        alert("Số lượng phải lớn hơn 0");
        return;
    }

    // API endpoint
    const url = `/api/cart-add`;

    // Payload gửi đến API
    const payload = new URLSearchParams({
        userId: userId, // Thay bằng ID người dùng (nếu có cơ chế đăng nhập, lấy từ session)
        productId: productId,
        quantity: quantity
    });

    // Gửi yêu cầu POST
    fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: payload
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Lỗi khi thêm sản phẩm vào giỏ hàng.");
            }
            return response.text();
        })
        .then(data => {
            alert(data); // Hiển thị thông báo thành công từ server
        })
        .catch(error => {
            console.error("Error:", error);
            alert("Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại.");
        });
}
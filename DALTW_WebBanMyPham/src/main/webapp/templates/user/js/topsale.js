$(document).ready(function() {
    // Khởi tạo carousel cho sản phẩm nổi bật
    $("#top-sale-carousel").owlCarousel({
        items: 4, // Số lượng item trong carousel
        loop: true, // Cho phép lặp
        margin: 10,
        nav: false, // Hiển thị nút điều hướng
        navText: ['<', '>'],
        autoplay: true, // Tự động chạy
        autoplayTimeout: 3000, // Thời gian mỗi slide

    });

    // Khởi tạo carousel cho sản phẩm mới nhất
    $("#newest-sale-carousel").owlCarousel({
        items: 4, // Số lượng item trong carousel
        loop: true, // Cho phép lặp
        margin: 10,
        nav: false, // Hiển thị nút điều hướng
        navText: ['<', '>'],
        autoplay: true, // Tự động chạy
        autoplayTimeout: 3000, // Thời gian mỗi slide

    });

    // Điều khiển riêng biệt cho từng nút "next"
    $("#next-top-sale").click(function() {
        $("#top-sale-carousel").trigger('next.owl.carousel');
    });

    $("#prev-top-sale").click(function() {
        $("#top-sale-carousel").trigger('prev.owl.carousel');
    });

    $("#next-newest-sale").click(function() {
        $("#newest-sale-carousel").trigger('next.owl.carousel');
    });

    $("#prev-newest-sale").click(function() {
        $("#newest-sale-carousel").trigger('prev.owl.carousel');
    });
});

$(document).ready(function(){
    const owl = $('.owl-carousel.special-sale');  // Lấy Owl Carousel
    owl.owlCarousel({
    loop: true,           // Chế độ lặp
    margin: 10,           // Khoảng cách giữa các item
    items: 4,             // Số lượng item hiển thị
    nav: false,            // Hiển thị nút điều hướng
    navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],  // Nút điều hướng mặc định
    });

    // Liên kết các nút "Previous" và "Next" với Owl Carousel
    $('.special-pre').click(function() {
    owl.trigger('prev.owl.carousel');
    });
    $('.special-nex').click(function() {
    owl.trigger('next.owl.carousel');
    });
});

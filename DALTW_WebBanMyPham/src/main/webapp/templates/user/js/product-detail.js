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

    $('.thumnail-nex').click(function() {
        owlthumnail.trigger('next.owl.carousel');
    });
    $('.thumnail-pre').click(function() {
        owlthumnail.trigger('prev.owl.carousel');
    });
});

$('.thumnail-nex').click(function () {
    owlthumnail.trigger('next.owl.carousel');
});
$('.thumnail-pre').click(function () {
    owlthumnail.trigger('prev.owl.carousel');
});
document.addEventListener('DOMContentLoaded', function() {
    if ($.fn.easyZoom) {
        const $easyzoom = $('.easyzoom').easyZoom();
    } else {
        console.error('EasyZoom is not loaded.');
    }
});
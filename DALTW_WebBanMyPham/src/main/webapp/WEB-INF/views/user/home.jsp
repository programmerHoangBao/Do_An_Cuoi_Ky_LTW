<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Link CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/user/css/topsale.css">

<!-- Tải CSS của Owl Carousel từ CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<!-- Tải jQuery từ CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Tải JavaScript của Owl Carousel từ CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/templates/user/js/topsale.js" defer></script>
<div class="row">
    <div class="col-lg-12">
        <div class="box-products">
            <div class="head-box">
                <div class="title-box">
                    <h2>
                        <a title="">
                            SẢN PHẨM NỔI BẬT
                        </a>
                    </h2>
                </div>
                <div class="arrow-slider">
                    <a href="javascript:void(0)" class="special-pre btn-pre bnts">
                        <i class='bx bx-chevron-left' aria-hidden="true"></i>
                    </a>
                    <a href="javascript:void(0)" class="special-nex btn-next bnts">
                        <i class='bx bx-chevron-right' aria-hidden="true"></i>
                    </a>
                </div>
                <div class="clr"></div>
            </div>
            <div class="body-box">
                <div class="owl-carousel special-sale">
                    <c:forEach items="${products}" var="product">
                        <div class="item">
                            <div class="pd-box">
                                <div class="box-images">
                                    <a href="" title="${product.name}">
                                        <img width="206" height="230"
                                             src="${pageContext.request.contextPath}/templates/images/logo.png"
<%--                                             data-src="${pageContext.request.contextPath}/templates/images/logo.png"--%>
                                             alt="${product.name}" class="img-reponsive" />
                                    </a>
<%--                                    <button type="button" onclick="LikeThis(this, '')" class="btn-addlike">--%>
<%--                                        <i class="fa fa-heart-o heart_new"></i>--%>
<%--                                    </button>--%>
                                    <div class="sale-off hide"></div>
                                </div>
                                <div class="box-content">
                                    <h3>
                                        <a href="" title="${product.name}"></a>
                                    </h3>
                                    <div>
                                        <span class="price-drop">${product.price}</span>
                                        <span class="price">${product.price}</span>
                                    </div>
                                    <div class="cd-content">
                                        <div class="timer-view" data-countdown="countdown" data-date="12-04-2024-12-24-49" data-start="12-04-2024-12-24-49" data-active="true"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Link CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/user/css/product-detail.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/user/css/easyzoom.css">

<!-- Tải CSS của Owl Carousel từ CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<!-- Tải jQuery từ CDN -->
<!-- Tải JavaScript của Owl Carousel từ CDN -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/templates/user/js/easyzoom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/templates/user/js/product-detail.js"></script>
<main role="main" class="pb-3">
    <div class="bracum">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ol class="ol-non">
                        <li><a href="${pageContext.request.contextPath}/user/home">Trang chủ</a></li>
                        <li><a href=""></a></li>
                        <li><a href="/"></a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="box-product-detail">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mar-bot-20">
                                    <div class="box-img-detail">
                                        <div class="config-alige">
                                            <div class="easyzoom easyzoom--overlay easyzoom--with-thumbnails">
                                                <a href="${pageContext.request.contextPath}/templates/images/logo.png">
                                                    <img src="${pageContext.request.contextPath}/templates/images/logo.png"
                                                    <%-- data-src="${pageContext.request.contextPath}/templates/images/logo.png"--%>
                                                         alt="${product.name}" class="img-reponsive" />
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-thumnail-detail">
                                        <a href="javascript:void(0)" class="thumnail-pre btn-thumail">
                                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                                        </a>
                                        <div class="thumbnails owl-carousel">
                                            <c:forEach items="${product.productColors}" var="color">
                                                <div class="item">
                                                    <div class="item-thumnail">
                                                        <a href="${pageContext.request.contextPath}/templates/images/logo.png" data-standard="${pageContext.request.contextPath}/templates/images/logo.png" class="active">
                                                            <img width="85" height="85" src="${pageContext.request.contextPath}/templates/images/logo.png"
                                                                 alt="${product.name}" class="img-reponsive" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <a href="javascript:void(0)" class="thumnail-nex btn-thumail">
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div>
                                    <h1 class="title-Product">
                                        ${product.name}
                                    </h1>
                                    <div class="box-price">
                                        <div class="price-drop">
                                            <span>${product.price}₫</span>
                                            <span class="issale hide">${product.price}₫</span>
                                            <span class="persale hide">${product.price}₫</span>
                                        </div>

                                    </div>
                                    <div class="card-box">
                                        <div class="hide hide min-sch ">
                                            <span class="hide">: <span><b id="load-type"></b></span></span>
                                        </div>
                                        <div class="select-land hide hide">
                                            <span class="hide">:</span>
                                            <ul class="ul-non ul-select">
                                            </ul>
                                            <div class="clr"></div>
                                        </div>
                                        <div class="inner-load">
                                            <div class="box-add">
                                                <div class="number-card">
                                                    <span>Số lượng:</span>
                                                    <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1" max="99" data-barcode="8809803587860" data-refId="10326">
                                                    <div class="clr"></div>
                                                </div>
                                                <div class="bst">
                                                    <button type="button" class="btn-bts btn-atc" onclick="AddCard(1)">
                                                        <i class="fa fa-shopping-cart"></i>
                                                        Thêm giỏ hàng
                                                    </button>
                                                    <button type="button" class="btn-bts btn-fs" onclick="AddCard(2)">
                                                        Mua Nhanh
                                                    </button>
                                                    <button type="button" class="btn-bts btn-hea " onclick="LikeProduct(this, '10326')">
                                                        <i class="fa fa-heart-o heart_new"></i>
                                                    </button>
                                                    <div class="clr"></div>
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
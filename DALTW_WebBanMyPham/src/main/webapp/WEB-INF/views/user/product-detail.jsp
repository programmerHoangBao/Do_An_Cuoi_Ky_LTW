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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
                                    <p><strong>Danh mục:</strong> ${product.category.name}</p>

                                    <div class="shop-follow-wrapper">
                                        <p><strong>Tên cửa hàng:</strong> ${product.shop.name}</p>
                                        <button
                                                type="button"
                                                id="followButton"
                                                class="btn-bts btn-hea"
                                                data-shop-id="${product.shop.id_shop}"
                                                data-user-id="${user.id_user}">
                                            <i class='bx bx-heart'></i>
                                        </button>
                                    </div>
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
                                        <div class="select-land">
                                            <span><strong>Chọn màu:</strong></span>
                                            <ul class="ul-non ul-select" style="display: flex; gap: 10px; padding: 0; list-style: none;">
                                                <c:forEach items="${product.productColors}" var="color">
                                                    <li>
                                                        <button
                                                            type="button"
                                                            class="btn-color"
                                                            data-color-id="${color.id_product_color}"
                                                            onclick="selectColor('${color.id_product_color}', event)">
                                                            ${color.color}
                                                        </button>
                                                    </li>
                                                </c:forEach>
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
                                                    <input type="hidden" id="userId-cart" value="${user.id_user}">
                                                    <input type="hidden" id="product_id" value="${product.id_product}">
                                                    <button type="button" class="btn-bts btn-atc" onclick="addToCart()">
                                                        <i class='bx bx-cart-add'></i>
                                                        Thêm giỏ hàng
                                                    </button>
                                                    <button type="button" class="btn-bts btn-fs" onclick="AddCard(2)">
                                                        Mua Nhanh
                                                    </button>

                                                    <div class="clr"></div>
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                        </div>
                                        <div class="rate-star">
                                            <div class='rating-stars' data-star="">
                                                <ul id='star'>
                                                    <li class='star' title='Tệ' data-value='1' onclick="chooseReview(this)">
                                                        <i class='bx bx-star'></i>
                                                    </li>
                                                    <li class='star' title='Tạm được' data-value='2' onclick="chooseReview(this)">
                                                        <i class='bx bx-star'></i>
                                                    </li>
                                                    <li class='star' title='Tốt' data-value='3' onclick="chooseReview(this)">
                                                        <i class='bx bx-star'></i>
                                                    </li>
                                                    <li class='star' title='Rất tốt' data-value='4' onclick="chooseReview(this)">
                                                        <i class='bx bx-star'></i>
                                                    </li>
                                                    <li class='star' title='Tuyệt vời' data-value='5' onclick="chooseReview(this)">
                                                        <i class='bx bx-star'></i>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="text-rating">
                                                <p><span>4</span> sao - <span>1</span> lượt đánh giá</p>
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
    <div class="container my-4" style="margin-left: -70px;">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">MÔ TẢ</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="payment-policy-tab" data-bs-toggle="tab" href="#payment-policy" role="tab" aria-controls="payment-policy" aria-selected="false">CHÍNH SÁCH THANH TOÁN</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="return-policy-tab" data-bs-toggle="tab" href="#return-policy" role="tab" aria-controls="return-policy" aria-selected="false">CHÍNH SÁCH ĐỔI TRẢ</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="comments-tab" data-bs-toggle="tab" href="#comments" role="tab" aria-controls="comments" aria-selected="false">BÌNH LUẬN</a>
            </li>
        </ul>
    </div>
    <div class="tab-content" id="myTabContent" style="color: black; background-color: #fad0c4; padding: 40px; border: 2px solid gray;">
        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
            Mô tả sản phẩm không có sẵn.
        </div>
        <div class="tab-pane fade" id="payment-policy" role="tabpanel" aria-labelledby="payment-policy-tab">
            <h4>Chính Sách Thanh Toán</h4>
            <p>Chúng tôi cung cấp nhiều phương thức thanh toán tiện lợi để khách hàng có thể dễ dàng thanh toán cho đơn hàng của mình. Dưới đây là các phương thức thanh toán mà ONESHOP hỗ trợ:</p>
            <h5>1. Thanh Toán Qua Thẻ Tín Dụng</h5>
            <p>Khách hàng có thể thanh toán trực tuyến bằng thẻ tín dụng hoặc thẻ ghi nợ quốc tế (Visa, MasterCard, JCB,…) qua cổng thanh toán bảo mật của chúng tôi.</p>
            <h5>2. Thanh Toán Qua Chuyển Khoản Ngân Hàng</h5>
            <p>Khách hàng có thể thực hiện thanh toán bằng cách chuyển khoản vào tài khoản ngân hàng của ONESHOP. Sau khi thanh toán, vui lòng gửi thông tin chuyển khoản cho chúng tôi qua email hoặc hệ thống để xác nhận đơn hàng.</p>
            <h5>3. Thanh Toán Khi Nhận Hàng (COD)</h5>
            <p>Khách hàng có thể lựa chọn thanh toán khi nhận hàng (COD). Sau khi nhận hàng từ đơn vị vận chuyển, khách hàng có thể thanh toán bằng tiền mặt cho nhân viên giao hàng.</p>
            <h5>4. Chính Sách Hoàn Tiền</h5>
            <p>Trong trường hợp bạn muốn hoàn lại sản phẩm, chúng tôi sẽ hoàn lại tiền vào tài khoản của bạn theo phương thức thanh toán đã sử dụng. Thời gian hoàn tiền sẽ được thực hiện trong vòng 5-7 ngày làm việc kể từ khi chúng tôi xác nhận yêu cầu hoàn trả.</p>
            <h5>5. Lưu Ý</h5>
            <p>- Mọi giao dịch thanh toán đều được bảo mật và mã hóa.</p>
            <p>- Nếu có bất kỳ vấn đề gì về thanh toán, vui lòng liên hệ với bộ phận chăm sóc khách hàng của chúng tôi để được hỗ trợ.</p>
        </div>
        <div class="tab-pane fade" id="return-policy" role="tabpanel" aria-labelledby="return-policy-tab">
            Nội dung chính sách đổi trả.
            <p>Chúng tôi cam kết mang lại sự hài lòng cho khách hàng khi mua sắm tại ONESHOP. Nếu bạn không hài lòng với sản phẩm đã mua, bạn có thể đổi trả sản phẩm theo các chính sách dưới đây:</p>
            <h4>1. Điều Kiện Đổi Trả</h4>
            <p>- Sản phẩm phải còn nguyên tem, mạc và không bị hư hại, sử dụng hoặc giặt qua.</p>
            <p>- Sản phẩm phải được đổi trong vòng <strong>7 ngày</strong> kể từ ngày nhận hàng.</p>
            <p>- Các sản phẩm giảm giá hoặc khuyến mãi không được đổi trả, trừ khi có sự cố do lỗi sản phẩm.</p>
            <h4>2. Quy Trình Đổi Trả</h4>
            <p>- Liên hệ với bộ phận chăm sóc khách hàng của ONESHOP qua số điện thoại <strong>0123 456 789</strong> hoặc email <strong>support@ONESHOP.com</strong> để yêu cầu đổi trả.</p>
            <p>- Đóng gói sản phẩm cần đổi trả và gửi lại cho chúng tôi theo địa chỉ sau: <strong>ONESHOP, Số 01 Võ Văn Ngân, Phường Linh Chiểu, Thành phố Thủ Đức, Thành phố Hồ Chí Minh</strong>.</p>
            <p>- Chúng tôi sẽ kiểm tra tình trạng sản phẩm và xác nhận việc đổi trả trong vòng 2-3 ngày làm việc.</p>
            <h4>3. Phí Vận Chuyển</h4>
            <p>- Nếu đổi trả do lỗi từ phía ONESHOP, chúng tôi sẽ chịu mọi chi phí vận chuyển.</p>
            <p>- Nếu đổi trả do lý do cá nhân, khách hàng sẽ chịu phí vận chuyển đối với sản phẩm đổi trả.</p>
            <h4>4. Hoàn Tiền</h4>
            <p>- Sau khi sản phẩm được kiểm tra và xác nhận hợp lệ, chúng tôi sẽ hoàn tiền vào tài khoản của bạn trong vòng 5-7 ngày làm việc.</p>
            <p>- Số tiền hoàn lại sẽ được chuyển qua phương thức thanh toán bạn đã sử dụng khi mua sản phẩm (thẻ tín dụng, chuyển khoản ngân hàng, v.v.).</p>
            <h4>5. Lưu Ý</h4>
            <p>- Sản phẩm đã qua sử dụng hoặc bị hư hại không đủ điều kiện đổi trả.</p>
            <p>- Chúng tôi chỉ chấp nhận đổi trả sản phẩm tại cửa hàng hoặc thông qua đơn vị vận chuyển mà chúng tôi chỉ định.</p>
            <p>Chúng tôi luôn nỗ lực để mang đến trải nghiệm mua sắm tuyệt vời cho khách hàng. Nếu có bất kỳ thắc mắc nào về chính sách đổi trả, đừng ngần ngại liên hệ với chúng tôi.</p>
        </div>
        <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">

            <div>
                <h5>Viết bình luận</h5>
                <form id="comment-form" enctype="multipart/form-data">
                    <input type="hidden" id="userId" value="${user.id_user}"> <!-- Lấy từ session -->
                    <input type="hidden" id="productId" value="${product.id_product}"> <!-- ID sản phẩm hiện tại -->

                    <!-- Đánh giá điểm -->
                    <div class='rating-stars' data-star="0">
                        <strong> Đánh giá </strong>
                        <ul id='stars'>
                            <li class='star' title='Tệ' data-value='1' onclick="chooseReview(this)">
                                <i class='bx bxs-star'></i>
                            </li>
                            <li class='star' title='Tạm được' data-value='2' onclick="chooseReview(this)">
                                <i class='bx bxs-star'></i>
                            </li>
                            <li class='star' title='Tốt' data-value='3' onclick="chooseReview(this)">
                                <i class='bx bxs-star'></i>
                            </li>
                            <li class='star' title='Rất tốt' data-value='4' onclick="chooseReview(this)">
                                <i class='bx bxs-star'></i>
                            </li>
                            <li class='star' title='Tuyệt vời' data-value='5' onclick="chooseReview(this)">
                                <i class='bx bxs-star'></i>
                            </li>
                        </ul>
                    </div>

                    <!-- Nội dung bình luận -->
                    <div class="mb-3">
                        <label for="comment">Nội dung bình luận:</label>
                        <textarea id="comment" name="comment" rows="3" class="form-control"></textarea>
                    </div>

                    <!-- Thêm hình ảnh bình luận -->
                    <div class="mb-3">
                        <label for="commentImages">Hình ảnh (tùy chọn):</label>
                        <input type="file" id="commentImages" name="commentImages[]" multiple accept="image/*" class="form-control">
                    </div>

                    <button type="button" class="btn btn-primary" onclick="addReview()">Gửi bình luận</button>
                </form>

                <h5 class="mt-4">Các bình luận</h5>
                <div id="comment-list">

                </div>
            </div>
            <template id="comment-template">
                <div class="comment-item mb-3">
                    <strong class="userName"></strong>
                    <span class="reviewDate"></span><br>
                    <span class="productQuality"></span>
                    <span class="reviewContent"></span><br>
                    <div class="imageUrls"></div> <!-- Sửa thành div để chứa hình ảnh -->
                </div>
            </template>
        </div>
    </div>

</main>
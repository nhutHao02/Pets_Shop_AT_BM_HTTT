$(document).ready(async function(){
    var object = $.parseJSON(JSON.stringify(await $.getJSON('./js/products.json')));
    function initRender() {
        for (var key in object) {
            var listProducts = object[key].map(function(element) {
                return `
                    <div class="col-lg-4 col-md-6 col-sm-6 moreBox" style="display:none">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${element.anh}" style="background-image: url(&quot;${element.anh}&quot;);">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="product-details.html">${element.ten}</a></h6>
                            <h5>${element.gia}đ</h5>
                        </div>
                    </div>
                </div>`
            });
            var renderList = listProducts.join('');
            $("#items").append(renderList);
        }
    };

    var object_dog = $.parseJSON(JSON.stringify(await $.getJSON('./js/products-dog.json')));
    function initRender1() {
        for (var key in object_dog) {
            var listProducts = object_dog[key].map(function(element) {
                return `<div class="col-lg-4 col-md-6 col-sm-6 moreBox" style="display:none">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${element.anh}" style="background-image: url(&quot;${element.anh}&quot;);">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="product-details.html">${element.ten}</a></h6>
                            <h5>${element.gia}đ</h5>
                        </div>
                    </div>
                </div>`
            });
            var renderList = listProducts.join('');
            $("#items-dog").append(renderList);
        }
    };

    var object_cat = $.parseJSON(JSON.stringify(await $.getJSON('./js/products-cat.json')));
    function initRender2() {
        for (var key in object_cat) {
            var listProducts = object_cat[key].map(function(element) {
                return `<div class="col-lg-4 col-md-6 col-sm-6 moreBox" style="display:none">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${element.anh}" style="background-image: url(&quot;${element.anh}&quot;);">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="product-details.html">${element.ten}</a></h6>
                            <h5>${element.gia}đ</h5>
                        </div>
                    </div>
                </div>`
            });
            var renderList = listProducts.join('');
            $("#items-cat").append(renderList);
        }
    };

    var object_accessory = $.parseJSON(JSON.stringify(await $.getJSON('./js/products-accessory.json')));
    function initRender3() {
        for (var key in object_accessory) {
            var listProducts = object_accessory[key].map(function(element) {
                return `<div class="col-lg-4 col-md-6 col-sm-6 moreBox" style="display:none">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${element.anh}" style="background-image: url(&quot;${element.anh}&quot;);">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="product-details.html">${element.ten}</a></h6>
                            <h5>${element.gia}đ</h5>
                        </div>
                    </div>
                </div>`
            });
            var renderList = listProducts.join('');
            $("#items-accessory").append(renderList);
        }
    };

    function defaultLoadmore() {
        $(".moreBox").slice(0, 9).show();
        $("#loadMore").click(function (e) {
            e.preventDefault();
            $(".moreBox:hidden").slice(0, 9).show();
            if ($(".moreBox:hidden").length == 0) {
                $("#loadMore").fadeOut('slow');
            }
        });
    }
    initRender();
    initRender1();
    initRender2();
    initRender3();
    defaultLoadmore();
});



$(function () {
    'use strict';
    initIndexBanner();

    $(".restaurant-item").live("click",function(){
        var itemid = $(this).attr("itemid");
        ehl.store.open.restaurantid = itemid;
        $.router.load("#page-restaurant-detail");
    });

    var mosqueTopPullToRefreshAndInfiniteScroll;
    $(document).on("pageAnimationStart", "#page-mosque-top", function (e, id, page) {
        if (!mosqueTopPullToRefreshAndInfiniteScroll) {
            mosqueTopPullToRefreshAndInfiniteScroll = new PullToRefreshAndInfiniteScroll({
                node: "#page-mosque-top",
                container: "#page-mosque-top .content",
                nokey: 'page',
                url: ehl.config.baseUrl + "/mosque/top",
                init: function (_this) {
                    $(_this.container + " .mosque-top .card").remove();
                    $(_this.container + " .infinite-scroll-preloader").remove();
                    $(_this.container).append('<div class="infinite-scroll-preloader"><div class="preloader"></div></div>');
                },
                callback: function (_this, result) {
                    var flag = true;
                    if (result.success && result.code == 200) {
                        var mosques = result.data.scoreMosques;
                        if (mosques.length < _this.pageSize) flag = false;
                        renderMosque("#page-mosque-top .content .mosque-top", mosques);
                    }
                    return flag;
                }
            });
        }
    });

    $(document).on("pageAnimationStart", "#page-trust-restaurant-top", function (e, id, page) {
        if ($("#page-trust-restaurant-top .shop_list").length != 10) {
            ehlAjax({
                url:ehl.config.baseUrl + "/restaurant/list",
                method:"GET",
                params:{page:1,pageSize:10,option:'trust'},
                callback:function(result){
                    if (result.success && result.code == 200) {
                        renderRestaurant("#"+id+" .content", result.data.trustRestaurants);
                    } else $.toast(result.message);
                }
            });
        }
    });
    $(document).on("pageAnimationStart", "#page-score-restaurant-top", function (e, id, page) {
        if ($("#"+id+" .shop_list").length != 10) {
            ehlAjax({
                url:ehl.config.baseUrl + "/restaurant/list",
                method:"GET",
                params:{page:1,pageSize:10,option:'overallrating'},
                callback:function(result){
                    if (result.success && result.code == 200) {
                        renderRestaurant("#"+id+" .content", result.data.trustRestaurants);
                    } else $.toast(result.message);
                }
            });
        }
    });

    $("#add_btn").click(function () {
        var select_node = $("#add_select");
        if (select_node.css("display") == 'none') {
            select_node.show();
        } else {
            select_node.hide();
        }
    });
    $("#page-add-mosque .submit-add").click(function () {
        //TODO CHECK
        submit({
            url: ehl.config.baseUrl + "/mosque", page: "page-add-mosque", callback: function (result) {
                if (result.success && result.code == 200) $.router.load("#page-index^back");
            }
        });
    });
    $("#page-add-restaurant .submit-add").click(function () {
        //TODO CHECK
        submit({
            url: ehl.config.baseUrl + "/restaurant", page: "page-add-restaurant", callback: function (result) {
                if (result.success && result.code == 200) $.router.load("#page-index^back");
            }
        });
    });

    $("#page-add-restaurant .cz_upload_btn").click(function () {
        var buttons1 = [
            {
                text: '添加餐厅照片类型',
                label: true
            },
            {
                text: '菜品',
                onClick: function () {
                    openPhotoBox('page-add-restaurant', '1');
                }
            },
            {
                text: '环境',
                onClick: function () {
                    openPhotoBox('page-add-restaurant', '2');
                }
            },
            {
                text: '其他',
                onClick: function () {
                    openPhotoBox('page-add-restaurant', '3');
                }
            }
        ];
        var buttons2 = [
            {
                text: '取消',
                bg: 'danger'
            }
        ];
        var groups = [buttons1, buttons2];
        $.actions(groups);
    });
    autoTextarea(document.getElementById("mosque_profile"));
    loadPrdList();
});


function initIndexBanner() {
    $("#index-banner").swiper({
        pagination: '.swiper-pagination',
        autoplay: 3000,
        paginationClickable: true
    });
}

function loadPrdList() {
    $.showIndicator();
    $.ajax({
        type: 'GET',
        url: ehl.config.baseUrl + '/index',
        dataType: 'json',
        timeout: ehl.config.timeout,
        success: function (data) {
            $.hideIndicator();
            if (data.success) {
                renderRestaurantCard("#trust_restaurants_items", data.data.trustRestaurants);
                renderRestaurantCard("#score_restaurants_items", data.data.scoreRestaurants);
                renderMosque("#mosque_items", data.data.scoreMosques);
            } else {
                $.toast(data.message);
            }
        },
        error: function (e) {
            printEr(e, "获取首页商店数据失败");
            $.hideIndicator();
        }
    })
}

function openPhotoBox(id, pictype) {
    ehl.modules['photo-upload'].open(id, function (datas) {
        console.log(datas);
        if (pictype) {
            for (var i = 0; i < datas.length; i++) {
                datas[i]['pictype'] = pictype;
            }
        }
        var input = $("#" + id + " .input_photos");
        var v = input.val();
        var arr = [];
        if (v)arr = JSON.parse(v);
        arr = arr.concat(datas);
        input.val(JSON.stringify(arr));
    });
}

function renderRestaurantCard(node, datas) {
    for (var i = 0; i < datas.length; i++) {
        var yeloow = datas[i].score, gray = 5 - yeloow, score = '';
        for (var s = 0; s < yeloow; s++) {
            score += '<img src="/img/front/ico/star_yeloow.png">';
        }
        for (var s = 0; s < gray; s++) {
            score += '<img src="/img/front/ico/star_gray.png">';
        }
        datas[i].score = score;
    }
    var html = template('restaurant-card-tpl', {items: datas});
    $(node).html(html);
}
function renderRestaurant(node, datas) {
    for (var i = 0; i < datas.length; i++) {
        var yeloow = datas[i].overallrating, gray = 5 - yeloow, score = '';
        for (var s = 0; s < yeloow; s++) {
            score += '<img src="/img/front/ico/star_yeloow.png">';
        }
        for (var s = 0; s < gray; s++) {
            score += '<img src="/img/front/ico/star_gray.png">';
        }
        datas[i].overallrating = score;
    }
    var html = template('restaurant-tpl', {items: datas});
    $(node).html(html);
}

function renderMosque(node, datas) {
    for (var i = 0; i < datas.length; i++) {
        var yeloow = datas[i].score, gray = 5 - yeloow, score = '';
        for (var s = 0; s < yeloow; s++) {
            score += '<img src="/img/front/ico/star_yeloow.png">';
        }
        for (var s = 0; s < gray; s++) {
            score += '<img src="/img/front/ico/star_gray.png">';
        }
        datas[i].score = score;
    }
    var html = template('mosque-tpl', {items: datas});
    $(node).html(html);
}

$(function () {

    $.get(ehl.config.baseUrl + "/users/detail/"+ehl.config.userid, {}, function (result) {
        if (result.success && result.code == 200) {
            ehl.store.user = result.data.user;
            $("#page-home .user-info .home-header-img").attr("src", ehl.store.user.picture);
            $("#page-home .user-info .home-header-name").html(ehl.store.user.nikename);
            $("#page-home .user-info .home-header-jifen").html("积分：" + (ehl.store.user.integral || 0));
            if (!ehl.store.user.iscertification)$("#page-home .user-info .home-header-btn").show();
            fillUserDetail();
        } else {

        }
    }, "json");

    var pullToRefreshAndInfiniteScroll;
    $(document).on("pageAnimationStart", "#page-follow", function (e, id, page) {
        if (!pullToRefreshAndInfiniteScroll) {
            pullToRefreshAndInfiniteScroll = new PullToRefreshAndInfiniteScroll({
                node: "#page-follow",
                container: "#page-follow .content",
                nokey: 'page',
                url: ehl.config.baseUrl + "/follow/"+ehl.config.userid,
                init: function (_this) {
                    console.log(_this);
                    $(_this.container + " ul li").remove();
                    $(_this.container + " .infinite-scroll-preloader").remove();
                    $(_this.container).append('<div class="infinite-scroll-preloader"><div class="preloader"></div></div>');
                },
                callback: function (_this, result) {
                    var flag = true;
                    if (result.success && result.code == 200) {
                        var follows = result.data.follows;
                        if (follows.length < _this.pageSize) flag = false;
                        fillFollows(follows);
                    }
                    return flag;
                }
            });
        }
    });

    $(document).on("pageAnimationStart", "#page-user-detail", function (e, id, page) {
        fillUserDetail();
    });

    $(document).on("pageAnimationStart", "#page-certification", function (e, id, page) {
        reset(id);
    });

    $(document).on("pageAnimationStart", "#page-collects", function (e, id, page) {
            var tab = $("#"+id+" #collect-tab1");
            if(tab.attr("loaded")!="true"){
                new InfiniteScroll({
                    node: "#"+id+" #collect-tab1",
                    preloader:'#'+id+' #collect-tab1 .infinite-scroll-preloader',
                    nokey: 'page',
                    url:ehl.config.baseUrl + "/collection/restaurant/"+ehl.config.userid,
                    method:"GET",
                    callback: function (_this, result) {
                        var flag = true;
                        if (result.success && result.code == 200) {
                            var items = result.data.collects;
                            if (items.length < _this.pageSize) flag = false;
                            renderRestaurant("#"+id+" #collect-tab1 .restaurant-container",items,'restaurant-collect-tpl');
                        }
                        return flag;
                    }
                });
                tab.attr("loaded","true");
            }
    });

    $("#page-collects .tab-link").click(function(){
        if($(this).text() == '清真寺'){
            var tab = $("#page-faxian #tab2");
            if(tab.attr("loaded")!="true"){
             new InfiniteScroll({
                node: "#page-collects #collect-tab2",
                preloader:'#page-collects #collect-tab2 .infinite-scroll-preloader',
                nokey: 'page',
                url:ehl.config.baseUrl + "/collection/mosque/"+ehl.config.userid,
                method:"GET",
                callback: function (_this, result) {
                    var flag = true;
                    if (result.success && result.code == 200) {
                        var items = result.data.collects;
                        if (items.length < _this.pageSize) flag = false;
                        renderMosque("#page-collects #collect-tab2 .mosque-container", items);
                    }
                    return flag;
                }
            });
        }
        }
    });

    $("#page-certification .cz_upfile").on("change", function (e) {
        upload([e.target.files[0]], function (response) {
            if (response.success && response.code == 200) {
                $("#page-certification .cz_form input[name='idCardURL']").val(response.data.URLS[0]);
            }
        });
    });

    $("#page-certification .submit-btn").click(function () {
        submit({
            url: ehl.config.baseUrl + "/users/certification", page: "page-certification", callback: function (result) {
                if (result.success && result.code == 200) $.router.load("#page-home");
            }
        });
    });

    $("#page-follow .cancel-follow").live('click', function () {
        var _this = $(this);
        var followid = _this.attr('followid');
        var buttons = [
            {
                text: '确定不再关注此人？',
                label: true
            },
            {
                text: '确定',
                onClick: function () {
                    $.showIndicator();
                    $.post(ehl.config.baseUrl + "/follow/cancel/" + followid, {}, function (result) {
                        $.hideIndicator();
                        if (result.success && result.code == 200)_this.parents('li').remove();
                        $.toast(result.message);
                    }, 'json');
                }
            },
            {
                text: '取消'
            }
        ];
        var groups = [buttons];
        $.actions(groups);
    });

    function fillFollows(follows) {
        for (var i = 0; i < follows.length; i++) {
            if (follows[i].sex == '女')
                follows[i].sex = 'girl';
            else follows[i].sex = 'boy';
        }
        $("#page-follow .content .list-block ul").append(template('follow-tpl', {items: follows}));
    }

    function fillUserDetail() {
        $("#page-user-detail .content").html(template('user-detail-tpl', {user: ehl.store.user}));
    }
    function renderRestaurant(node, datas,tpl) {
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
        if(!tpl){
            tpl = 'restaurant-tpl';
        }
        var html = template(tpl, {items: datas});
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
});
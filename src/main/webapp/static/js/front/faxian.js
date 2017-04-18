$(function(){
    var rIScroll = new InfiniteScroll({
        node: "#page-faxian #tab1",
        preloader:'#page-faxian #tab1 .infinite-scroll-preloader',
        nokey: 'page',
        url:ehl.config.baseUrl + "/restaurant/list",
        method:"GET",
        params:{option:'current',temperance:"true"},
        callback: function (_this, result) {
            var flag = true;
            if (result.success && result.code == 200) {
                var items = result.data.trustRestaurants;
                if (items.length < _this.pageSize) flag = false;
                renderRestaurant("#page-faxian #tab1 .restaurant-container",items);
            }
            return flag;
        }
    });

    var mIScroll;
    $("#page-faxian .tab-link").click(function(){
        if($(this).text() == '清真寺' && !mIScroll){
            mIScroll = new InfiniteScroll({
                node: "#page-faxian #tab2",
                preloader:'#page-faxian #tab2 .infinite-scroll-preloader',
                nokey: 'page',
                url:ehl.config.baseUrl + "/mosque/top",
                method:"GET",
                callback: function (_this, result) {
                    var flag = true;
                    if (result.success && result.code == 200) {
                        var mosques = result.data.scoreMosques;
                        if (mosques.length < _this.pageSize) flag = false;
                        renderMosque("#page-faxian #tab2 .mosque-container", mosques);
                    }
                    return flag;
                }
            });
        }
    });

});
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
    $(node).append(html);
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
    $(node).append(html);
}
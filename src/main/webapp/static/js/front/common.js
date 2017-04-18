function erDetail(e) {
    return "[status=" + e.status + ",statusText=" + e.statusText + "]";
}

function printEr(e, msg) {
    console.error((msg == (null || "") ? "出现未知异常" : msg) + erDetail(e));
}

Date.prototype.format = function(format){
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(), //day
        "h+" : this.getHours(), //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3), //quarter
        "S" : this.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
}

/**
 * 文本框根据输入内容自适应高度
 * @param                {HTMLElement}        输入框元素
 * @param                {Number}                设置光标与输入框保持的距离(默认0)
 * @param                {Number}                设置最大高度(可选)
 */
var autoTextarea = function (elem, extra, maxHeight) {
    extra = extra || 0;
    var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
        isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
        addEvent = function (type, callback) {
            elem.addEventListener ?
                elem.addEventListener(type, callback, false) :
                elem.attachEvent('on' + type, callback);
        },
        getStyle = elem.currentStyle ? function (name) {
            var val = elem.currentStyle[name];

            if (name === 'height' && val.search(/px/i) !== 1) {
                var rect = elem.getBoundingClientRect();
                return rect.bottom - rect.top -
                    parseFloat(getStyle('paddingTop')) -
                    parseFloat(getStyle('paddingBottom')) + 'px';
            }

            return val;
        } : function (name) {
            return getComputedStyle(elem, null)[name];
        },
        minHeight = parseFloat(getStyle('height'));


    elem.style.resize = 'none';

    var change = function () {
        var scrollTop, height,
            padding = 0,
            style = elem.style;

        if (elem._length === elem.value.length) return;
        elem._length = elem.value.length;

        if (!isFirefox && !isOpera) {
            padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
        }
        ;
        scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

        elem.style.height = minHeight + 'px';
        if (elem.scrollHeight > minHeight) {
            if (maxHeight && elem.scrollHeight > maxHeight) {
                height = maxHeight - padding;
                style.overflowY = 'auto';
            } else {
                height = elem.scrollHeight;
                style.overflowY = 'hidden';
            }
            ;
            style.height = height + extra + 'px';
            scrollTop += parseInt(style.height) - elem.currHeight;
            document.body.scrollTop = scrollTop;
            document.documentElement.scrollTop = scrollTop;
            elem.currHeight = parseInt(style.height);
        }
        ;
    };

    addEvent('propertychange', change);
    addEvent('input', change);
    addEvent('focus', change);
    change();
};

function filecompare(src, desc) {
    if (src.lastModified = desc.lastModified && src.name == desc.name && src.size == desc.size && src.type == desc.type)return true;
    return false;
}

function upload(files, callback) {
    var xhr = new XMLHttpRequest();
    //设置请求超时
    xhr.upload.timeout = 5000;
    xhr.upload.ontimeout = function (e) {
        console.log(e);
    }
    xhr.upload.addEventListener("progress", function (e) {
        $(".photo-upload-progress").html(Math.round(e.loaded / e.total * 100));
        console.log(e);
    }, false);
    //上传完成
    xhr.upload.addEventListener("load", function (e) {
        console.log(e);
    }, false);
    xhr.upload.addEventListener("error", function (e) {
        console.log(e);
        $.hidePreloader();
    }, false);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            $.hidePreloader();
            var response = JSON.parse(xhr.responseText);
            if (!(response.success && response.code == 200)) {
                $.toast(response.message);
                return;
            }
            if (callback) {
                callback(response);
            }
            $.toast("上传成功");
        }
    }
    var data = new FormData();
    if (!files.length) {
        $.toast("没有需要上传的图片！");
        return;
    }
    for (var i = 0; i < files.length; i++) {
        data.append("files", files[i]);
    }
    $.showPreloader('正在上传，进度: <span class="photo-upload-progress">0</span>%');
    xhr.open("POST", ehl.config.baseUrl + "/util/upload", true);
    xhr.send(data);
}

function getParams(page) {
    var params = {};
    $("#" + page + " .item-input input,textarea").each(function () {
        var _this = $(this), val = _this.val(), name = _this.attr("name");
        if (val && name) {
            params[name] = val;
        }
    });
    return params;
}

function submit(config) {
    var url = config.url;
    var page = config.page;
    var callback = config.callback;
    var params = getParams(page);
    if (config.check) {
        if (!config.check(params))return;
    }
    $.showIndicator();
    $.ajax({
        type: 'POST',
        url: url,
        data: params,
        dataType: 'json',
        timeout: ehl.config.timeout,
        success: function (result) {
            $.hideIndicator();
            $.toast(result.message);
            if (callback) {
                callback(result);
            }
        },
        error: function (xhr, type) {
            $.hideIndicator();
            $.toast("服务器无响应");
        }
    });
}
function reset(page) {
    $("#" + page + " .item-input input,textarea").each(function () {
        var _this = $(this);
        var v = _this.attr('init') ? _this.attr('init') : '';
        _this.val(v);
    });
}

function PullToRefreshAndInfiniteScroll(config) {
    this.container = config.container, this.pullpreloader = config.pullpreloader || '.pull-to-refresh-layer', this.pulltorefreshcontainer = config.pulltorefreshcontainer || 'pull-to-refresh-layer';
    var callback = config.callback;
    var _this = this;
    config.callback = function (obj, result) {
        var flag = true;
        if (callback) {
            flag = callback(obj, result);
        }
        $.pullToRefreshDone(_this.container);
        return flag;
    }

    this.infiniteScroll = new InfiniteScroll(config);
    $(_this.container).on('refresh', function () {
        var iscontainer = $(_this.infiniteScroll.infinitescrollcontainer);
        if (iscontainer.length > 0) {
            try {
                $.detachInfiniteScroll(iscontainer);
            } catch (e) {
                console.log(e);
            }
        }
        if (config.init) {
            config.init(_this);
        }
        iscontainer = $(_this.infiniteScroll.infinitescrollcontainer);
        try {
            $.attachInfiniteScroll(iscontainer);
        } catch (e) {
            console.log(e);
        }
        _this.infiniteScroll.reload();
    });
}

function InfiniteScroll(config) {
    this.pageNo = 1, this.loading = false, this.pageSize = config.pageSize || 20, this.url = config.url,
        this.node = config.node, this.method = config.method || 'GET', this.params = config.params || {},
        this.nokey = config.nokey || 'pageNo', this.sizekey = config.sizekey || 'pageSize',
        this.preloader = config.preloader || '.infinite-scroll-preloader', this.infinitescrollcontainer = config.infinitescrollcontainer || '.infinite-scroll';

    this.params[this.sizekey] = this.pageSize;
    var _this = this;
    $(_this.node).on('infinite', function () {
        this.load();
    });

    this.load = function () {
        // 如果正在加载，则退出
        if (_this.loading) return;
        _this.loading = true;
        _this.params[_this.nokey] = _this.pageNo;
        _this.xhr = $.ajax({
            type: _this.method,
            url: _this.url,
            data: _this.params,
            dataType: 'json',
            timeout: ehl.config.timeout,
            success: function (result) {
                _this.loading = false;
                if (config.callback) {
                    if (!config.callback(_this, result)) {
                        _this.last();
                        return;
                    } else {
                        _this.pageNo++;
                    }
                }
                $.refreshScroller();
            },
            error: function (xhr, type) {
                _this.loading = false;
                $.toast("服务器无响应");
                $(_this.preloader).hide();
                $.refreshScroller();
            }
        });
    }

    this.change = function (url, params) {
        this.xhr.abort();
        if (url != 'not_change')this.url = url;
        this.params = params || {};
        this.pageNo = 1;
        this.params[this.sizekey] = this.pageSize;
        this.load();
    }

    this.changeParams = function (params) {
        this.change('not_change', params);
    }
    this.reload = function (params) {
        this.pageNo = 1;
        this.changeParams(params);
    }
    this.destroy = function () {
        try {
            $.detachInfiniteScroll($(this.infinitescrollcontainer));
        } catch (e) {
            console.log(e);
        }
        // 删除加载提示符
        $(this.preloader).remove();

    }
    this.last = function () {
        var _this = this;
        try {
            $.detachInfiniteScroll($(this.infinitescrollcontainer));
        } catch (e) {
            console.log(e);
        }
        $(this.preloader).html("<div class='mid'>没有更多数据了</div>");
        $(this.preloader).animate({opacity: 0}, 2800, 'ease-out', function () {
            $(_this.preloader).hide();
        });
    }
    this.load();
}

function ehlAjax(config) {
    $.ajax({
        type: config.method||"GET",
        url: config.url,
        data: config.params,
        dataType: 'json',
        timeout: ehl.config.timeout,
        success: function (result) {
            if (config.callback) {
                config.callback(result);
            }
        },
        error: function (xhr, type) {
            $.toast("服务器无响应");
            if(config.error){
                config.error(xhr, type);
            }
        }
    });
}

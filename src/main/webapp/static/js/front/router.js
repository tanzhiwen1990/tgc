//===========================================================================
$(function () {
    $.router._switchToSection = function (sectionId, direction) {
        if (!sectionId) {
            return;
        }
        var $curPage = this._getCurrentSection(),
            $newPage = $('#' + sectionId);
        // 如果已经是当前页，不做任何处理
        if ($curPage === $newPage) {
            return;
        }
        this._animateSection($curPage, $newPage, direction || "from-right-to-left");
        this._pushNewState('#' + sectionId, sectionId);
    }

    $.router.load = function (url, ignoreCache) {
        if (ignoreCache === undefined) {
            ignoreCache = false;
        }
        if (this._isTheSameDocument(location.href, url)) {
            var direction;
            if (url.indexOf("^") > -1) {
                var tmps = url.split("^");
                url = tmps[0];
                direction = tmps[1] == 'back' ? "from-left-to-right" : "from-right-to-left";
            }
            var hashIndex = url.indexOf('#');
            var url = hashIndex === -1 ? '' : url.slice(hashIndex + 1);
            this._switchToSection(url, direction);
        } else {
            this._saveDocumentIntoCache($(document), location.href);
            this._switchToDocument(url, ignoreCache);
        }
    }
});

$.config = {
    // 路由功能开关过滤器，返回 false 表示当前点击链接不使用路由
    routerFilter: function ($link) {
        // 某个区域的 a 链接不想使用路由功能
        if ($link.is('.disable-router a')) {
            return false;
        }

        return true;
    }
};
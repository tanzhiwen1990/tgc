ehl.modules['photo-upload'] = {};
$(function () {
    'use strict';
    ehl.modules['photo-upload'].initEvent();
    $(document).on("pageInit", "#page-select-photo", function (e, id, page) {
        console.log("pageInit");
    });
    $(document).on("pageAnimationStart", "#page-select-photo", function (e, id, page) {
        console.log(e);
        console.log(id);
        console.log(page);
    });
    $(document).on("pageInit", "#page-preview-photo", function (e, id, page) {
        var fileList = ehl.store['fileList'];
        if (!fileList || fileList.length == 0)return;
        var swiper = $(page).find("#preview-swiper");
        var wrapper = swiper.find(".swiper-wrapper");
        ehl.modules['photo-upload'].renderPreviewPhoto(wrapper, fileList, 0);
        swiper.swiper({
            pagination: '#preview-photo-pagination',
            paginationType: 'fraction'
        });
    });
    $(document).on("pageInit", "#page-edit-photo", function (e, id, page) {
        var arr = ehl.store['checksPhoto'];
        if (arr) {
            ehl.modules['photo-upload'].renderEditPhoto($("#page-edit-photo .list-block ul"), arr, 0);
        }
    });
});

ehl.modules['photo-upload'].open = function (finishPage, callback) {
    ehl.modules['photo-upload'].finishPage = finishPage;
    ehl.modules['photo-upload'].callback = callback;
    ehl.modules['photo-upload'].reset();
    $.router.load("#page-select-photo");
}

ehl.modules['photo-upload'].reset = function () {
    ehl.store['checksPhoto'] = [];
    ehl.store['fileList'] = [];
    $(".photo_add_flag").remove();
}

ehl.modules['photo-upload'].initEvent = function () {
    //==============================================================
    $("#page-select-photo .cz_upfile").on("change", function (e) {
        var fileList = ehl.store['fileList'];
        if (!fileList)fileList = [];
        var len = e.target.files.length;
        var len2 = fileList.length;
        for (var i = 0; i < len; i++) {
            var file = e.target.files[i];
            var hasSame = false;
            for (var j = 0; j < len2; j++) {
                if (filecompare(file, fileList[j])) {
                    hasSame = true;
                    break;
                }
            }
            if (!hasSame) {
                fileList.push(file);
                ehl.modules['photo-upload'].appendSelectPhoto(file);
            }
        }
        ehl.store['fileList'] = fileList;
    });
    //=================================================================
    $("#page-select-photo .cz_img_box").live("click", function () {
        var checkbox = $(this).find(".img_checkbox");
        if (checkbox.length == 0)return;
        var key = checkbox.attr("key");
        if (checkbox.hasClass("img_checkbox_checked")) {
            checkbox.html('');
            checkbox.removeClass('img_checkbox_checked');
            ehl.modules['photo-upload'].rmPhoto(key);
        } else {
            checkbox.addClass('img_checkbox_checked');
            checkbox.append('<span class="icon icon-check img_checked_icon"></span>');
            ehl.modules['photo-upload'].addPhoto(key);
        }
    });
    //====================================================================
    $("#page-select-photo .next-btn").on("click", function () {
        $("#page-edit-photo .list-block ul").html('');
    });
    $("#page-select-photo .preview-btn").on("click", function () {
        $("#page-preview-photo #preview-swiper .swiper-wrapper").html('');
    });
    $("#page-edit-photo .photo-upload-btn").on("click", function () {
        var _this = $(this);
        if (_this.attr("inProgress") == "true") return;
        ehl.modules['photo-upload'].doUpload();
        _this.removeAttr("inProgress");
    });

}

ehl.modules['photo-upload'].doUpload = function () {
    upload(ehl.store['checksPhoto'], function (response) {
        if (ehl.modules['photo-upload'].callback) {
            ehl.modules['photo-upload'].callback(ehl.modules['photo-upload'].processData(response.data['URLS']));
        }
        if (ehl.modules['photo-upload'].finishPage) {
            $.router.load("#" + ehl.modules['photo-upload'].finishPage);
        }
    });
}

ehl.modules['photo-upload'].processData = function (URLS) {
    //TODO check
    var mapper = {};
    $("#page-edit-photo .list-block textarea").each(function () {
        var _this = $(this);
        var v = _this.val();
        if (v) {
            mapper[_this.attr("key")] = v;
        }
    });
    var len = URLS.length;
    var result = [];
    for (var i = 0; i < len; i++) {
        var o = {url: URLS[i]};
        var file = ehl.store['checksPhoto'][i];
        var description = mapper[(file.lastModified + '_' + file.size)];
        if (description) {
            o['description'] = description;
        }
        result.push(o);
    }
    return result;
}

ehl.modules['photo-upload'].addPhoto = function (key) {
    var arrs = ehl.store['checksPhoto'];
    var fileList = ehl.store['fileList'];
    if (!arrs)arrs = [];
    var len = fileList.length;
    for (var i = 0; i < len; i++) {
        var file = fileList[i];
        if (key == (file.lastModified + '_' + file.size)) {
            arrs.push(file);
            break;
        }
    }
    ehl.store['checksPhoto'] = arrs;
}

ehl.modules['photo-upload'].rmPhoto = function (key) {
    var arrs = ehl.store['checksPhoto'];
    for (var i = 0; i < arrs.length; i++) {
        var file = arrs[i];
        if (key == (file.lastModified + '_' + file.size)) {
            ehl.store['checksPhoto'].splice(i, 1);
            break;
        }
    }
}

ehl.modules['photo-upload'].renderPreviewPhoto = function (node, arr, index) {
    var file = arr[index];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
        node.append('<div class="swiper-slide"><img src="' + this.result + '" width="100%" height="100%"></div>');
        if ((arr.length - 1) > index)ehl.modules['photo-upload'].renderPreviewPhoto(node, arr, ++index);
    }
}

ehl.modules['photo-upload'].renderEditPhoto = function (node, arr, index) {
    var file = arr[index];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
        node.append('<li class="item-content"> <div class="item-inner"><div class="item-title"><img class="list_img" width="100%" height="100%" src="' + this.result + '"/></div><div class="item-input"><textarea key="' + file.lastModified + '_' + file.size + '" placeholder="简单描述下图片吧..."></textarea></div></div></li>');
        if ((arr.length - 1) > index)ehl.modules['photo-upload'].renderEditPhoto(node, arr, ++index);
    }
}

ehl.modules['photo-upload'].appendSelectPhoto = function (file) {
    var rows = $("#page-select-photo .row");
    var len = rows.length;
    var lastrow, newrow = true;
    if (len > 0) {
        lastrow = $(rows[len - 1]);
        var cols = lastrow.find(".cz_img_box");
        if (cols.length < 3) {
            newrow = false;
        }
    }
    if (newrow) {
        lastrow = $('<div class="row no-gutter photo_add_flag"></div>');
        $("#page-select-photo .content").append(lastrow);
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
        lastrow.append('<div class="col-33 cz_img_box photo_add_flag"><div class="img_checkbox" key="' + file.lastModified + '_' + file.size + '"></div><img src="' + this.result + '" class="upload_box_img"></div>');
    }
}
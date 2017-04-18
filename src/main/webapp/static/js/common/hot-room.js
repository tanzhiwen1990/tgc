
	function getStyle(obj, name) {
	if (obj.currentStyle) {
		return obj.currentStyle[name];
	} else {
		return getComputedStyle(obj, false)[name];
	}
}
//var alpha = 30;
function startMove(obj, arr, iTarget) {
	clearInterval(obj.timer);

	obj.timer = setInterval(function() {
		var cur = 0;
		if (arr == 'opacity') {
			cur = Math.round(parseFloat(getStyle(obj, arr)) * 100);
		} else {
			cur = parseInt(getStyle(obj, arr));
		}
		var speed = (iTarget - cur) / 6;
		speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed);
		if (cur == iTarget) {
			clearInterval(obj.timer);
		} else {
			if (arr == 'opacity') {
				obj.style.filter = 'alpha(opcity:' + (cur + speed) + ')';
				obj.style.opacity = (cur + speed) / 100;

				//	document.getElementById('tex1').value = obj.style.opacity;
			} else {
				obj.style[arr] = cur + speed + 'px';
			}
		}
	}, 30);
}

function getByClass(oParent, sClass) {
	var aEle = oParent.getElementsByTagName('*');
	var aResult = [];

	for (var i = 0; i < aEle.length; i++) {
		if (aEle[i].className == sClass) {
			aResult.push(aEle[i]);
		}
	}
	return aResult;
}


window.onload = function() {
	var oDiv = document.getElementById('playimages');
	var oMarkLeft = getByClass(oDiv, 'mark_left')[0];
	var oMarkRight = getByClass(oDiv, 'mark_right')[0];
	var oDivSmall = getByClass(oDiv, 'small_pic')[0];
	var oUlSmall = oDivSmall.getElementsByTagName('ul')[0];
	var aLiSmall = oDivSmall.getElementsByTagName('li');


	var oUlBig = getByClass(oDiv, 'big_pic')[0];
	var aLiBig = oUlBig.getElementsByTagName('li');


	var nowZIndex = 2;
	var now = 0;
	oUlSmall.style.width = aLiSmall.length * aLiSmall[0].offsetWidth + 'px';


	//大图切换
	for (var i = 0; i < aLiSmall.length; i++) {
		aLiSmall[i].index = i;
		aLiSmall[i].onclick = function() {
			
			if (this.index == now) return;
			now = this.index;
			tab();


		}
		aLiSmall[i].onmouseover = function() {
			startMove(this, 'opacity', 100);
		};
		aLiSmall[i].onmouseout = function() {
			if (this.index != now) {
				startMove(this, 'opacity', 30);
			}
		};
	}

	function tab() {
		
		
		for (var i = 0; i < aLiBig.length; i++) {
			startMove(aLiBig[i], 'opacity', 0);
		}
		
		for (var i = 0; i < aLiSmall.length; i++) {
			startMove(aLiSmall[i], 'opacity', 30);
		}
		startMove(aLiBig[now], 'opacity', 100);

		startMove(aLiSmall[now], 'opacity', 100);
		if (now == 0) {
			startMove(oUlSmall, 'left', 0);
		} else if (now == aLiSmall.length - 1) {
			startMove(oUlSmall, 'left', -(now - 2) * aLiSmall[0].offsetWidth);
		} else {
			startMove(oUlSmall, 'left', -(now - 1) * aLiSmall[0].offsetWidth);
		}
	}
	oMarkLeft.onclick = function() {
		now--;
		if (now == -1) {
			now = aLiSmall.length - 1;
		}
		tab();
	}
	oMarkRight.onclick = function() {
		now++;
		if (now == aLiSmall.length) {
			now = 0;
		}
		tab();
	};
	var timer = setInterval(oMarkRight.onclick, 5000);
	oDiv.onmouseover = function() {
		clearInterval(timer);
	};
	oDiv.onmouseout = function() {
		timer = setInterval(oMarkRight.onclick, 5000);
	};
};



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
                    };

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
            };
            scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

            elem.style.height = minHeight + 'px';
            if (elem.scrollHeight > minHeight) {
                    if (maxHeight && elem.scrollHeight > maxHeight) {
                            height = maxHeight - padding;
                            style.overflowY = 'auto';
                    } else {
                            height = elem.scrollHeight - padding;
                            style.overflowY = 'hidden';
                    };
                    style.height = height + extra + 'px';
                    scrollTop += parseInt(style.height) - elem.currHeight;
                    document.body.scrollTop = scrollTop;
                    document.documentElement.scrollTop = scrollTop;
                    elem.currHeight = parseInt(style.height);
            };
    };

    addEvent('propertychange', change);
    addEvent('input', change);
    addEvent('focus', change);
    change();
};



    // 百度地图API功能
    var mp = new BMap.Map("allmap",{enableMapClick:false});
    
    mp.centerAndZoom(new BMap.Point(116.3964,39.9093), 12);
    mp.enableScrollWheelZoom();
   	mp.setMinZoom(12);     
   	
	mp.addEventListener("zoomend", function(){  
		mp.clearOverlays()
		if(this.getZoom()===12){
			var shuju1 = [{'name':'九龙坡','r':'116.407845',l:'39.914101'},{'name':'江北','r':'116.417845',l:'39.924101'},{'name':'沙坪坝','r':'116.427845',l:'39.944101'}];
		     for (var i = 0; i<shuju1.length ;i++){
		     	mp.addOverlay(new ComplexCustomOverlay_1(new BMap.Point(shuju1[i].r,shuju1[i].l), shuju1[i].name));
		     }
		}
		if(this.getZoom()>=13){
			var shuju = [{'name':'银湖海岸城','pic':'20000元/m²','r':'116.407845',l:'39.914101'},{'name':'华润二十四城','pic':'12000元/m²','r':'116.417845',l:'39.924101'}];
	         for (var i = 0; i<shuju.length ;i++){
	         	mp.addOverlay(new ComplexCustomOverlay(new BMap.Point(shuju[i].r,shuju[i].l), shuju[i].name,shuju[i].pic));
	         }
		}
	});    
   
    // 定义1级覆盖物
    function ComplexCustomOverlay_1(point,text){
      this._point = point;
      this._text = text;
    }
    ComplexCustomOverlay_1.prototype = new BMap.Overlay();
    ComplexCustomOverlay_1.prototype.initialize = function(map){
      this._map = map;
      var point = this._point;
      var div = this._div = document.createElement("div");
	  
      
      div.style.position = "absolute";
      div.style.zIndex = BMap.Overlay.getZIndex(point.lat); 

      div.style.height = "100px";
      div.style.width = "100px";
      div.style.color = "#fff";
      div.style.textAlign = "center";
      div.style.borderRadius = "50px";
      div.style.backgroundColor = "#5ea51e";
      div.style.opacity = ".9";
      div.style.lineHeight = "100px";
      div.style.fontSize = "12px";
      div.innerText = this._text;
      var that = this;
     
      
      div.onmouseover = function(){
        this.style.backgroundColor = "#f60";
        this.style.zIndex = "99";
      }
 
      div.onmouseout = function(){
       this.style.backgroundColor = "#5ea51e";
       this.style.zIndex = "1";
      }
      
      div.onclick = function(){
       mp.centerAndZoom(new BMap.Point(point.lng,point.lat), 13);
      }
 	
      mp.getPanes().labelPane.appendChild(div);
       
      return div;
    }
    ComplexCustomOverlay_1.prototype.draw = function(){
      var map = this._map;
      var pixel = map.pointToOverlayPixel(this._point);
      this._div.style.left = pixel.x -50 + "px";
      this._div.style.top  = pixel.y -50 + "px";
    }

    
    
 var shuju = [{'name':'九龙坡','r':'116.407845',l:'39.914101'},{'name':'江北','r':'116.417845',l:'39.924101'},{'name':'沙坪坝','r':'116.427845',l:'39.944101'}];
    
     for (var i = 0; i<shuju.length ;i++){
     	mp.addOverlay(new ComplexCustomOverlay_1(new BMap.Point(shuju[i].r,shuju[i].l), shuju[i].name));
     }
 
 
 
 
 
 
 
     function ComplexCustomOverlay(point, text, mouseoverText){
      this._point = point;
      this._text = text;
      this._overText = mouseoverText;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(map){
      this._map = map;
      var div = this._div = document.createElement("div");
      var lay = this._lay = document.createElement("div");
      var span1 = this.span1 = document.createElement("span");
      var span2 = this.span2 = document.createElement("span");
      div.appendChild(span1);
      div.appendChild(span2);
      div.appendChild(lay);
      
      lay.style.position = "absolute";
      lay.style.height = "38px";
      lay.style.width = "200px";
      lay.style.top = "-45px";
      lay.style.left = "15px";
      lay.style.backgroundColor = "#fff"; 
      lay.style.display = "none"; 
      
      
      div.style.position = "absolute";
      div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat); 
      div.style.whiteSpace = "nowrap";
      div.style.MozUserSelect = "none";
      div.style.height = "18px";
      div.style.color = "white";
      div.style.lineHeight = "18px";
      div.style.fontSize = "12px"
      var that = this;
      
      span1.style.backgroundColor = "#5ea51e";     
      span1.style.padding = "2px 10px";
	  span1.appendChild(document.createTextNode(this._text));
	
	  span2.style.backgroundColor = "#fff"; 
	  span2.style.color = "#f60";
      span2.style.padding = "2px 5px";
	  span2.appendChild(document.createTextNode(this._overText));
 
      var arrow = this._arrow = document.createElement("div");
      arrow.style.position = "absolute";
      arrow.style.width = "0";
      arrow.style.height = "0";
      arrow.style.borderLeft = "5px solid transparent";
     arrow.style.borderRight = "5px solid transparent";
     arrow.style.borderTop = "5px solid #5ea51e"; 
      arrow.style.top = "18px";
      arrow.style.left = "10px";
      arrow.style.overflow = "hidden";
      div.appendChild(arrow);
      
      div.onmouseover = function(){
        that.span1.style.backgroundColor = "#f60";
        that._arrow.style.borderTop = "5px solid #f60";
       	that._lay.style.display = "block"; 
        arrow.style.backgroundPosition = "0px -20px";
      }
 
      div.onmouseout = function(){
      	that._lay.style.display = "none"; 
        that.span1.style.backgroundColor = "#5ea51e";
        that._arrow.style.borderTop = "5px solid #5ea51e"; 
        arrow.style.backgroundPosition = "0px 0px";
      }
 
      mp.getPanes().labelPane.appendChild(div);
       
      return div;
    }
    ComplexCustomOverlay.prototype.draw = function(){
      var map = this._map;
      var pixel = map.pointToOverlayPixel(this._point);
      this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
      this._div.style.top  = pixel.y - 30 + "px";
    }

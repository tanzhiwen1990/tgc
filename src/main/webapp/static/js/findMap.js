
    // 百度地图API功能
    var mp = new BMap.Map("allmap",{enableMapClick:false});
    
    mp.centerAndZoom(new BMap.Point(106.477428, 29.51923), 12);
    mp.enableScrollWheelZoom();
   	mp.setMinZoom(12);     
   	
	
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
       mp.clearOverlays()
       mp.centerAndZoom(new BMap.Point(point.lng,point.lat), 13);
   	   mp.setZoom(13);   
       var text=$(this).text();
       $("#DistrictID").text(text);
	   ajaxDataHouse(text);
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

    
     function ComplexCustomOverlay(point, text, mouseoverText,id){
      this._point = point;
      this._text = text;
      this._overText = mouseoverText;
      this._id = id;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(map){
    	 this._map = map;
         var div = this._div = document.createElement("div");
         var lay = this._lay = document.createElement("div");
   	    var a1=this.a1=document.createElement("a");
         var span1 = this.span1 = document.createElement("span");
         var span2 = this.span2 = document.createElement("span");
	   	  a1.appendChild(span1);
	   	  a1.appendChild(span2);
	   	  div.appendChild(a1);
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
      
      a1.href="../front/house/detail?id="+this._id ;
      
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
       /* that._arrow.style.borderTop = "5px solid #f60";*/
       /*	that._lay.style.display = "block"; */
        arrow.style.backgroundPosition = "0px 0px";
        this.style.zIndex = "88";
      }
 
      div.onmouseout = function(){
      	that._lay.style.display = "none"; 
        that.span1.style.backgroundColor = "#5ea51e";
      /*  that._arrow.style.borderTop = "5px solid #5ea51e"; */
        arrow.style.backgroundPosition = "0px 0px";
        this.style.zIndex = "0";
       
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
	
	//ajax请求区域数据
function ajaxDataDistrict(base){
	var datas ="";
	$.ajax({ 
	    type: "post", 
	    url: "/findMapHouse/findMapDistrict", 
	    dataType: "json",
	    success: function(result) {
	    	datas = datas + "[";
	    	for(var i = 0 ; i<result.data.length ; i++){
	    		if(i == (result.data.length-1)){
	    			datas = datas + '{"name":"'+result.data[i].district_name+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'"}';
	    		} else {
	    			datas = datas + '{"name":"'+result.data[i].district_name+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'"},';
	    		}
	    		
	    	}
	    	datas = datas + "]";
	    	var str1 = JSON.parse(datas);
	    	for (var i = 0; i < str1.length; i++) {
				mp.addOverlay(new ComplexCustomOverlay_1(new BMap.Point(str1[i].r,
						str1[i].l), str1[i].name));
			}
			
	    }
	    
	});   
}


function ajaxDataHouse(text){
	var datas ="";
	var pirceunit="";
	$.ajax({ 
	    type: "post", 
	    url: "../findMapHouse/findMapHouse", 
		data: {'text':text},
	    dataType: "json",
	    success: function(result) {
	    	$('#la').empty();
	    	if(result.data.length<1){
	    		  $('#la').append("<div class='noneoffice'><img src='../static/img/error1.png'/></div>" );
	        	}else{
	    	for(var j=0; j<result.data.length ; j++){
	    		var unit=result.data[j].house_unit;
	    		if(unit==undefined||unit==''){
	    			unit='元/㎡.月';
	    		}
	    	dataText = "<div class='map-side-item'>" +
			  "<a class='img-warp' href='..front/house/detail?id="+ result.data[j].house_id +"'>" +
			  "<img src='.."+ result.data[j].house_picture_addr +"'/></a>" +
			  "<div class='text-warp'>" +
			  	"<h2><a href='..front/house/detail?id="+ result.data[j].house_id +"'>"+ result.data[j].house_name +"</a></h2>" +
			  	"<p class='pic'>价格："+ result.data[j].house_money +"<span>"+ unit +"</span></p>" +
			  	"<p>办公等级：<span>"+ result.data[j].building_level +"</span> </p>" +
			  	"<p>详细地址：<span>"+ result.data[j].house_address +"</span></p>" +
			  "</div> </div> ";
               $('#la').append(dataText);
	    	}
	       }
	    	datas = datas + "[";
	    	for(var i = 0 ; i<result.data.length ; i++){
	    		
	    		if(i == (result.data.length-1)){
	    			 pirceunit=result.data[i].house_unit;
		    		if(pirceunit==undefined||pirceunit==''){
		    			pirceunit='元/㎡.月';
		    		}
	    			datas = datas + '{"name":"'+result.data[i].house_name+'","pic":"'+result.data[i].house_money+''+pirceunit+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'","id":"'+result.data[i].house_id+'"}';
	    		} else {
	    			 pirceunit=result.data[i].house_unit;
		    		if(pirceunit==undefined||pirceunit==''){
		    			pirceunit='元/㎡.月';
		    		}
	    			datas = datas + '{"name":"'+result.data[i].house_name+'","pic":"'+result.data[i].house_money+''+pirceunit+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'","id":"'+result.data[i].house_id+'"},';
	    		}
	    		
	    		
	    		
	    	}
	    	datas = datas + "]";
	    
	    	var str1 = JSON.parse(datas);
	    	
	    	for (var i = 0; i<str1.length ;i++){
	         	mp.addOverlay(new ComplexCustomOverlay(new BMap.Point(str1[i].l,str1[i].r), str1[i].name,str1[i].pic,str1[i].id));
	        }
	    }
	});
}

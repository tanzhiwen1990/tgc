/**
 * 换一批功能实现
 */
(function ($) {
	       var showArray=[];
	       var toBeenArray=[];
	       var result = [];
	       var num=-1;
           $.refresh = function (params) {
             var oldArray=params.object;
             var length;
             num=num+1;
             oldArray.hide();
             if(result.length==0||num==0){
             while ((length = oldArray.length) > 0) {
                  result.push(oldArray.splice(parseInt(length * Math.random(), 10), 1)[0]);
             };
             };
             	showArray=result.splice(0, 3);
                $.merge(toBeenArray,showArray);
                $.each(showArray, function (i, n) {
                   $(this).show();
                });
           };
       })(jQuery);//换一批
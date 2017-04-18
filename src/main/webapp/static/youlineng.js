/**
 * Created by Administrator on 2017/3/6 0006.
 */
$(function(){
    $(".img1").show();
    $(".img2").hide();
    setInterval('imgifshow()',3000);
});
var now = 1;
function imgifshow(){
    if(now == 1){
        /*$(".img1").fadeOut("slow");
         $(".img2").fadeIn("slow");*/
        $(".img1").hide();
        $(".img2").show();
        now = 0;
    }else{
        /*$(".img2").fadeOut("slow");
         $(".img1").fadeIn("slow");*/
        $(".img2").hide();
        $(".img1").show();
        now = 1;
    }
}
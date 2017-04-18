<%@page import="java.io.Console"%>
<%@page import="java.util.regex.Matcher"%>  
<%@page import="java.util.regex.Pattern"%>  
<%@ page language="java" pageEncoding="UTF-8"%>  
<%!  
  
// \b 是单词边界(连着的两个(字母字符 与 非字母字符) 之间的逻辑上的间隔),  
// 字符串在编译时会被转码一次,所以是 "\\b"  
// \B 是单词内部逻辑间隔(连着的两个字母字符之间的逻辑上的间隔)  
String phoneReg = "\\b(ip(hone|od)|android|opera m(ob|in)i"  
        +"|windows (phone|ce)|blackberry"  
        +"|s(ymbian|eries60|amsung)|p(laybook|alm|rofile/midp"  
        +"|laystation portable)|nokia|fennec|htc[-_]"  
        +"|mobile|up.browser|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";  
String tableReg = "\\b(ipad|tablet|(Nexus 7)|up.browser"  
        +"|[1-4][0-9]{2}x[1-4][0-9]{2})\\b";  
Pattern phonePat = Pattern.compile(phoneReg, Pattern.CASE_INSENSITIVE);  
Pattern tablePat = Pattern.compile(tableReg, Pattern.CASE_INSENSITIVE);  
  
public boolean checkMobile(String userAgent){  
    if(null == userAgent){  
        userAgent = "";  
    }  
    // 匹配  
    Matcher matcherPhone = phonePat.matcher(userAgent);  
    Matcher matcherTable = tablePat.matcher(userAgent);  
    if(matcherPhone.find() || matcherTable.find()){  
        return true;  
    } else {  
        return false;  
    }  
}  
%>
   
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
  
//  
String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();  
if(null == userAgent){  
    userAgent = "";  
}  
if(checkMobile(userAgent)){  
    response.sendRedirect(basePath+"mobile");  
 } else {  
    response.sendRedirect(basePath+"index");  
}  
%>  
  
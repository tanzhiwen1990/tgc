package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/*
 * 微信授权
 */
public class WXAuthUtil {
   public static final String APPID="wx495c1b0013ba768d";
   public static final String appsecret="85a76871558d34624ef5127fe0864178";
   private static String scope="snsapi_userinfo";
   private static String redirect_url="http://1u5l669025.51mypc.cn/wx/index";
   /*生成OAuth重定向URI（用户同意授权，获取code）*/
   private static final String HTTPS_OPEN_WEIXIN_QQ_COM_CONNECT_OAUTH2_AUTHORIZE = "https://open.weixin.qq.com/connect/oauth2/authorize";
   /*通过code换取网页授权access_token*/
   private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token";
   /*刷新access_token（如果需要）*/
   private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_REFRESH_TOKEN = "https://api.weixin.qq.com/sns/oauth2/refresh_token";
   /*拉取用户信息(需scope为 snsapi_userinfo)*/
   private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_USERINFO = "https://api.weixin.qq.com/sns/userinfo";
   /*检验授权凭证（access_token）是否有效*/
   
   /*
    * 第一步：用户同意授权，获取code
    * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf0e81c3bee622d60&redirect_uri=http%3A%2F%2Fnba.bluewebgame.com%2Foauth_response.php&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect
    */
   
   public static String getCode(){
	   String param="?appid="+APPID+"&redirect_uri="+ redirect_url+"&response_type=code"
	   		+ "&scope="+scope+"&state=STATE#wechat_redirect";
	   String code=sendPost(HTTPS_OPEN_WEIXIN_QQ_COM_CONNECT_OAUTH2_AUTHORIZE, param);
	   return code;
   }
   
   /**
    *   1 第一步：用户同意授权，获取code
		2 第二步：通过code换取网页授权access_token
		3 第三步：刷新access_token（如果需要）
		4 第四步：拉取用户信息(需scope为 snsapi_userinfo)
		5 附：检验授权凭证（access_token）是否有效
    */
   /**
    * 2 第二步：通过code换取网页授权access_token
    *
    *https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
   **/
   public static JsonObject getAccessToken(String code){
	  String param="?appid="+APPID+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
	  String access_tolen=sendPost(HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_ACCESS_TOKEN, param);
	  JsonObject jsonObject=new Gson().fromJson(access_tolen, JsonObject.class);
	  return jsonObject;
   }
   
   /**
    * 3 第三步：刷新access_token（如果需要）
    *
    *https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN
   **/
   public static JsonObject refreshAccessToken(String access_token){
	  
	   String param="?appid="+APPID+"&grant_type=refresh_token&refresh_token="+access_token+"";
	  
	   return new Gson().fromJson(sendPost(HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_REFRESH_TOKEN, param), JsonObject.class);
   }
   
   /**
    * 4 第四步：拉取用户信息(需scope为 snsapi_userinfo)
    *
    *https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
   **/
   public static JsonObject getUserInfo(String openid,String access_token){
	   String param="?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
	   String result=sendPost(HTTPS_API_WEIXIN_QQ_COM_SNS_USERINFO, param);
	   JsonObject info=new Gson().fromJson(result, JsonObject.class);
	   return info;
   }
   
   
   
   //发送post请求通用方法
   public static String sendPost(String url, String param) {
	  
       PrintWriter out = null;
       BufferedReader in = null;
       String result = "";
       try {
           URL realUrl = new URL(url);
           // 打开和URL之间的连接
           URLConnection conn = realUrl.openConnection();
           // 设置通用的请求属性
           conn.setRequestProperty("accept", "*/*");
           conn.setRequestProperty("connection", "Keep-Alive");
           conn.setRequestProperty("user-agent",
                   "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
           // 发送POST请求必须设置如下两行
           conn.setDoOutput(true);
           conn.setDoInput(true);
           // 获取URLConnection对象对应的输出流
           out = new PrintWriter(conn.getOutputStream());
           // 发送请求参数
           out.print(param);
           // flush输出流的缓冲
           out.flush();
           // 定义BufferedReader输入流来读取URL的响应
           in = new BufferedReader(
                   new InputStreamReader(conn.getInputStream()));
           String line;
           while ((line = in.readLine()) != null) {
               result += line;
           }
       } catch (Exception e) {
           System.out.println("发送 POST 请求出现异常！"+e);
           e.printStackTrace();
       }
       //使用finally块来关闭输出流、输入流
       finally{
           try{
               if(out!=null){
                   out.close();
               }
               if(in!=null){
                   in.close();
               }
           }
           catch(IOException ex){
               ex.printStackTrace();
           }
       }
       return result;
   } 
  
   
  //使用httpclient 发送post请求
   public static JsonObject post(String url){
	   //
	   JsonObject jsonObject=null;
	   @SuppressWarnings("resource")
	   HttpClient httpClient=new DefaultHttpClient();
	   HttpPost httpPost=new HttpPost(url);
	   HttpResponse response;
	try {
		response = httpClient.execute(httpPost);
		 HttpEntity entity=response.getEntity();
		 String result;
		result = EntityUtils.toString(entity,"utf-8");
		jsonObject=new Gson().fromJson(result, JsonObject.class);
 
	} catch (IOException e) {
		e.printStackTrace();
	}finally {
		httpPost.releaseConnection();
	}
	  return jsonObject;
	   
   }
 
}



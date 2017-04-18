package com.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.AmapGeocodeResult;
import com.model.AmapPositionResult;

/**   
* @Title: VerifyIdcard.java 
* 
* @Description: TODO 高德地图工具
* 
* @author tianjianping@meloinfo.com 
* 
* @date 2016年8月25日 上午9:25:19 
*/
public class AmapHelper {

	static String positionUrl = AppConfig.amap_positionUrl;
	static String key = AppConfig.amap_key;
	static String geoUrl = AppConfig.amap_geoUrl;
	
	public static Map<String, Object> getPosition(double longitude, double latitude){ 
		
		String httpArg = "key="+ key + "&location=" + longitude + "," + latitude;
		String jsonResult = request(positionUrl, httpArg);
		//String jsonResult = "{ \"reason\": \"成功1\", \"result\": { \"realname\": \"董好帅\",\"idcard\": \"330329199001020012\",\"res\": 1  }, \"error_code\": 0 }";
		Gson gson = new Gson();
		AmapPositionResult amapPositionResult = gson.fromJson(jsonResult,AmapPositionResult.class);
		if(amapPositionResult.getInfocode().equals("10000")){
			Map<String, Object> map = new HashMap<>();
			map.put("citycode", Integer.parseInt(amapPositionResult.getRegeocode().getAddressComponent().getCitycode()));
			map.put("area", amapPositionResult.getRegeocode().getAddressComponent().getDistrict());
			return map;
		}
		return null;
	}
	
	public static Map<String, Object> getPositionDetail(double longitude, double latitude){ 
		
		String httpArg = "key="+ key + "&location=" + longitude + "," + latitude;
		String jsonResult = request(positionUrl, httpArg);
		//String jsonResult = "{ \"reason\": \"成功1\", \"result\": { \"realname\": \"董好帅\",\"idcard\": \"330329199001020012\",\"res\": 1  }, \"error_code\": 0 }";
		Gson gson = new Gson();
		AmapPositionResult amapPositionResult = gson.fromJson(jsonResult,AmapPositionResult.class);
		Map<String, Object> map = new HashMap<>();
		if(amapPositionResult.getInfocode().equals("10000")){
			map.put("success", "true");
			map.put("area", amapPositionResult.getRegeocode().getAddressComponent().getDistrict());
			map.put("address", amapPositionResult.getRegeocode().getFormatted_address());
			return map;
		}else{
			map.put("success", "false");
			return map;
		}
	}
	
	public static Map<String, Object> getGeo(String address,String city){ 
		
		String httpArg = "key="+ key + "&address=" + address + "&city=" + city;
		String jsonResult = request(geoUrl, httpArg);
		//String jsonResult = "{ \"reason\": \"成功1\", \"result\": { \"realname\": \"董好帅\",\"idcard\": \"330329199001020012\",\"res\": 1  }, \"error_code\": 0 }";
		Gson gson = new Gson();
		AmapGeocodeResult amapGeocodeResult = gson.fromJson(jsonResult,AmapGeocodeResult.class);
		Map<String, Object> map = new HashMap<>();
		if(amapGeocodeResult.getInfocode().equals("10000") && !amapGeocodeResult.getCount().equals("0")){
			map.put("location", amapGeocodeResult.getGeocodes().get(0).getLocation());
			map.put("province", amapGeocodeResult.getGeocodes().get(0).getProvince());
			map.put("city", amapGeocodeResult.getGeocodes().get(0).getCity());
			map.put("area", amapGeocodeResult.getGeocodes().get(0).getDistrict());
			map.put("success", "true");
			return map;
		}else{
			map.put("success", "false");
			return map;
		}
	}
	
	/**
	 * @param urlAll
	 *            :请求接口
	 * @param httpArg
	 *            :参数
	 * @return 返回结果
	 */
	public static String request(String httpUrl, String httpArg) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + httpArg;

	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	/**
	 * {
    "status":0,
    "message":"ok",
    "results":[
        {
            "name":"高庙村",
            "location":{
                "lat":29.542392,
                "lng":106.475851
            },
            "address":"轨道交通1号线",
            "detail":1,
            "uid":"17dd433a996927a041ab9ad9",
            "detail_info":{
                "distance":1667
            }
        }
    ]
}
	 * @param keyword
	 * @param localtion
	 * @param radius
	 * @param ak
	 * @return
	 */
	//http://api.map.baidu.com/place/v2/search?query=酒店&page_size=10&page_num=0&scope=1&location=39.915,116.404&radius=2000&output=json&ak={您的密钥}
	public static JsonObject name(String keyword,String localtion,Integer radius,String ak ) {
		String httpArg = "query="+keyword+"&page_size=1"
				+ "&filter=industry_type:life|sort_name:distance|sort_rule:1"
				+"&scope=2&location="+localtion+"&radius="+radius+"&output=json&ak="+ak;
		String url="http://api.map.baidu.com/place/v2/search";
			
		JsonObject json=new Gson().fromJson(request(url, httpArg),JsonObject.class);
		
		return json;
	}
	
	
	public static void  main(String[] args) {
		String as="{ \"reason\": \"成功1\", \"result\": { \"realname\": \"董好帅\",\"idcard\": \"330329199001020012\",\"res\": 1  }, \"error_code\": 0 }";
		System.out.println(new Gson().fromJson(as, JsonObject.class).get("result"));
	}
	
}

package com.controller.response;

/**
 * 请求成功返回的对象
 * @author MyZhang
 *
 */
public class NormalResponse extends Response {

	public NormalResponse(Object data) {
		this.setCode(ResponseCode.OK);
		this.setMessage("");
		this.setData(data);
		this.setSuccess(true);
	}
	
	public NormalResponse() {
		this.setCode(ResponseCode.OK);
		this.setMessage("");
		this.setData(null);
		this.setSuccess(true);
	}

}

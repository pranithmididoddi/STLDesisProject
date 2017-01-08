package com.stldesis.action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;

public class CustomImageBytesResult implements Result{

	private static final long serialVersionUID = -4307183426349985864L;

	public void execute(ActionInvocation invocation) throws Exception {
		 
		ImageAction action = (ImageAction) invocation.getAction();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType(action.getCustomContentType());
		response.setHeader("cache-control", "no-cache");
		response.getOutputStream().write(action.getCustomImageInBytes());
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}

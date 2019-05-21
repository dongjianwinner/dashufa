package com.dashufa.common;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
public class JsonUtil {
	/**
	 * 向前台写json数据
	 * 
	 * @param rep
	 * @param name
	 * @param obj
	 * @throws IOException
	 */
	public static void ObjectToJson(HttpServletResponse rep, String name,
			Object obj) throws IOException {
		rep.setContentType("UTF-8");
		ServletOutputStream out = rep.getOutputStream();
		ObjectMapper objectmapper = new ObjectMapper();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		objectmapper.setDateFormat(sdf);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(name, obj);
		objectmapper.writeValue(out, map);
	}

	public static void ObjectToJson(HttpServletResponse rep, Object obj)
			throws IOException {
		rep.setContentType("UTF-8");
		ServletOutputStream out = rep.getOutputStream();
		ObjectMapper objectmapper = new ObjectMapper();
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		objectmapper.setDateFormat(sdf);*/
		objectmapper.writeValue(out, obj);
	}
	public static void ObjectToJsonFormatTime(HttpServletResponse rep, Object obj,String format)
			throws IOException {
		rep.setContentType("UTF-8");
		ServletOutputStream out = rep.getOutputStream();
		ObjectMapper objectmapper = new ObjectMapper();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		objectmapper.setDateFormat(sdf);
		objectmapper.writeValue(out, obj);
	}
	public static void ObjectToJsonFormatTime(HttpServletResponse rep, String name,
			Object obj,String format) throws IOException {
		rep.setContentType("UTF-8");
		ServletOutputStream out = rep.getOutputStream();
		ObjectMapper objectmapper = new ObjectMapper();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		objectmapper.setDateFormat(sdf);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(name, obj);
		objectmapper.writeValue(out, map);
	}
}

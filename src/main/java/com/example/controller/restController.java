package com.example.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.dto.board;
import com.example.service.boardServiceImpl;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@RestController
public class restController {
	@Autowired
	private boardServiceImpl boardservice;

	@GetMapping("/Ajaxlist")
	private JSONObject list() {
		List<board> board = new ArrayList<board>();
		board = boardservice.list();
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < board.size(); i++) {
			map.put("" + i, board.get(i));
		}
		for (Map.Entry<String, Object> entry:map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			System.out.println("key: " + key + " | value: " + value);
		}
		JSONObject json = new JSONObject(map);
		return json;
	}
//	@GetMapping(value = "/jointest", produces = MediaType.TEXT_PLAIN_VALUE)
	@RequestMapping(value = "/jointest", method = RequestMethod.GET)
	private JSONObject jointest(@RequestParam("seq") int seq) {
		List<Map<String, Object>> resultMap=boardservice.jointest();
		Map<String, Object> data=new HashMap<String, Object>();
		Map<String, Object> list=new HashMap<String, Object>();
		int index=0;
		for (Map<String, Object> map : resultMap) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				data.put(key, value);
//				System.out.println("cnt:"+cnt+"key: " + key + " | value: " + value);
			}
			list.put(""+index, data);
			data=new HashMap<String, Object>();
			index++;
		}
		JSONObject json = new JSONObject(list);
		
//		Gson gson = new Gson();
//		Type resultType = new TypeToken<List<Map<String, Object>>>(){}.getType();
//		List<Map<String, Object>> result = gson.fromJson(json, resultType);
		return json;
	}
	
	@PostMapping("/postsend")
//	private int postsend(@RequestParam HashMap params){
//		hasymap으로 받기도 가능함
//		Map<String, String> map=params;
//		for (Map.Entry<String, String> entry : map.entrySet()) {
//			String key = entry.getKey();
//			String value = entry.getValue();
//			System.out.println("key:"+key+" value:"+value);
//		}
	private int postsend(board board){
		return boardservice.insert(board);
	}
}

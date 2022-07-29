package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

@RestController
public class restController {
	@Autowired
	private boardServiceImpl boardservice;

	@GetMapping("/Ajaxlist")
	private JSONObject list() {
		List<board> board=new ArrayList<board>();
		board=boardservice.list();
		Map<String, Object> map=new HashMap<String, Object>();
		for(int i=0;i<board.size();i++) {
			map.put(""+i, board.get(i));
		}
		JSONObject json=new JSONObject(map);
		return json;
	}
//	@GetMapping(value = "/jointest", produces = MediaType.TEXT_PLAIN_VALUE)
	@RequestMapping(value="/jointest",method = RequestMethod.GET)
	private JSONObject test(@RequestParam("seq") int seq) {
		System.out.println("시퀀스"+seq);
		return null;
	}
}

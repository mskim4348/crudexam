package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.board;
import com.example.service.boardServiceImpl;


@Controller
@RequestMapping("/test/*")
public class testController {
	
	@Autowired
	private boardServiceImpl boardservice;
	
	@GetMapping("/list")
	public String testlist(Model model) {
		List<board> board = boardservice.list();
		model.addAttribute("board", board);
		
		return "/test/board";
	}
	
	@PostMapping("/array")
	public String testarray(@RequestParam("bno") int [] bno, @RequestParam("title") String [] title,
	@RequestParam("writer") String [] writer, @RequestParam("content") String [] content, @RequestParam("viewcnt") int [] viewcnt) {
		board board=new board();
		Map<String, Object> map=new HashMap();
		for(int i=0;i<bno.length;i++) {
			board.setBno(bno[i]);
			board.setTitle(title[i]);
			board.setContent(content[i]);
			board.setWriter(writer[i]);
			board.setViewcnt(viewcnt[i]);
//			map.put(""+i, board);
//			board=new board();
			boardservice.arrayUpdate(board);
		}
		board=null;
//		System.out.println(board);
//		for (Map.Entry<String, Object> entry:map.entrySet()) {
//			String key = entry.getKey();
//			Object value = entry.getValue();
//			System.out.println("key: " + key + " | value: " + value);
//		}
//		boardservice.arrayUpdate(map);
//		System.out.println(map.size());
		return "redirect:/test/list";
	}
}

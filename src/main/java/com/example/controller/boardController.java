package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dto.board;
import com.example.service.boardServiceImpl;

@Controller
@RequestMapping("/*")
public class boardController {
	
	@Autowired
	private boardServiceImpl boardservice;
	
	@GetMapping("/list")
	public String listboard() {
		List<board> board=boardservice.list();
		
		for(int i=0;i<board.size();i++) {
			System.out.println(board.get(i).getBno());
			System.out.println(board.get(i).getTitle());
		}
		
		return "board";
	}
	
	@GetMapping("/insert")
	public String insertBoard() {
		board board=null;
		board.setBno("");
		board.setContent("a");
		board.setTitle("b");
		board.setWriter("c");
		board.setViewcnt("0");
		boardservice.insert(board);
		return "board";
	}
	
	@GetMapping("/update")
	public String updateBoard() {
		int seq=1;
		board board=null;
		board.setContent("");
		board.setTitle("");
		board.setWriter("");
		boardservice.update(seq,board);
		return "test";
	}
	
	@GetMapping("/delete")
	public String deleteBoard() {
		return "home";
	}
}

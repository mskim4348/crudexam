package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.InputMap;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.board;
import com.example.dto.test;
import com.example.service.boardServiceImpl;

@Controller
@RequestMapping("/*")
public class boardController {
	
	@Autowired
	private boardServiceImpl boardservice;
	
	@GetMapping("/list")
	public String listboard() {
		List<board> board=boardservice.list();
		
		return "board";
	}
	
	@GetMapping("/insert")
	public String insertBoard() {
		board board=new board();
		board.setContent("a");
		board.setTitle("b");
		board.setWriter("c");
		boardservice.insert(board);
		return "board";
	}
	
	@GetMapping("/update")
	public String updateBoard() {
		board board=new board();
		int seq=1;
		board.setBno(seq);
		board.setContent("bbb");
		board.setTitle("ccc");
		board.setWriter("ddd");
		boardservice.update(board);
		return "board";
	}
	
	@GetMapping("/delete")
	public String deleteBoard() {
		boardservice.delete(1);
		return "board";
	}

}

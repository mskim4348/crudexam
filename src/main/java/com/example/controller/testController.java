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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String testarray(@RequestParam("array") List<board> board) {
		return "";
	}
}

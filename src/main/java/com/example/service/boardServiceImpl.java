package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.board;
import com.example.mapper.boardMapper;
import com.example.util.upload;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired 
	private boardMapper mapper;
	
	@Override
	public List<board> list() {
		return mapper.list();
	}

	@Override
	public int insert(board board) {
		return mapper.insert(board);
	}

	@Override
	public int update(board board) {
		return mapper.update(board);
	}

	@Override
	public int delete(int seq) {
		return mapper.delete(seq);
	}

//	@Override
//	public HashMap<String, Object> onelist(int seq) {
//		Map<String, Object> map=new HashMap<String, Object>();
//		System.out.println("22222222222");
//		return onelist(seq);
//	}
	@Override
	public List<Map<String, Object>> jointest() {
		return mapper.jointest();
	}
	@Override
	public int insertImage(MultipartFile file) {
		
		return 0;
	}
}

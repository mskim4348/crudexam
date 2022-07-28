package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.board;
import com.example.mapper.boardMapper;

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
	public int update(int seq,board board) {
		return mapper.update(seq,board);
	}

	@Override
	public int delete(int seq) {
		return mapper.delete(seq);
	}
	
}

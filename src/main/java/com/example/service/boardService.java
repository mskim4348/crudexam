package com.example.service;

import java.util.List;

import com.example.dto.board;

public interface boardService {
	public List<board> list();
	public int insert(board board);
	public int update(int seq,board board);
	public int delete(int seq);
}

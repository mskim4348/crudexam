package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.dto.board;

public interface boardMapper {
	public List<board> list();
	public int insert(board board);
	public int update(@Param("seq") int seq, board board);
	public int delete(@Param("seq") int seq);
}
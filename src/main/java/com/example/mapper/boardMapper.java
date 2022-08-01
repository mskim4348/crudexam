package com.example.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.example.dto.board;

public interface boardMapper {
	public List<board> list();
	public int insert(board board);
	public int update(board board);
	public int delete(@Param("seq") int seq);
//	public HashMap<String, Object> onelist(@Param("seq") int seq);
	public List<Map<String, Object>> jointest();
}
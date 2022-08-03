package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.example.dto.board;

public interface boardService {
	public List<board> list();
	public int insert(board board);
	public int update(board board);
	public int delete(int seq);
//	public HashMap<String, Object> onelist(int seq);
	public List<Map<String, Object>> jointest();
	public int insertImage(MultipartFile file);
}

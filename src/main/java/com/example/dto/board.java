package com.example.dto;

import java.io.Serializable;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class board implements Serializable{
	private String bno;
	private String title;
	private String content;
	private String writer;
	private String viewcnt;
}

package com.example.dto;

import lombok.Data;

@Data
public class Image {
	private Integer id;
	private String minetype;
	private String original_name;
	private byte[] data;
}

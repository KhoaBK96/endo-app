package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class RepairRankNotFoundException extends RuntimeException{
	
	public static final String ERROR_CODE = "RepairRank.NotFound";
	
	public RepairRankNotFoundException(String message) {
		super(message);
	}
	
}

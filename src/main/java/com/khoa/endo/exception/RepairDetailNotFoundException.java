package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class RepairDetailNotFoundException extends RuntimeException{
	
	public static final String ERROR_CODE = "RepairDetail.NotFound";
	
	public  RepairDetailNotFoundException(String message) {
		super(message);
	}
	
}

package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class RepairOrderNotFoundException extends RuntimeException{

	public static final String ERROR_CODE = "RepairOrder.NotFound";
	
	public RepairOrderNotFoundException(String message) {
		super(message);
	}
}

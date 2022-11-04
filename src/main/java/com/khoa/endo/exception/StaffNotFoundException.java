package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class StaffNotFoundException extends RuntimeException {
	
	public static final String ERROR_CODE = "Staff.NotFound";
	
	public StaffNotFoundException(String message) {
		super(message);
	}
}

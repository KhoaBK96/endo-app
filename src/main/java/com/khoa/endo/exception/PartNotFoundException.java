package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class PartNotFoundException extends RuntimeException {
	
	public static final String ERROR_CODE = "Part.NotFound";
	
	public PartNotFoundException(String message) {
		super(message);
	}
}

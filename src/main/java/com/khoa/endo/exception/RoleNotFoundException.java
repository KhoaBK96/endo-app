package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class RoleNotFoundException extends RuntimeException {
	
	public static final String ERROR_CODE = "Role.NotFound";
	
	public RoleNotFoundException(String message) {
		super(message);
	}
}

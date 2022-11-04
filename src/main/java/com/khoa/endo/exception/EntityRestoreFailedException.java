package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class EntityRestoreFailedException extends RuntimeException {
	
	public static final String ERROR_CODE = "Entity.RestoreFailed";
	
	
	public EntityRestoreFailedException(String message) {
		super(message);
	}
}

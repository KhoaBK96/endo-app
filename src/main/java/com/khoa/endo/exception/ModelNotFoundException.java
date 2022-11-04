package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class ModelNotFoundException extends RuntimeException {

	public static final String ERROR_CODE = "Model.NotFound";

	public ModelNotFoundException(String message) {
		super(message);
	}

}

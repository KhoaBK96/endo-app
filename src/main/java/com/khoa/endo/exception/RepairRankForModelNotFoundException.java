package com.khoa.endo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class RepairRankForModelNotFoundException extends RuntimeException {

	public static final String ERROR_CODE = "RepairRankForModel.NotFound";

	public RepairRankForModelNotFoundException(String message) {
		super(message);
	}

}

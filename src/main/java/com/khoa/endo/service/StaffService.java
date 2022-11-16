package com.khoa.endo.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.khoa.endo.model.Staff;


public interface StaffService extends BaseService<Staff, Integer>, UserDetailsService{
	
	

}

package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.EntityRestoreFailedException;
import com.khoa.endo.exception.RoleNotFoundException;
import com.khoa.endo.model.Role;
import com.khoa.endo.repository.RoleRepository;
import com.khoa.endo.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleRepository roleRepository;
	
	@Override
	public List<Role> getAll() {
		
		return roleRepository.findAllAvailable();
	}

	@Override
	public Role getById(Integer id) {
		return roleRepository.findAvailableById(id).orElseThrow(() -> new RoleNotFoundException("Không tìm thấy role"));
	}

	@Override
	public Role create(Role role) {
		return roleRepository.save(role);
	}

	@Override
	public Role update(Role role) {
		
		return roleRepository.save(role);
	}

	@Override
	public void delete(Integer id) {
		
		Role role = getById(id);
		role.setDeleted(true);
		roleRepository.save(role);
		
	}

	@Override
	public void restore(Integer id) {
		Role role = roleRepository.findById(id).orElseThrow(() -> new RoleNotFoundException("Role này không tồn tại"));
		
		if(!role.isDeleted())
			throw new EntityRestoreFailedException("Không thể phục hồi khi đối tượng chưa bị xoá");
		role.setDeleted(false);
		roleRepository.save(role);
	}

}

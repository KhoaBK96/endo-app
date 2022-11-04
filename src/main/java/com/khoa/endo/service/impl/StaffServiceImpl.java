package com.khoa.endo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.khoa.endo.exception.EntityRestoreFailedException;
import com.khoa.endo.exception.StaffNotFoundException;
import com.khoa.endo.model.Staff;
import com.khoa.endo.repository.StaffRepository;
import com.khoa.endo.service.StaffService;

@Service
@Transactional
public class StaffServiceImpl implements StaffService, UserDetailsService {

	@Autowired
	private StaffRepository staffRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return staffRepository.findByUsername(username)
				.orElseThrow(() -> new StaffNotFoundException(String.format("Tài khoản %s không tồn tại", username)));
	}

	// CRUD
	@Override
	public List<Staff> getAll() {
		return staffRepository.findAllAvailable();
	}

	@Override
	public Staff getById(Integer id) {
		return staffRepository.findAvailableById(id)
				.orElseThrow(() -> new StaffNotFoundException("Không có tài khoản này"));
	}

	@Override
	public Staff create(Staff staff) {

		staff.setPassword(passwordEncoder.encode(staff.getPassword()));

		return staffRepository.save(staff);
	}

	@Override
	public Staff update(Staff staff) {

		Staff foundStaff = staffRepository.findById(staff.getId())
				.orElseThrow(() -> new StaffNotFoundException("Không thể cập nhật nhân viên này"));

		foundStaff.setFullname(staff.getFullname());
		foundStaff.setPhoneNumber(staff.getPhoneNumber());
		foundStaff.setRole(staff.getRole());

		return staffRepository.save(foundStaff);
	}

	@Override
	public void delete(Integer id) {
		Staff staff = getById(id);
		staff.setDeleted(true);
		staffRepository.save(staff);
	}

	@Override
	public void restore(Integer id) {
		Staff staff = getById(id);

		if (!staff.isDeleted())
			throw new EntityRestoreFailedException(" Không thể khôi phục tài khoản");

		staff.setDeleted(false);
		staffRepository.save(staff);
	}

}

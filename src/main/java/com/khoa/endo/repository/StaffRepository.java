package com.khoa.endo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.khoa.endo.model.Staff;

@Repository
public interface StaffRepository extends JpaSoftDeleteRepository<Staff, Integer>{
	
	Optional<Staff> findByUsername(String username);
	
	@Query("SELECT s FROM Staff s "+
			"WHERE s.deleted = FALSE "+
			"AND s.role.deleted = FALSE "+
			"AND s.role.id = :id")
	List<Staff> findStaffByRoleId(Integer id);

}

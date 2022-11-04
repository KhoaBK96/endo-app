package com.khoa.endo.repository;

import org.springframework.stereotype.Repository;

import com.khoa.endo.model.Role;

@Repository
public interface RoleRepository extends JpaSoftDeleteRepository<Role, Integer> {

}

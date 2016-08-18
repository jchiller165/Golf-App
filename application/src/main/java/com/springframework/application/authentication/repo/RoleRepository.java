package com.springframework.application.authentication.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.springframework.application.authentication.model.Role;

//Uses JPA Repo and uses a Role with 
public interface RoleRepository extends JpaRepository<Role, Long>{
}

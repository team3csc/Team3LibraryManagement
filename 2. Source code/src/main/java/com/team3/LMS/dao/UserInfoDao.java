package com.team3.LMS.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.team3.LMS.dto.UserInfo;

@Repository
public interface UserInfoDao extends CrudRepository<UserInfo, Integer> {
	Page<UserInfo> findAll(Pageable pageable);
	UserInfo findByEmail(String email);
	UserInfo findUserInfo(String userName);
}

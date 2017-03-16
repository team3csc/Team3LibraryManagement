package com.team3.LMS.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.team3.LMS.dao.UserInfoDao;
import com.team3.LMS.dto.UserInfo;
import com.team3.LMS.security.UserInfoMapper;

@Service
@Transactional
public class UserInfoService extends JdbcDaoSupport{
	@Autowired
	private UserInfoDao userInfoDao;
	@Autowired
	public UserInfoService(DataSource dataSource) {
		this.setDataSource(dataSource);
	}
	
    public UserInfo findUserInfo(String userName) {
        String sql = "Select *"//
                + " from USER_INFO where real_name = ? ";
 
        Object[] params = new Object[] { userName };
        UserInfoMapper mapper = new UserInfoMapper();
        try {
            UserInfo userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return userInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
	public List<UserInfo> getUserInfoList() {
		return (List<UserInfo>) userInfoDao.findAll();
	}

	public Page<UserInfo> findAll(Pageable pageable) {
		return userInfoDao.findAll(pageable);
	}

	public void addUserInfo(UserInfo userInfo) {
		userInfoDao.save(userInfo);
	}

	public void removeUserInfo(int id) {
		userInfoDao.delete(id);
	}

	public UserInfo getUserInfo(int id) {
		return userInfoDao.findOne(id);
	}
}

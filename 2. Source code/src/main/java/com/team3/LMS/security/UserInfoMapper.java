package com.team3.LMS.security;

import java.sql.ResultSet;
import java.sql.SQLException;
 
import com.team3.LMS.dto.UserInfo;
import org.springframework.jdbc.core.RowMapper;
 
public class UserInfoMapper implements RowMapper<UserInfo> {
 
    @Override
    public UserInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
 
        String realname = rs.getString("real_name");
        String address = rs.getString("address");
        String password = rs.getString("pword");
        int phoneNumber = rs.getInt("phone_number");
        String email = rs.getString("Email");
        String sex = rs.getString("sex");
        String degree= rs.getString("degree");
        Byte valid = rs.getByte("valid");
        return new UserInfo(realname, address, phoneNumber, email, password, sex, degree, valid);
    }
 
}
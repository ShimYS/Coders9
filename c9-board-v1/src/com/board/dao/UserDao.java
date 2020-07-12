package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.util.ConnectionUtil;
import com.board.util.QueryUtil;
import com.board.vo.User;

public class UserDao {
	
	private User resultToUser(ResultSet rs) throws Exception {
		User user = new User();
		
		user.setNo(rs.getInt("user_no"));
		user.setId(rs.getString("user_id"));
		user.setPassword(rs.getString("user_password"));
		user.setName(rs.getString("user_name"));
		user.setEmail(rs.getString("user_email"));
		user.setTel(rs.getString("user_tel"));
		user.setGender(rs.getString("user_gender"));
		user.setAddress(rs.getString("user_address"));
		user.setPoint(rs.getInt("user_point"));
		user.setRegistDate(rs.getDate("user_registdate"));
		
		return user;
	}
	
	public List<User> getAllUser() throws Exception {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUser"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = resultToUser(rs);
			
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	public User getUserById(String userId) throws Exception {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = new User();
			user = resultToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public User getUserByEmail(String email) throws Exception {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserByEmail"));
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = new User();
			user = resultToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public User getUserByTel(String tel) throws Exception {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserByTel"));
		pstmt.setString(1, tel);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = new User();
			user = resultToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public void insertUser(User user) throws Exception {	
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateUser(User user) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, user.getTel());
		pstmt.setString(4, user.getGender());
		pstmt.setString(5, user.getAddress());
		pstmt.setString(6, user.getId());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}




























package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userService {
	private Connection dbConn;
	private PreparedStatement pstmt;
	private String identity;
	private String username;
	private ResultSet resultSet;
	private String query = "select * from users where userid=? and userpassword=?";
	public userService(){
		dbConn = new connection.ConnectDB().getdbConn(); 
	}
	public boolean valiUser(model.userTable user){
		try {
			pstmt = dbConn.prepareStatement(query);
			pstmt.setString(1,user.getUserid());
			pstmt.setString(2,user.getUserpassword());
			resultSet = pstmt.executeQuery();
			if(resultSet.next()){
				identity = resultSet.getString("useridentity");
				username = resultSet.getString("username");
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public String getIdentity(){
		return this.identity;
	}
	public String getUsername(){
		return username;
	}
}

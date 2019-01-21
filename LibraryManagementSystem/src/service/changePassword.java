package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class changePassword {
	private Connection dbConn;
	private PreparedStatement pstmt;
	private String identity;
	private String query = "select * from users where userid=? and userpassword=?";

	public changePassword() {
		dbConn = new connection.ConnectDB().getdbConn();
	}

	public boolean valiUser(model.userTable user) {
		try {
			pstmt = dbConn.prepareStatement(query);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpassword());
			ResultSet resultSet = pstmt.executeQuery();
			if (resultSet.next()
					&& user.getNewpassword().equals(user.getRenewpassword())) {
				dbConn.prepareStatement(
						"update users set userpassword='"
								+ user.getNewpassword()
								+ "' where userid = '" + user.getUserid()+"'")
						.executeUpdate();
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}

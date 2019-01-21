package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;

import model.ReaderInfoTable;
import connection.ConnectDB;

public class AdministratorNewReaderService {
	private Connection dbConn;
	private String query = "Insert into readers values(?,?,?,?,?,?,?,?,?,?,?)";
	private PreparedStatement pstmt;

	public AdministratorNewReaderService() {
		dbConn = new ConnectDB().getdbConn();
	}

	public boolean createReaderInfo(ReaderInfoTable readerInfoTbale) {
		try {
			if (readerInfoTbale.getPassword() != null) {
				pstmt = dbConn.prepareStatement(query);
				pstmt.setString(2, readerInfoTbale.getReader_name());
				if (readerInfoTbale.getSex().equals("1")) {
					pstmt.setString(3, "ƒ–");
				} else {
					pstmt.setString(3, "≈Æ");
				}
				pstmt.setString(4, readerInfoTbale.getBirthday());
				pstmt.setString(5, readerInfoTbale.getPhone());
				pstmt.setString(6, readerInfoTbale.getMobile());
				pstmt.setString(7, readerInfoTbale.getMail());
				pstmt.setString(8, readerInfoTbale.getCard_name());
				pstmt.setString(9, readerInfoTbale.getCard_id());
				pstmt.setString(10, readerInfoTbale.getLevel());
				pstmt.setString(11, readerInfoTbale.getDay());
				// …Ë÷√Õº È±‡∫≈
				Statement statement = dbConn.createStatement();
				ResultSet resultSet = statement
						.executeQuery("select count(reader_id) as num from readers");
				if (resultSet.next()) {
					String id = String.valueOf(resultSet.getInt("num") + 1);
					int num = id.length();
					for (int i = 0; i < 3 - num; i++) {
						id = "0" + id;
					}
					id = "r" + id;
					pstmt.setString(1, id);
				}
				pstmt.executeUpdate();
				resultSet.close();
			}
			pstmt = dbConn.prepareStatement("Insert into users values(?,?,?,?)");
			pstmt.setString(1, readerInfoTbale.getReader_id());
			pstmt.setString(2, readerInfoTbale.getReader_name());
			pstmt.setString(3, readerInfoTbale.getPassword());
			pstmt.setString(4, "reader");
			pstmt.execute();
			pstmt.close();
			dbConn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}

package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ReaderInfoTable;
import connection.ConnectDB;

public class AdministratorReaderInfoService {
	private Connection dbConn;
	private String query = "Select * from readers where reader_id like ? and reader_name like ?";
	private PreparedStatement pstmt;
    private List<ReaderInfoTable> list;
	public AdministratorReaderInfoService() {
		dbConn = new ConnectDB().getdbConn();
		
	}
	public List<ReaderInfoTable> getReaderInfo(ReaderInfoTable readerInfoTbale){
		list = new ArrayList<ReaderInfoTable>();
		try {
			pstmt = dbConn.prepareStatement(query);
			pstmt.setString(1, readerInfoTbale.getReader_id()==null? "%":readerInfoTbale.getReader_id());
			pstmt.setString(2, readerInfoTbale.getReader_name()==null? "%":"%"+readerInfoTbale.getReader_name()+"%");
			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				ReaderInfoTable ReaderInfo = new ReaderInfoTable();
				ReaderInfo.setReader_id(resultSet.getString(1));
				ReaderInfo.setReader_name(resultSet.getString(2));
				ReaderInfo.setSex(resultSet.getString(3));
				ReaderInfo.setBirthday(resultSet.getString(4));
				ReaderInfo.setPhone(resultSet.getString(5));
				ReaderInfo.setMobile(resultSet.getString(6));
				ReaderInfo.setMail(resultSet.getString(7));
				ReaderInfo.setCard_name(resultSet.getString(8));
				ReaderInfo.setCard_id(resultSet.getString(9));
				ReaderInfo.setLevel(resultSet.getString(10));
				ReaderInfo.setDay(resultSet.getString(11));
				list.add(ReaderInfo);
			}
			resultSet.close();
			pstmt.close();
			dbConn.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}

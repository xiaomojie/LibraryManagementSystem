package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;

import model.ReaderInfoTable;
import connection.ConnectDB;

public class ReadersinfoChangeService {
	private Connection dbConn;
	private String query = "update readers set ";
	private PreparedStatement pstmt;

	public ReadersinfoChangeService() {
		dbConn = new ConnectDB().getdbConn();
	}

	public boolean changeReadersInfo(ReaderInfoTable readerInfoTbale) {
		try {
			    if(readerInfoTbale.getReader_name()!=null){
			    	query =query+ "reader_name = '"+readerInfoTbale.getReader_name()+"',";
			    }
				if (readerInfoTbale.getSex().equals("1")) {
					query = query+"sex = "+"'ƒ–',";
				} else {
					query = query+"sex = "+"'≈Æ',";
				}
				if(readerInfoTbale.getBirthday()!=null){
					query=query+"birthday =' "+readerInfoTbale.getBirthday()+"'.";
				}
				if(readerInfoTbale.getPhone()!=null){
					query=query+"phone = '"+readerInfoTbale.getPhone()+"',";
				}
				if(readerInfoTbale.getMobile()!=null){
					query = query + "mobile'"+readerInfoTbale.getMobile()+"',";
				}
				if(readerInfoTbale.getMail()!=null){
					query = query + "mail='"+readerInfoTbale.getMail()+"',";
				}
				if(readerInfoTbale.getCard_name()!=null){
					query = query+"card_name = '"+readerInfoTbale.getCard_name()+"',";
				}
				if(readerInfoTbale.getCard_id()!=null){
					query = query+"card_id='"+readerInfoTbale.getCard_id()+"',";
				}
				if(readerInfoTbale.getLevel()!=null){
					query = query+"level='"+readerInfoTbale.getLevel()+"',";
				}
				query = query.substring(0, query.length()-1);
                query = query+"where reader_id = '"+readerInfoTbale.getReader_id()+"'";
				pstmt = dbConn.prepareStatement(query);
				// …Ë÷√Õº È±‡∫≈
				
				pstmt.executeUpdate();
				if(readerInfoTbale.getReader_name()!=null){
			pstmt = dbConn.prepareStatement("update users set username = ? where userid=?");
			pstmt.setString(1,readerInfoTbale.getReader_name());
			pstmt.setString(2, readerInfoTbale.getReader_id() );
			pstmt.execute();
				}
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

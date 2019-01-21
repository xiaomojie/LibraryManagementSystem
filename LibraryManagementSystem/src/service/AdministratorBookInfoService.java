package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.BooksInfoTable;
import connection.ConnectDB;

public class AdministratorBookInfoService {
	private Connection dbConn;
	private PreparedStatement pstmt;
	List<BooksInfoTable>list;
	private String query1 = "select distinct book_id,book_name,author,publishing from books where book_name like ?  " +
			"and author like ? and publishing like ?";
	private String query2 = "select distinct borrow.book_id,book_name,author,publishing from borrow,books where " +
			"borrow.book_id = books.book_id and book_name like ?  and author like ? and publishing like ?";
	public AdministratorBookInfoService() {
		dbConn = new ConnectDB().getdbConn();
	}
	public List<BooksInfoTable> showBookInfo(BooksInfoTable bookInfoTable){
		list = new ArrayList<BooksInfoTable>();
		try {
			ResultSet rs ;
			if(bookInfoTable.getBookType().equals("1")){
				pstmt = dbConn.prepareStatement(query1);
			}else{
				pstmt = dbConn.prepareStatement(query2);
			}
			pstmt.setString(1, bookInfoTable.getBook_name()==null? "%":"%"+bookInfoTable.getBook_name()+"%");
			pstmt.setString(2, bookInfoTable.getAuthor()==null? "%":"%"+bookInfoTable.getAuthor()+"%");
			pstmt.setString(3, bookInfoTable.getPublishing()==null? "%":"%"+bookInfoTable.getPublishing()+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				BooksInfoTable bookInfo = new BooksInfoTable();
				bookInfo.setBook_id(rs.getString("book_id"));
				bookInfo.setBook_name(rs.getString("book_name"));
				bookInfo.setAuthor(rs.getString("author"));
				bookInfo.setPublishing(rs.getString("publishing"));
				list.add(bookInfo);
		    }
			rs.close();
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

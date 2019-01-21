package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.BooksInfoTable;
import connection.ConnectDB;

public class ReaderBookInfoService {
	private Connection dbConn;
	private PreparedStatement pstmt;
	List<BooksInfoTable>list;
	private String query = "select book_id,book_name,category,author,publishing," +
			"price,Quantity_in,Quantity_out from books,[b-category] " +
			"where books.category_id=[b-category].category_id and " +
			"book_name like ? and books.category_id like ? and author like ? and publishing like ?";

	public ReaderBookInfoService() {
		dbConn = new ConnectDB().getdbConn();
	}
	public List<BooksInfoTable> showBookInfo(BooksInfoTable bookInfoTable){
		list = new ArrayList<BooksInfoTable>();
		try {
			pstmt = dbConn.prepareStatement(query);
			pstmt.setString(1, bookInfoTable.getBook_name()==null? "%":"%"+bookInfoTable.getBook_name()+"%");
			pstmt.setString(2, bookInfoTable.getCategory_id()==null? "%":bookInfoTable.getCategory_id());
			pstmt.setString(3, bookInfoTable.getAuthor()==null? "%":"%"+bookInfoTable.getAuthor()+"%");
			pstmt.setString(4, bookInfoTable.getPublishing()==null? "%":"%"+bookInfoTable.getPublishing()+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				BooksInfoTable bookInfo = new BooksInfoTable();
				bookInfo.setBook_id(rs.getString("book_id"));
				bookInfo.setBook_name(rs.getString("book_name"));
				bookInfo.setCategory_id(rs.getString("category"));
				bookInfo.setAuthor(rs.getString("author"));
				bookInfo.setPublishing(rs.getString("publishing"));
				bookInfo.setPrice(rs.getDouble("price"));
				bookInfo.setQuantity_in(rs.getInt("Quantity_in")-rs.getInt("Quantity_out"));
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

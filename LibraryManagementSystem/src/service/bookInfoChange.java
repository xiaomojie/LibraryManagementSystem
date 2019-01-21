package service;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;

import model.BooksInfoTable;

import connection.ConnectDB;

public class bookInfoChange {
	private Connection dbConn;
	private String query = "update books set ";
	private PreparedStatement pstmt;

	public bookInfoChange() {
		dbConn = new ConnectDB().getdbConn();
	}

	public int insertBook(BooksInfoTable book) {
		try {

			if (book.getBook_name() != null) {
				query = query + "book_name =' " + book.getBook_name() + "'.";
			}
			if (book.getAuthor() != null) {
				query = query + "author = '" + book.getAuthor() + "',";
			}
			if (book.getPublishing() != null) {
				query = query + "publishing'" + book.getPublishing() + "',";
			}
			if (book.getCategory_id() != null) {
				query = query + "category_id = '" + book.getCategory_id()
						+ "',";
			}
			if (book.getPrice() >= 0) {
				query = query + "price='" + book.getPrice() + "',";
			}
			if (book.getDate_in() != null) {
				query = query + "date_in='" + book.getDate_in() + "',";
			}
			pstmt = dbConn.prepareStatement("select quantity_out+quantity_loss from books where book_id = ? ");
			pstmt.setString(1, book.getBook_id());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
			   if (book.getQuantity_in() >= Integer.parseInt(rs.getString(1))) {
				  query = query + "quantity_in='" + book.getQuantity_in() + "',";
		    	}else{
					return -1;
				}
			}
			query = query.substring(0, query.length() - 1);
			query = query + "where book_id = '" + book.getBook_id() + "'";

			System.out.println(query);
			pstmt = dbConn.prepareStatement(query);
			pstmt.executeUpdate();
			pstmt.close();
			dbConn.close();
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
}

package service;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;

import model.BooksInfoTable;

import connection.ConnectDB;

public class AdministratorBookIntoService {
	private Connection dbConn;
	private String query = "Insert into books(book_id,book_name,author,publishing,category_id," +
			"price,date_in,quantity_in,quantity_out,quantity_loss) values(?,?,?,?,?,?,?,?,?,?)";
	private PreparedStatement pstmt;

	public AdministratorBookIntoService() {
		dbConn = new ConnectDB().getdbConn();
	}
	public boolean insertBook(BooksInfoTable newBook){
		try {
			pstmt = dbConn.prepareStatement(query);
			pstmt.setString(2,newBook.getBook_name());
			pstmt.setString(3,newBook.getAuthor());
			pstmt.setString(4,newBook.getPublishing());
			pstmt.setString(5,newBook.getCategory_id());
			pstmt.setDouble(6, newBook.getPrice());
			pstmt.setString(7,newBook.getDate_in());
			pstmt.setInt(8,newBook.getQuantity_in());
			pstmt.setInt(9,newBook.getQuantity_out());
			pstmt.setInt(10,newBook.getQuantity_loss());
			
			//∑÷≈‰Õº È±‡∫≈
			Statement statement = dbConn.createStatement(); 
		    ResultSet resultSet = statement.executeQuery("select count(book_id) as num from books");
			if(resultSet.next()){
				String id = String.valueOf(resultSet.getInt("num")+1);
				
				int num=id.length();
				for(int i = 0; i <3-num; i++){
					id = "0"+id;
				}
				id = "b"+id;
				pstmt.setString(1,id);
			}
			pstmt.executeUpdate();
			resultSet.close();
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

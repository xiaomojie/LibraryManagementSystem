package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import model.BorrowBooksReadersInfoTable;
import connection.ConnectDB;

public class AdministratorOverdue {
	private Connection dbConn;
	private PreparedStatement pstmt;
	List<BorrowBooksReadersInfoTable> list;
	private String query1 = "select readers.reader_id,readers.reader_name,readers.mobile,readers.phone," +
			"books.book_id,books.book_name,books.author,borrow.date_return,readers.mail" +
			" from borrow,readers,books where returned='·ñ' and date_return < ? and borrow.reader_id like ? and borrow.book_id like ?" +
			" and readers.reader_id=borrow.reader_id and books.book_id=borrow.book_id";

	public AdministratorOverdue() {
		dbConn = new ConnectDB().getdbConn();
	}

	public List<BorrowBooksReadersInfoTable> getOverdue(BorrowBooksReadersInfoTable borrowBooksReaders) {
		list = new ArrayList<BorrowBooksReadersInfoTable>();
		try {
			ResultSet rs;
			String datetime = new SimpleDateFormat("yyyy-MM-dd")
					.format(Calendar.getInstance().getTime());
            pstmt = dbConn.prepareStatement(query1);
			pstmt.setString(1,datetime);
			pstmt.setString(2, borrowBooksReaders.getReader_id() == null ? "%"
					: borrowBooksReaders.getReader_id());
			pstmt.setString(3, borrowBooksReaders.getBook_id() == null ? "%"
					: borrowBooksReaders.getBook_id());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BorrowBooksReadersInfoTable Info = new BorrowBooksReadersInfoTable();
				Info.setReader_id(rs.getString(1));
				Info.setReader_name(rs.getString(2));
				Info.setMobile(rs.getString(3));
				Info.setPhone(rs.getString(4));
				Info.setBook_id(rs.getString(5));
				Info.setBook_name(rs.getString(6));
				Info.setAuthor(rs.getString(7));
				Info.setDate_return(rs.getString(8));
				Info.setMail(rs.getString(9));
				list.add(Info);
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

package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.BorrowInfoTable;
import connection.ConnectDB;

public class ReaderBorrowInfoService {
	private Connection dbConn;
	private String query1 = "Select borrow.book_id,book_name,author,category,date_borrow,date_return " +
	"from borrow,books,[b-category] where borrow.book_id=books.book_id and books.category_id=" +
	"[b-category].category_id and reader_id=? and loss is null  and returned ='否'";
	private String query2 = "Select borrow.book_id,book_name,author,category,date_borrow,date_return " +
			"from borrow,books,[b-category] where borrow.book_id=books.book_id and books.category_id=" +
			"[b-category].category_id and reader_id=? and date_borrow between ? and ? ";
	private PreparedStatement pstmt;
    private List<BorrowInfoTable> list;
	public ReaderBorrowInfoService() {
		dbConn = new ConnectDB().getdbConn();
	}
	public List<BorrowInfoTable> getBorrowInfo(BorrowInfoTable borrowInfoTbale){
		list = new ArrayList<BorrowInfoTable>();
		try {
			if(borrowInfoTbale.getSelected().equals("当前借阅信息")){
				pstmt = dbConn.prepareStatement(query1);
				pstmt.setString(1, borrowInfoTbale.getReader_id());
			}else if(borrowInfoTbale.getSelected().equals("六个月内借阅信息")){
				pstmt = dbConn.prepareStatement(query2);
				pstmt.setString(1, borrowInfoTbale.getReader_id());
				String datetime1=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MONTH, -6);
				String datetime2=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());				
				pstmt.setString(2, datetime2);
				pstmt.setString(3, datetime1);
			}else if(borrowInfoTbale.getSelected().equals("一年内借阅信息")){
				pstmt = dbConn.prepareStatement(query2);
				pstmt.setString(1, borrowInfoTbale.getReader_id());
				String datetime1=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MONTH, -12);
				String datetime2=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());				
				pstmt.setString(2, datetime2);
				pstmt.setString(3, datetime1);
			}
			ResultSet resultSet = pstmt.executeQuery();
			while(resultSet.next()){
				BorrowInfoTable borrowInfo = new BorrowInfoTable();
				borrowInfo.setBook_id(resultSet.getString(1));
				borrowInfo.setBook_name(resultSet.getString(2));
				borrowInfo.setAuthor(resultSet.getString(3));
				borrowInfo.setCategory(resultSet.getString(4));
				borrowInfo.setDate_borrow(resultSet.getString(5));
				borrowInfo.setDate_return(resultSet.getString(6));
				list.add(borrowInfo);
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

package model;

public class BorrowInfoTable {
	private String reader_id;
	private String book_id;
	private String book_name;
	private String author;
	private String category;
	private String date_borrow;
	private String date_return;
	private String loss;
	private String selected="当前借阅信息";

	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
		
	}
	public String getReader_id() {
		return reader_id;
	}
	public void setReader_id(String reader_id) {
		this.reader_id = reader_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getDate_borrow() {
		return date_borrow;
	}
	public void setDate_borrow(String date_borrow) {
		this.date_borrow = date_borrow;
	}
	public String getDate_return() {
		return date_return;
	}
	public void setDate_return(String date_return) {
		this.date_return = date_return;
	}
	public String getLoss() {
		return loss;
	}
	public void setLoss(String loss) {
		this.loss = loss;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

}

package model;

public class BooksInfoTable {

	private String book_id;
	private String book_name;
	private String author;
	private String publishing;
	private String category_id;
	private double price=-1;
	private String date_in;
	private int quantity_in=-1;
	private int quantity_out=0;
	private int quantity_loss=0;
	private String bookType;
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishing() {
		return publishing;
	}
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDate_in() {
		return date_in;
	}
	public void setDate_in(String date_in) {
		this.date_in = date_in;
	}
	public int getQuantity_in() {
		return quantity_in;
	}
	public void setQuantity_in(int quantity_in) {
		this.quantity_in = quantity_in;
	}
	public int getQuantity_out() {
		return quantity_out;
	}
	public void setQuantity_out(int quantity_out) {
		this.quantity_out = quantity_out;
	}
	public int getQuantity_loss() {
		return quantity_loss;
	}
	public void setQuantity_loss(int quantity_loss) {
		this.quantity_loss = quantity_loss;
	}

}

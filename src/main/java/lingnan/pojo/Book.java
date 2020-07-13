package lingnan.pojo;

import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Book {
private Integer bookId;
private Integer userId;
private Integer roomId;
@Pattern(regexp = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$", message = "手机号码不正确")
private String bookPhone;
@Email(message = "邮箱格式不对")
private String email;
@DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
private Date bookDate;
@DateTimeFormat(pattern = "yyyy-MM-dd")
@Future(message = "预约时间不对")
private Date arriveDate;
private Integer bookState;
private Integer bookPrice;
private String bookName;

public Book() {
	super();
}



public Book(Integer userId, Integer roomId, Date bookDate) {
	super();
	this.userId = userId;
	this.roomId = roomId;
	this.bookDate = bookDate;
}



public Book(Integer userId, Integer roomId, Date bookDate, Date arriveDate) {
	super();
	this.userId = userId;
	this.roomId = roomId;
	this.bookDate = bookDate;
	this.arriveDate = arriveDate;
}



public Book(Integer userId, Integer roomId, String bookPhone,
		String email, Integer bookState, Integer bookPrice) {
	super();
	this.userId = userId;
	this.roomId = roomId;
	this.bookPhone = bookPhone;
	this.email = email;
	this.bookState = bookState;
	this.bookPrice = bookPrice;
}

public Book(Integer bookId, Integer bookState) {
	super();
	this.bookId = bookId;
	this.bookState = bookState;
}
public Book(Integer bookId, Integer userId, Integer roomId, String bookPhone,
		String email, Date bookDate, Date arriveDate, Integer bookState,Integer bookPrice) {
	super();
	this.bookId = bookId;
	this.userId = userId;
	this.roomId = roomId;
	this.bookPhone = bookPhone;
	this.email = email;
	this.bookDate = bookDate;
	this.arriveDate = arriveDate;
	this.bookState = bookState;
	this.bookPrice=bookPrice;
}
public Integer getBookId() {
	return bookId;
}
public void setBookId(Integer bookId) {
	this.bookId = bookId;
}
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public Integer getRoomId() {
	return roomId;
}
public void setRoomId(Integer roomId) {
	this.roomId = roomId;
}
public String getBookPhone() {
	return bookPhone;
}
public void setBookPhone(String bookPhone) {
	this.bookPhone = bookPhone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
public Date getBookDate() {
	return bookDate;
}
public void setBookDate(Date bookDate) {
	this.bookDate = bookDate;
}
@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "GMT+8")
public Date getArriveDate() {
	return arriveDate;
}
public void setArriveDate(Date arriveDate) {
	this.arriveDate = arriveDate;
}
public Integer getBookState() {
	return bookState;
}
public void setBookState(Integer bookState) {
	this.bookState = bookState;
}

public Integer getBookPrice() {
	return bookPrice;
}
public void setBookPrice(Integer bookPrice) {
	this.bookPrice = bookPrice;
}

public String getBookName() {
	return bookName;
}



public void setBookName(String bookName) {
	this.bookName = bookName;
}



@Override
public String toString() {
	return "Book [bookId=" + bookId + ", userId=" + userId + ", roomId="
			+ roomId + ", bookPhone=" + bookPhone + ", email=" + email
			+ ", bookDate=" + bookDate + ", arriveDate=" + arriveDate
			+ ", bookState=" + bookState + ", bookPrice="+bookPrice+", bookName="+bookName+"]";
}



}

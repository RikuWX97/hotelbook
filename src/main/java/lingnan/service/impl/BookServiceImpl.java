package lingnan.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import lingnan.mapper.BookMapper;
import lingnan.pojo.Book;
import lingnan.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private Book book;
	 
	public List<Book> getBookAllByStateNotZero() {
		return bookMapper.getBookAllByStateNotZero();
	}

	public Book getBookByBookId(int bookId) {
		return bookMapper.getBookByBookId(bookId);
	}

	public boolean updateByBookId(Book book) {
		return bookMapper.updateByBookId(book);
	}

	public boolean deleteByBoodId(int id) {
		return bookMapper.deleteByBoodId(id);
	}

	public boolean insertBook(Book book) {
		return bookMapper.insertBook(book);
	}

	public boolean bookSuccess(int bookId) {
	return true;
			
	}

	public boolean bookEnd(int bookId) {
		book.setBookId(bookId);
		book.setBookState(0);
		return bookMapper.updateByBookId(book);
	}

	public List<Book> getBookAllByState(int state) {
		return  bookMapper.getBookAllByState(state);
	}

	public List<Book> getBookAll() {
		// TODO Auto-generated method stub
		return bookMapper.getBookAll();
	}

	public List<Book> getListJson() {
		// TODO Auto-generated method stub
		return bookMapper.getListJson();
	}

	public int countAllBook() {
		return bookMapper.countAllBook();
	}

	public List<Book> findByAll(Book book) {
		return bookMapper.findByAll(book);
	}

	public List<Book> getListDeleteJson(int bookId) {
		return bookMapper.getListDeleteJson(bookId);
	}

	public List<Book> getBookByUserId(int userId) {
		return bookMapper.getBookByUserId(userId);
	}

	public List<Book> getBookAllByStateUser(int bookState,int userId) {
		return bookMapper.getBookAllByStateUser(bookState, userId);
	}

	public List<Book> getBookAllByUser(int userId) {
		return bookMapper.getBookAllByUser(userId);
	}

	


}

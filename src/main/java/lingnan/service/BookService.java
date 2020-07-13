package lingnan.service;



import java.util.List;

import lingnan.pojo.Book;

public interface BookService {
	List<Book> getBookAllByStateNotZero ();
	List<Book> getBookAllByState(int bookState);
	List<Book> getBookAllByStateUser(int bookState,int userId);
	List<Book> getBookAll();
	List<Book> getBookAllByUser(int userId);
	List<Book> getListJson();
	List<Book> getListDeleteJson(int bookId);
	List<Book> findByAll(Book book);
	List<Book> getBookByUserId(int userId);
	int countAllBook();
	Book getBookByBookId(int bookId);
	boolean updateByBookId(Book book);
	
	boolean bookSuccess(int bookId);
	boolean bookEnd(int bookId);
	
	boolean deleteByBoodId(int id);
	boolean insertBook(Book book);
}

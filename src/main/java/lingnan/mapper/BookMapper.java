package lingnan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import lingnan.pojo.Book;

public interface BookMapper {
	List<Book> getBookAllByStateNotZero ();
	List<Book> getBookAllByState(int bookState);
	List<Book> getBookAllByStateUser(@Param("bookState")int bookState,@Param("userId")int userId);
	List<Book> getBookuserByState(int bookState);
	List<Book> getBookAll();
	List<Book> getBookAllByUser(int userId);
	int countAllBook();
	List<Book> getListJson();
	List<Book> getListDeleteJson(int bookId);
	List<Book> findByAll(Book book);
	List<Book> getBookByUserId(int userId);
	Book getBookByBookId(int bookId);
	boolean updateByBookId(Book book);
	
	boolean deleteByBoodId(int id);
	boolean insertBook(Book book);
}

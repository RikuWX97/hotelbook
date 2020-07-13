package lingnan.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import lingnan.pojo.Book;
import lingnan.pojo.User;
import lingnan.service.BookService;
import lingnan.service.RoomService;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private RoomService roomService;
	/*@PostMapping("/room")
	public String room(HttpSession session){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
	   Book bean=ctx.getBean("book",Book.class);	   
		session.setAttribute("userId", 1);
		session.setAttribute("roomId", 2);
		session.setAttribute("roomPrice",213);
		session.setAttribute("bookName", "吴鸿发");
		session.setAttribute("roomType", "新民大套房");
		bean.setUserId(1);
		bean.setRoomId(2);
		bean.setBookPrice(213);
		session.setAttribute("bookInf", bean);
		return "forward:/WEB-INF/pages/book.jsp";
	}*/
	
	@PostMapping("/confirm")
	public String confirm(String email,String bookPhone,@DateTimeFormat(pattern = "yyyy-MM-dd")Date arriveDate ,String bookName,HttpSession session){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
	   Book bean=ctx.getBean("book",Book.class);
	   bean=(Book) session.getAttribute("bookInf");
	   System.out.println("bookInf:::"+bean);
	   bean.setBookDate(new Date());
	   System.out.println("bookName:::"+bookName);
	   bean.setArriveDate(arriveDate);
	   bean.setBookState(1);
	   bean.setBookPhone(bookPhone);
	   bean.setEmail(email);
	   bean.setBookName(bookName);
	   
	    boolean flag=bookService.insertBook(bean);
	    if(flag){
	    	session.setAttribute("bookInformation", bean);
	    	session.setAttribute("roomInformation", roomService.getByRoomId(bean.getRoomId()));
	    	roomService.stockOne(bean.getRoomId());
	    	session.setAttribute("msg", "预定成功，请等待审核通知");
	    }
	    else{
	    	session.setAttribute("msg", "预定失败！");
	    	return "book";
	    }
		return "success";
	}
	/*
	 * 放到了UserController跳转显示
	 * @RequestMapping(value="/user")
	public String user(HttpSession session){
		User user=(User) session.getAttribute("loginUser");
		int id=user.getId();
		System.out.println("id:::"+id);
		session.setAttribute("allBook", bookService.getBookAllByUser(id));
		session.setAttribute("checking", bookService.getBookAllByStateUser(1,id));
		session.setAttribute("outDate", bookService.getBookAllByStateUser(0,id));
		session.setAttribute("confirm", bookService.getBookAllByStateUser(2,id));
		System.out.println("allBook:::"+bookService.getBookAllByUser(id));
		System.out.println("checking:::"+bookService.getBookAllByStateUser(1,id));
		System.out.println("outDate:::"+bookService.getBookAllByStateUser(0,id));
		System.out.println("confirm:::"+bookService.getBookAllByStateUser(2,id));
		return "user";
	}*/
	@RequestMapping(value="/delete")
	public String delete(@RequestParam("bookId") Integer bookId,HttpSession session){
		
		boolean flag=false;
		flag=bookService.deleteByBoodId(bookId);
		if(flag=false)
			return "error";
		System.out.println("delete:::"+flag);
		User user=(User) session.getAttribute("loginUser");
		int id=user.getId();
		session.setAttribute("allBook", bookService.getBookAllByUser(id));
		session.setAttribute("checking", bookService.getBookAllByStateUser(1,id));
		session.setAttribute("outDate", bookService.getBookAllByStateUser(0,id));
		session.setAttribute("confirm", bookService.getBookAllByStateUser(2,id));
		System.out.println("allBook:::"+bookService.getBookAllByUser(id));
		System.out.println("checking:::"+bookService.getBookAllByStateUser(1,id));
		System.out.println("outDate:::"+bookService.getBookAllByStateUser(0,id));
		System.out.println("confirm:::"+bookService.getBookAllByStateUser(2,id));
		return "user";
	}
	@RequestMapping(value="/checkOut")
	public String checkOut(@RequestParam("bookId") Integer bookId,HttpSession session){
		boolean flag=false;
		flag=bookService.bookEnd(bookId);
		if(flag=false)
			return "error";
		System.out.println("delete:::"+flag);
		User user=(User) session.getAttribute("loginUser");
		int id=user.getId();
		roomService.stockAddOne(bookService.getBookByBookId(bookId).getRoomId());
		session.setAttribute("allBook", bookService.getBookAllByUser(id));
		session.setAttribute("checking", bookService.getBookAllByStateUser(1,id));
		session.setAttribute("outDate", bookService.getBookAllByStateUser(0,id));
		session.setAttribute("confirm", bookService.getBookAllByStateUser(2,id));
		System.out.println("allBook:::"+bookService.getBookAllByUser(id));
		System.out.println("checking:::"+bookService.getBookAllByStateUser(1,id));
		System.out.println("outDate:::"+bookService.getBookAllByStateUser(0,id));
		System.out.println("confirm:::"+bookService.getBookAllByStateUser(2,id));
		return "user";
	}
	@RequestMapping(value="/update")
	public String update(@RequestParam("bookId") Integer bookId,@RequestParam("book") Book book,HttpSession session){
		
		boolean flag=false;
		flag=bookService.updateByBookId(book);
		if(flag=false)
			return "error";
		System.out.println("update:::"+flag);
		User user=(User) session.getAttribute("loginUser");
		int id=user.getId();
		session.setAttribute("allBook", bookService.getBookAllByUser(id));
		session.setAttribute("checking", bookService.getBookAllByStateUser(1,id));
		session.setAttribute("outDate", bookService.getBookAllByStateUser(0,id));
		session.setAttribute("confirm", bookService.getBookAllByStateUser(2,id));
		System.out.println("allBook:::"+bookService.getBookAllByUser(id));
		System.out.println("checking:::"+bookService.getBookAllByStateUser(1,id));
		System.out.println("outDate:::"+bookService.getBookAllByStateUser(0,id));
		System.out.println("confirm:::"+bookService.getBookAllByStateUser(2,id));
		return "user";
	}
	@GetMapping(value="/getListJson")
	@ResponseBody
	public List<Book> getListJson(){
		System.out.println("getListJson");
		return bookService.getListJson();
	}
	
	
	
	//上面为user.jsp实验用的方法，下面两个才是查询json方法  getMapjson为显示全部数据 ，findjson是条件查询输出数据
	@GetMapping(value="/getMapJson")
	@ResponseBody
	public Map<String, Object> getMapJson(){
		 List<Book> books = bookService.getListJson();
	        int count = bookService.countAllBook();
	        System.out.println("coun:::"+count);
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("msg","");
	        map.put("code",0);
	        map.put("count",count);
	        map.put("data",books);
	        System.out.println(map);
	        return map;
	}
	
	@PostMapping(value="/findJson")
	@ResponseBody
	public Map<String, Object> findJson(String value,String domain){
		System.out.println("value:::"+value);
		System.out.println("domain:::"+domain);
		System.out.println("类型是：：："+domain.getClass().getName());
		ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		   Book bean=ctx.getBean("book",Book.class);
		if(domain.equals("0"))
		bean.setBookId(Integer.parseInt(value));
		
		if(domain.equals("1"))
		bean.setUserId(Integer.parseInt(value));
		if(domain.equals("2"))
		bean.setRoomId(Integer.parseInt(value));
		if(domain.equals("3"))
		bean.setBookPhone(value);
		if(domain.equals("4"))
		bean.setEmail(value);
		if(domain.equals("5"))
		bean.setBookName(value);
		if(domain.equals("6"))
		bean.setBookPrice(Integer.parseInt(value));
		if(domain.equals("7"))
		bean.setBookState(Integer.parseInt(value));
		
		 List<Book> books = bookService.findByAll(bean);
	        int count = bookService.countAllBook();
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("msg","");
	        map.put("code",0);
	        map.put("count",count);
	        map.put("data",books);
	        System.out.println(map);
	        return map;
	}
	
	
/*	@PostMapping(value="/getListDeleteJson")
	@ResponseBody
	public String getListDeleteJson(@RequestParam("bookId") Integer bookId){
		 List<Book> books = bookService.getListDeleteJson(bookId);
		 String state="0";
	       if(books!=null)
	    	   state="1";
	        return state;
	}	*/
	//json执行删除操作
	@PostMapping(value="/deleteJson")
	@ResponseBody
	public String deleteJson(@RequestParam("bookId") Integer bookId){
		//删除要用查找 找到这个值返回整条数据 外面会输出1表示有数据 然后在外面删除
		boolean flag=false;
		flag = bookService.deleteByBoodId(bookId);
		if(flag==true)
			return "1";
		return "0";
	}
	
	
	
	/*@GetMapping(value="/updateJson")
	@ResponseBody
	public boolean updateJson(Book bean){
		boolean flag=bookService.updateByBookId(bean);
		return flag;
	}*/
	//下面两个为json更新 updateGo为页面跳转显示更新页面，update是执行更新操作
	@RequestMapping(value="/updateGo")
	public String updateGo(@RequestParam("bookId")int bookId,@RequestParam("roomId") int roomId,@RequestParam("userId") int userId
			,@RequestParam("bookPhone") String bookPhone,@RequestParam("email") String email,@RequestParam("bookPrice") int bookPrice,@RequestParam("bookState") int bookState
			,@RequestParam("bookName") String bookName
			,@RequestParam("arriveDate") String arriveDate){
		
		return "managebookupdate";
	}
	
	@PostMapping(value="/update")
	@ResponseBody
	public boolean update(Book bean){
		
		return bookService.updateByBookId(bean);
	}
	
	
	
	

	
	
	/*@RequestMapping(value="/manageuser")
	public String manageuser(){
		return "manageuser";
	}*/
	

}

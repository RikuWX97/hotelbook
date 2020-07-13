package lingnan.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lingnan.pojo.Book;
import lingnan.pojo.Listobj;
import lingnan.pojo.Room;
import lingnan.pojo.User;
import lingnan.service.RoomService;
import lingnan.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/room")
public class RoomController{
	@Autowired
	private RoomService roomService;
	//查询所有
	 @RequestMapping("/list")
	 public String list(HttpServletRequest request){
		 List<Room> list = roomService.getList();
		 request.setAttribute("list", list);
	     return "forward:../room.jsp";		 
	 }
	@GetMapping("/getListJson")
	@ResponseBody
	 public List<Room> getListJson() {
        System.out.println("getListJson");
        return roomService.getList();
    }
 
	 //修改
	 @RequestMapping("/update")
	 public String update(HttpSession session,Room bean, Integer roomId){
			boolean flag= false;
			flag = roomService.update(bean);
			if(flag=false)
				return "error";
			System.out.println("update: "+flag);
			session.setAttribute("update", roomService.getList());
			System.out.println(bean);
		    return "redirect:list";
	 }
	
	 //更新
	 @RequestMapping("/delete")
	 public String delete(HttpSession session,Room bean,Integer roomId){
	     boolean flag = false;
	     flag = roomService.delete(roomId);
	     if(flag = false)
	    	 return "error";
	     System.out.println("delete: "+flag);
	     session.setAttribute("delete", roomService.getList());
	     System.out.println(bean);
		 return "room";
	 }
	 
	 @RequestMapping("/findById")
	    public String findById(@RequestParam(value = "roomId") Integer roomId, Model model) {
        System.out.println("roomId:" + roomId);
        Room room = roomService.getByRoomId(roomId);  
        model.addAttribute("room", room);
        return "forward:/result.jsp";
    }
	 
	 //通过房间类型进行模糊查询
	 @RequestMapping("/lists")
	 public String findByType(HttpSession session,String roomType,Room bean){
		 System.out.println("roomType:::"+roomType);
		 List<Room> lists =  roomService.getByType(bean);
	     session.setAttribute("lists", lists);
	     System.out.println(lists);
		 return "../../room";
	 }
	 
	 //增加room数据，并上传图片
	@RequestMapping("/save")
	public String upload(Room bean,HttpServletRequest request,Model model) throws IllegalStateException, IOException{
		System.out.println(request.getParameter("roomType"));
		//保存数据库路径
		String sqlPath = null;
		//定义文件保存的本地路径
		String localPath="C:\\upload\\";
		//定义文件名
		String filename = null;
		if(!bean.getFile().isEmpty()){
			//生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型
			String contenType = bean.getFile().getContentType();
			//获取文件后缀
			String suffixName = contenType.substring(contenType.indexOf("/")+1);
			//得到文件名
			filename = uuid+"."+suffixName;
			System.out.println(filename);
			//保存文件路径
			bean.getFile().transferTo(new File(localPath+filename));
		  }
			sqlPath = filename;
			System.out.println(sqlPath);
			bean.setRoomId(Integer.parseInt(request.getParameter("roomId")));
			bean.setRoomType(request.getParameter("roomType"));
			bean.setRoomPrice(Integer.parseInt(request.getParameter("roomPrice")));
			bean.setRoomStock(Integer.parseInt(request.getParameter("roomStock")));
			bean.setImage(sqlPath);
			bean.setFormu(request.getParameter("formu"));
			roomService.save(bean);
			model.addAttribute("bean", bean);
			System.out.println(bean);
			return "redirect:list";
		}
	

	//json查询下面两个是查询json方法  getMapjson为显示全部数据 ，findjson是条件查询输出数据
	@GetMapping(value="/getMapJson")
	@ResponseBody
	public Map<String, Object> getMapJson(){
		 List<Room> rooms = roomService.getList();
	        int count = roomService.countAllRoom();
	        System.out.println("coun:::"+count);
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("msg","");
	        map.put("code",0);
	        map.put("count",count);
	        map.put("data",rooms);
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
		   Room bean=ctx.getBean("room",Room.class);
		if(domain.equals("0"))
		bean.setRoomId(Integer.parseInt(value));
		
		if(domain.equals("1"))
		bean.setRoomType(value);
		if(domain.equals("2"))
		bean.setRoomPrice(Integer.parseInt(value));
		if(domain.equals("3"))
		bean.setRoomStock(Integer.parseInt(value));
		if(domain.equals("4"))
		bean.setImage(value);
		if(domain.equals("5"))
		bean.setFormu(value);
		
		
		 List<Room> rooms = roomService.findByAll(bean);
	        int count = roomService.countAllRoom();
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("msg","");
	        map.put("code",0);
	        map.put("count",count);
	        map.put("data",rooms);
	        System.out.println(map);
	        return map;
	}
	//json删除
	//json执行删除操作
		@PostMapping(value="/deleteJson")
		@ResponseBody
		public String deleteJson(@RequestParam("roomId") Integer roomId){
			//删除要用查找 找到这个值返回整条数据 外面会输出1表示有数据 然后在外面删除
			boolean flag=false;
			flag = roomService.delete(roomId);
			if(flag==true)
				return "1";
			return "0";
		}
		
		//json更新
		//下面两个为json更新 updateGo为页面跳转显示更新页面，update是执行更新操作
		@RequestMapping(value="/updateGo")
		public String updateGo(@RequestParam("roomId")int roomId,@RequestParam("roomType") String roomType
				,@RequestParam("roomPrice") int roomPrice,@RequestParam("roomStock") int roomStock
				,@RequestParam("image") String image,@RequestParam("formu") String formu){
			
			return "manageroomupdate";
		}
		
		@PostMapping(value="/update")
		@ResponseBody
		public boolean update(Room bean){
			
			return roomService.update(bean);
		}
		//跳转到预定界面
		@RequestMapping(value="/gobook")
		public String gobook(HttpSession session,@RequestParam("roomId")int roomId,@RequestParam("roomStock")int roomStock){
			System.out.println("roomStock:::"+roomStock);
			if(roomStock<=0)
				return "error";
			ApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
			   Book book=ctx.getBean("book",Book.class);
			User user=(User) session.getAttribute("loginUser");
			System.out.println("loginUser:::"+user);
			
			Room bean=roomService.getByRoomId(roomId);	
//			Book book = null;
			book.setRoomId(bean.getRoomId());
			book.setUserId(user.getId());
			book.setBookPrice(bean.getRoomPrice());
			session.setAttribute("bookInf", book);
			session.setAttribute("room", bean);
		        return "book";
		}
		
}

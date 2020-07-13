package lingnan.controller;

import lingnan.pojo.Book;
import lingnan.pojo.User;
import lingnan.service.BookService;
import lingnan.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    //是否记住密码
    boolean isMe;

    /**
     * 登录
     * @param name 用户名
     * @param password 密码
     * @param model
     * @param session
     * @param request
     * @param response
     * @param isMemory 记住账号密码
     * @return
     */
    //@PostMapping("/login") http://localhost:8080/项目名/user/login
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String name,
                        String password,
                        Model model,
                        HttpSession session,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam(required = false) String isMemory) {
        if(isMemory == null){
            isMe = false;
        }else{
            isMe = true;
        }
        System.out.println("loginName:::" + name + ", loginPassword:::" + password);
        User bean = userService.login(name, password);
        if (bean != null) {
        	
            //登录成功
            //session保存
        	bean.setName(name);
        	 bean.setLastLoginDate(new Date());
        	 System.out.println("bean::::::"+bean);
             userService.updateLoginDate(bean);
             
            session.setAttribute("loginUser", bean);
            
           
            //记住密码，使用Cookie
            try {
                isMemory(isMe, bean, request, response);
            } catch (UnsupportedEncodingException e) {
                // TODO 自动生成的 catch 块
                e.printStackTrace();
            }

        }else {
            //登录失败
            model.addAttribute("msgError", "用户名或密码错误!");
//            model.addAttribute("msgError", false);
            //return "forward:login.jsp";//http://localhost:8080/项目名/user/login.jsp
            return "forward:../login.jsp";
        }
//        return "test";
        if(bean.getAccess()==0)
    		return "forward:../manage.jsp";
        return "forward:../index.jsp";
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpSession session) {
        session.removeAttribute("loginUser");
        return "forward:../login.jsp";
    }

    /**
     * 记住密码的cookies
     * @param isMe
     * @param user
     * @param request
     * @param response
     * @throws UnsupportedEncodingException
     */
    private void isMemory(boolean isMe, User user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        if(isMe){
//            Cookie userName = new Cookie("userName", URLEncoder.encode(user.getName(), "utf-8"));
            Cookie userName = new Cookie("userName", user.getName());
            userName.setPath("/");
            Cookie userPassword = new Cookie("userPassword",user.getPassword());
            userPassword.setPath("/");
            Cookie memoryCheck = new Cookie("memoryCheck","checked");
            memoryCheck.setPath("/");
            response.addCookie(userName);
            response.addCookie(userPassword);
            response.addCookie(memoryCheck);
        }else {
            for (Cookie cookie :request.getCookies()){
                //设置生存时间为0
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
//            for (Cookie cookie :request.getCookies()) {
//                if(cookie.equals("userName")|cookie.equals("userPassword")){
//                    cookie.setMaxAge(0);;
//                    cookie.setPath("/");
//                    response.addCookie(cookie);
//                }
//            }
        }

    }

    /**
     * 注册
     * @param bean
     * @param br
     * @param cfmPassword
     * @param model
     * @return
     */
    @PostMapping("/reg")
    public String reg(@Valid User bean, BindingResult br, String cfmPassword, Model model) {
        System.out.println("reg:::" + bean);
        System.out.println("再次确认的密码:::" + cfmPassword);

        //判断两次密码是否一致
        if(!bean.getPassword().equals(cfmPassword)) {
            model.addAttribute("msgPasswordError", "两次输入密码不一致!");
            return "forward:../reg.jsp";
        }

        //用户注册输入数据校验
        if(br.hasErrors()) {
            Map<String, String> errors = new HashMap<String, String>();
            System.out.println("==============================表单数据错误=================================");
            List<FieldError> fieldErrors = br.getFieldErrors();
            for (FieldError item : fieldErrors) {
                System.out.println(item.getField()+":");
                System.out.println(item.getDefaultMessage());
                errors.put(item.getField(), item.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            return "forward:../reg.jsp";
        }

        //判断用户名重复
        if (userService.getByName(bean.getName()) != null) {
            model.addAttribute("msgNameUsed", "该用户名已经被使用!");
            return "forward:../reg.jsp";
        }

        //给注册时间赋值
        bean.setRegDate(new Date());
        System.out.println("注册时间:::"+bean.getRegDate());

        //注册
        boolean result = userService.insert(bean);
        if (result) {
            System.out.println("注册成功");
            model.addAttribute("msgIsSuccess", true);
            return "forward:../login.jsp";
        }
        System.out.println("注册失败");
        model.addAttribute("msgIsSuccess", false);
        model.addAttribute("msgError", "注册失败!");
        return "forward:../reg.jsp";
    }

    /**
     * 根据id查询某个用户的所有信息
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getById")
    public String getById(Integer id, Model model, HttpSession session){
        System.out.println("当前用户的id:::" + id);
        User bean = userService.getById(id);
        if (bean != null){
            //找到用户信息
            System.out.println("当前用户的信息:::" + bean);
            //session保存
            session.setAttribute("userInfo", bean);
        }else {
            //无法找到用户信息
            model.addAttribute("msgError", "登陆过期！请重新登录!");
            return "forward:../login.jsp";
        }
        return "用户主页";
    }

    /**
     * 更新用户信息
     * @param bean
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/update")
    public String update(User bean,
                         String cfmPassword,
                         String oldPassword,
                         String checkPhone,
                         Model model,
                         HttpSession session){
        //获取当前登录用户的id，并且传给bean中的id
        User user = (User) session.getAttribute("loginUser");
        Integer uid = user.getId();
        bean.setId(uid);
        System.out.println("当前用户的id为:::"+uid);
        System.out.println("当前用户的更新信息:::" + bean);
      //先判断用户名是否改变，如果改变了要判断用户名是否已经被使用
        if((bean.getName()!=null)&&bean.getName().equals(user.getName()))
            System.out.println("更新提示:::用户名不变");
        else if(userService.getByName(bean.getName()) != null) {
            model.addAttribute("msgNameUsed", "该用户名已经被使用!");
            return "user";
        }
        //如果是密码更新
        if(oldPassword != null) {
            //先进行原密码验证
            if(!oldPassword.equals(user.getPassword())){
                model.addAttribute("msg", "原密码错误！请重试!");
                return "user";
            }
            //再判断两次密码是否一致
            if(cfmPassword != null){
                if(!bean.getPassword().equals(cfmPassword)) {
                    model.addAttribute("msg", "两次输入密码不一致!");
                    return "user";
                }
            }
        }else if (checkPhone != null) {  //如果是找回密码
            //先进行手机验证
            if(!checkPhone.equals(user.getPhone())){
                model.addAttribute("msg", "手机验证错误！请重试!");
                return "user";
            }
            //再判断两次密码是否一致
            if(cfmPassword != null){
                if(!bean.getPassword().equals(cfmPassword)) {
                    model.addAttribute("msg", "两次输入密码不一致!");
                    return "user";
                }
            }
        }
        //执行更新
        boolean result = userService.update(bean);
        if (result){
            //更新用户信息成功
            User newBean = userService.getById(uid);
            System.out.println("更新后的用户信息:::"+newBean);
            //session保存
            session.setAttribute("userInfo", newBean);
            //当前登录的账户信息改变
            session.setAttribute("loginUser", newBean);
            model.addAttribute("msg", "用户信息已更新！");
        }else {
            //更新用户信息失败
            model.addAttribute("msg", "更新失败!请重试！");
        }

        //如果进行了修改密码，要重新登录
        if(oldPassword != null){
            loginOut(session);
            return "forward:../login.jsp";
        }else
            return "user";
    }

    /**
     * 查找所有用户
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getAll")
    public String getAll(Integer id, Model model, HttpSession session){
        List<User> allUser =  userService.getList();
        if (allUser != null){
            //找到用户信息
            System.out.println("所有用户的信息:");
            System.out.println(allUser);
            //session保存
            session.setAttribute("allUser", allUser);
        }else {
            //没有找到用户信息
            model.addAttribute("msgError", "没有找到用户!");
            return "???";
        }
        return "???";
    }

    /**
     * 删除用户
     * @param list
     * @param model
     * @return
     */
    @RequestMapping("/deleteByIds")
    public String deleteByIds(List<Integer> list, Model model) {
        int result = userService.deleteByIds(list);
        if (result >= 0) {
            System.out.println("删除了" + result + "条记录！");
        }else {
            model.addAttribute("msgError", "删除失败!");
        }
        return "???";
    }

    /**
     * 以json数据格式返回所有用户数据
     * @return
     */
    @GetMapping("/getListJson")
    @ResponseBody
    public List<User> getListJson() {
        System.out.println("getListJson");
        return userService.getList();
    }
  //上面为user.jsp实验用的方法，下面两个才是查询json方法  getMapjson为显示全部数据 ，findjson是条件查询输出数据
  	@GetMapping(value="/getMapJson")
  	@ResponseBody
  	public Map<String, Object> getMapJson(){
  		 List<User> users = userService.getList();
  	        int count = userService.countAllUser();
  	        System.out.println("coun:::"+count);
  	        Map<String, Object> map = new HashMap<String, Object>();
  	        map.put("msg","");
  	        map.put("code",0);
  	        map.put("count",count);
  	        map.put("data",users);
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
		   User bean=ctx.getBean("user",User.class);
		if(domain.equals("0"))
		bean.setId(Integer.parseInt(value));
		if(domain.equals("1"))
		bean.setName(value);
		if(domain.equals("2"))
		bean.setPassword(value);
		if(domain.equals("3"))
		bean.setSex(value);
		if(domain.equals("4"))
		bean.setPhone(value);
		if(domain.equals("5"))
		bean.setEmail(value);
		if(domain.equals("6"))
		bean.setAccess(Integer.parseInt(value));
  		
  		 List<User> users = userService.findByAll(bean);
  	        int count = userService.countAllUser();
  	        Map<String, Object> map = new HashMap<String, Object>();
  	        map.put("msg","");
  	        map.put("code",0);
  	        map.put("count",count);
  	        map.put("data",users);
  	        System.out.println(map);
  	        return map;
  	}
  	@PostMapping(value="/deleteJson")
	@ResponseBody
	public String deleteJson(@RequestParam("id") Integer id){
		//删除要用查找 找到这个值返回整条数据 外面会输出1表示有数据 然后在外面删除
  		List<Integer> ids=new ArrayList<Integer>();
  		ids.add(id);
		int flag=0;
		flag = userService.deleteByIds(ids);
		if(flag!=0)
			return "1";
		return "0";
	}
  	
  //下面两个为json更新 updateGo为页面跳转显示更新页面，update是执行更新操作
  	@RequestMapping(value="/updateGo")
  	public String updateGo(@RequestParam("id")int id,@RequestParam("name") String name,@RequestParam("password") String password
  			,@RequestParam("sex") String sex,@RequestParam("phone") String phone
  			,@RequestParam("email") String email,@RequestParam("access") int access){
  		
  		return "manageuserupdate";
  	}
  	
  	@PostMapping(value="/updatejson")
  	@ResponseBody
  	public boolean updatejson(User bean){
  		
  		return userService.update(bean);
  	}
  	@RequestMapping(value="/mine")
  	public String mine(HttpSession session){
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
  	}

}

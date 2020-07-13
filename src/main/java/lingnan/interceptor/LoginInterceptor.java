package lingnan.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    //请求之前，在请求方法之前
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("preHandle:::" + request.getRequestURI());
        System.out.println("preHandle:::" + request.getRequestURL());
        StringBuffer url = request.getRequestURL();

        if (url.toString().endsWith("user/login") || url.toString().endsWith("user/reg") || url.toString().endsWith("room/list")) {
            return true;
        }else {
            //获取session对象
            Object o = request.getSession().getAttribute("loginUser");
            if (o == null) {
                //传个参数
                request.setAttribute("msg", "请先登录!");
                //没有登录过
                //response.sendRedirect("../login.jsp");
                //如果页面都在pages下
                request.getRequestDispatcher("../login.jsp").forward(request, response);
                //控制台
                System.out.println("用户未登录,拦截此访问！");
            }else {
                //控制台
                System.out.println("这是用户登录后的正常访问或操作。");
                return true;
            }
        }
        return false;
    }

    //请求通过，是方法里面的代码执行之后
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle");
    }

    //请求完成，页面渲染完毕
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion");
    }
}
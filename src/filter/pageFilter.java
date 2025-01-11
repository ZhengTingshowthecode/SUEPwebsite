package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class pageFilter implements Filter {
    @Override
    //初始化方法, 只调用一次
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("pageFilter");
    }

    @Override
    //拦截到请求之后调用, 调用多次
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req1 = (HttpServletRequest) req;
        HttpServletResponse res1 = (HttpServletResponse) res;
        // 获取访问的页面的url
        String uri = req1.getRequestURI();
        String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
        if (!path.equals("/login")) {
            Object uid = req1.getSession().getAttribute("uid");
            if (uid == null) {
                res1.sendRedirect("login.jsp");
            }
        }
        chain.doFilter(req, res);
    }

    @Override
    //销毁方法, 只调用一次
    public void destroy() {
        System.out.println("destroy()");
    }
}


package Controller;

import DAO.UserDao;
import Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

@WebServlet("/User.action")
public class UserServlet extends HttpServlet {
    // 用户登录检测
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String opttype = req.getParameter("opttype");
        switch (opttype) {
            case "login":
                String uid = req.getParameter("uid");
                String upwd = req.getParameter("upwd");
                if (uid.equals("") || uid.equals(" ") || upwd.equals("") || upwd.equals(" ")) {
                    String warning = null;
                    warning = URLEncoder.encode("用户名或密码不能为空!", "utf-8");
                    out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                            "window.location.href='login.jsp'</script>");
                    //res.sendRedirect("login.jsp");
                } else {
                    HttpSession session = req.getSession();
                    // 用户输入的验证码
                    String yanzhengma = req.getParameter("useryzm");
                    // 得到自动生成的验证码
                    String yzm = (String)session.getAttribute("yzm");
                    if (yanzhengma.equals(" ") || yanzhengma.equals("") || !yzm.equals(yanzhengma)) {
                        String warning = null;
                        warning = URLEncoder.encode("验证码有误！重新输入！", "utf-8");
                        out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                                "window.location.href='login.jsp'</script>");
                    } else {
                        String nowView = "index.jsp";
                        if (req.getSession().getAttribute("nowView") != null) {
                            nowView = (String)req.getSession().getAttribute("nowView");
                        }
                        List<User> ulist = UserDao.checkUser(uid, upwd);
                        if (ulist.size() != 0 && ulist.get(0).getType() == 0) {  // 普通用户
                            if (("manager.jsp".equals(nowView)||"publishNews.jsp".equals(nowView)||
                                    "uploadFile.jsp".equals(nowView)||"uploadImg".equals(nowView))) {
                                String warning = null;
                                warning = URLEncoder.encode("你不是管理员！禁止！", "utf-8");
                                out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                                        "window.location.href='login.jsp'</script>");
                            } else {
                                String uname = ulist.get(0).getName();   // 用户昵称
                                session.setAttribute("uid", uid);
                                session.setAttribute("uname", uname);
                                String warning = null;
                                warning = URLEncoder.encode("用户： " + uname + "欢迎您", "utf-8");
                                out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                                        "window.location.href='"+nowView+"'</script>");
                            }
                        } else if (ulist.size() != 0 && ulist.get(0).getType() == 1) {  // 管理员
                            String uname = ulist.get(0).getName();   // 用户昵称
                            session.setAttribute("uid", uid);
                            session.setAttribute("uname", uname);
                            String warning = null;
                            warning = URLEncoder.encode("管理员： " + uname + "欢迎您", "utf-8");
                            out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                                    "window.location.href='"+nowView+"'</script>");
                        } else {
                            String warning = null;
                            warning = URLEncoder.encode("用户名或密码错误!", "utf-8");
                            out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                                    "window.location.href='login.jsp'</script>");
                            //res.sendRedirect("login.jsp");
                        }
                    }
                }
                break;
            case "delete" :
                String uid01 = req.getParameter("uid");
                int r = UserDao.deleteUser(uid01);
                res.sendRedirect("manager.jsp");
                break;
            case "update" :
                String id = req.getParameter("id");
                String name = req.getParameter("name");
                String pwd = req.getParameter("pwd");
                int type = Integer.parseInt(req.getParameter("type"));
                int r02 = UserDao.updateUser(id, name, pwd, type);
                res.sendRedirect("manager.jsp");
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }
}

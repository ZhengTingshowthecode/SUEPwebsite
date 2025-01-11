package Controller;

import DAO.NewsDao;
import Entity.News;
import Util.ImgsURL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/News.action")
public class NewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        String optType = req.getParameter("optType");
        switch(optType) {
            // 发布新闻
            case "publish" :
                int ntype = Integer.parseInt(req.getParameter("ntype"));
                String pubTitle = req.getParameter("title");
                String pubContent = req.getParameter("newstxt");
                String pubPerson=(String)session.getAttribute("uname");
                String pubDate=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
                News news = new News();
                news.setNewsTitle(pubTitle);
                news.setNewsContent(pubContent);
                news.setPubPerson(pubPerson);
                news.setPubDate(pubDate);
                // 存入新闻内容与信息
                int r = NewsDao.publishNews(news, ntype);
                // 单独存入图片路径
                List<String> urls = ImgsURL.getImgStr(pubContent);
                int r2 = NewsDao.saveImgs(urls, ntype, pubTitle, pubDate);
                // 附件相关
                FileServlet.getInfo(ntype, news);
                out.println("<html>");
                out.println("<head><title>need uploadFile</title></head>");
                out.println("<body>");
                out.println("<span><a href=\"uploadFile.jsp\">Maybe you need upload attachments?</a></span>");
                out.println("<br>");
                out.println("<span><a href=\"manager.jsp\">return manager view</a></span>");
                out.println("</body>");
                out.println("</html>");
                break;
            // 显示整篇新闻内容
            case "show" :
                String title=req.getParameter("title");
                String newstxt=req.getParameter("newstxt");
                //String pubDate=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
                String pubUser=(String)session.getAttribute("uname");

                out.println(title);
                //out.println(pubDate);
                out.println(pubUser);
                out.println(newstxt);
                break;
            case "delete" :
                int nid = Integer.parseInt(req.getParameter("nid"));
                int ntype02 = Integer.parseInt(req.getParameter("ntype"));
                int r02 = NewsDao.deleteNews(ntype02, nid);
                res.sendRedirect("manager.jsp");
                break;
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }
}

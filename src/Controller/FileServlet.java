package Controller;

import DAO.NewsDao;
import Entity.News;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet("/file.action")
public class FileServlet extends HttpServlet {
    public static News news = new News();
    public static int type = -1;
    private ServletConfig config;
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }
    public ServletConfig getServletConfig() {
        return config;
    }
    private String createFileUUID() {
        String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-", "");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int count = 0;
        SmartUpload su = new SmartUpload();
        try {
            su.initialize(config, request, response);
            su.setAllowedFilesList("doc,txt,docx,rar,zip,7z,pdf,xlsx,xls,jpg,png,jpeg");
            su.upload();
            String opttype = su.getRequest().getParameter("opttype");
            //
            List<String> list = new ArrayList<>();
            if("fileupload".equals(opttype)) {
                for (int i = 0; i < su.getFiles().getCount(); i++) {
                    com.jspsmart.upload.File file = su.getFiles().getFile(i);
                    if (file.isMissing()) continue;
                    String fileExt=file.getFileExt();
                    int fileSize=file.getSize();
                    String fileName=file.getFileName();
                    String newFileName=createFileUUID();
                    count++;
                    file.saveAs("D:/javaEE_project/SUEPWebsite/web/upload/" + newFileName+"."+fileExt,
                            su.SAVE_PHYSICAL);
                    System.out.println(newFileName+" "+fileExt+"::"+fileSize);
                    list.add("<a href='D:/javaEE_project/SUEPWebsite/web/upload/" + newFileName+"."+fileExt+"'>" +
                            "<p>"+newFileName+"."+fileExt+" 点击下载</p></a>");
                }
                int r3 = NewsDao.saveFuJian(list, type, news.getNewsTitle(), news.getPubDate());
                out.println("附件总数为" + count + "，全部上传成功!");
                //out.println(list.get(0));
                out.println("<br><a href=\"manager.jsp\">return");
                System.out.println(r3);
            }
            if ("imgupload".equals(opttype)) {
                for (int i = 0; i < su.getFiles().getCount(); i++) {
                    com.jspsmart.upload.File file = su.getFiles().getFile(i);
                    if (file.isMissing()) continue;
                    String fileExt=file.getFileExt();
                    int fileSize=file.getSize();
                    String fileName=file.getFileName();
                    count++;
                    file.saveAs("D:/javaEE_project/SUEPWebsite/web/upload/" + fileName+"."+fileExt,
                            su.SAVE_PHYSICAL);
                    System.out.println(fileName+" "+fileExt+"::"+fileSize);
                    list.add("D:/javaEE_project/SUEPWebsite/web/upload/" + fileName+"."+fileExt);
                }
                int r3 = NewsDao.saveBanner(list);
                String warning = null;
                warning = URLEncoder.encode("上传成功!", "utf-8");
                out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                        "window.location.href='manager.jsp'</script>");
                System.out.println(r3);
            }
        } catch (Exception e) {
            out.println("Unable to upload the file.<br>");
            out.println("Error : " + e.toString());
        }
    }

    public static void getInfo(int getType, News getNews) {
        type = getType;
        news.setNewsTitle(getNews.getNewsTitle());
        news.setPubDate(getNews.getPubDate());
    }
}

<%@ page import="DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.User" %>
<%@ page import="Entity.News" %>
<%@ page import="DAO.NewsDao" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/12/19
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
        String value = request.getParameter("value");
        if ("userInfo".equals(value)) {
            List<User> ulist = UserDao.showUserInfo();
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:120px;\">");out.println("用户id");out.println("</td>");
            out.println("<td style=\"width:120px;\">");out.println("姓名");out.println("</td>");
            out.println("<td style=\"width:120px;\">");out.println("密码");out.println("</td>");
            out.println("<td style=\"width:250px;\">");out.println("类型（0为普通用户， 1为管理员）");;out.println("</td>");
            out.println("<td style=\"width:120px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < ulist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:120px;\">");out.println(ulist.get(i).getId());out.println("</td>");
                out.println("<td style=\"width:120px;\">");out.println(ulist.get(i).getName());out.println("</td>");
                out.println("<td style=\"width:120px;\">");out.println(ulist.get(i).getPwd());out.println("</td>");
                out.println("<td style=\"width:250px;\">");out.println(ulist.get(i).getType());out.println("</td>");
                out.println("<td style=\"width:120px;\">");
                out.println("<a href='User.action?opttype=delete&uid="+ulist.get(i).getId()+"'>删除</a>");
                out.println("<a href='updateUser.jsp?opttype=update&uid="+ulist.get(i).getId()+"'>修改</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news0".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(0);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=0&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news1".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(1);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=1&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news2".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(2);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=2&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news3".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(3);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=3&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news4".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(4);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=4&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news5".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(5);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=5&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        } else if ("news6".equals(value)) {
            List<News> nlist = NewsDao.getNewsInfo(6);
            out.println("<table border=\"1\" style=\"table-layout: fixed\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<td style=\"width:150px;\">");out.println("新闻id");out.println("</td>");
            out.println("<td style=\"width:350px;\">");out.println("新闻标题");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布者");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("发布时间");out.println("</td>");
            out.println("<td style=\"width:150px;\">");out.println("操作");out.println("</td>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < nlist.size(); i++) {
                out.println("<tr>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getNewsId());out.println("</td>");
                out.println("<td style=\"width:350px;\">");out.println(nlist.get(i).getNewsTitle());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubPerson());out.println("</td>");
                out.println("<td style=\"width:150px;\">");out.println(nlist.get(i).getPubDate());out.println("</td>");
                out.println("<td style=\"width:150px;\">");
                out.println("<a href='News.action?optType=delete&ntype=6&nid="+nlist.get(i).getNewsId()+"'>删除</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
        }
        %>
    </body>
</html>

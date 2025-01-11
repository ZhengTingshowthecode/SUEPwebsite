<%@ page import="java.util.List" %>
<%@ page import="Entity.News" %>
<%@ page import="DAO.NewsDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/16
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="top.jsp"%>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "detailText.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <title>内容</title>
        <link rel="stylesheet" href="./css/detailText.css">
    </head>
    <body>
        <div class="container">
            <div class="banner">
                头部图片
            </div>
            <%
                int ntype = Integer.parseInt(request.getParameter("ntype"));
                int nid = Integer.parseInt(request.getParameter("nid"));
                List<News> nlist = NewsDao.getNewsInfo02(ntype, nid);
                List<String> fujian = NewsDao.getfujian(ntype, nid);
                out.println("<h2 style=\"text-align: center\">"+nlist.get(0).getNewsTitle()+"</h2>");out.println("<br>");
                out.println("<p style=\"color: grey; text-align: center\">"+nlist.get(0).getPubDate()+"</p>");
                out.println("<br>");
                out.print(nlist.get(0).getNewsContent());
                out.println("<br>");
                out.println("<p style=\"text-align: right\">"+nlist.get(0).getPubPerson()+"</p>");
                out.println("<br>");out.println("<br>");out.println("<br>");
                if (fujian.size() > 0) {
                    for (int i = 0; i < fujian.size(); i++) {
                        out.println(fujian.get(i));
                        out.println("<br>");
                    }
                }
            %>
        </div>
    </body>
</html>

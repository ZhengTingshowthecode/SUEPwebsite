<%@ page import="java.util.List" %>
<%@ page import="Entity.News" %>
<%@ page import="DAO.NewsDao" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/16
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="top.jsp"%>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "searchAll.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
%>
<%
    int ntype = Integer.parseInt(request.getParameter("value"));
    List<News> listAll = NewsDao.getNewsInfo(ntype);
    int currentPage = 1; // 默认当前第一页，每页有8条记录
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
%>
<html>
    <head>
        <title>查看全部</title>
        <link rel="stylesheet" href="./css/searchAll.css">
    </head>
    <body>
        <div class="container">
            <div class="banner">
                头部图片
            </div>
            <div class="middle">
                <div class="left">
                    <ul>
                        <li><a href=""><p>>&nbsp;教务通知</p></a></li>
                        <li><a href=""><p>>&nbsp;专业介绍</p></a></li>
                        <li><a href=""><p>>&nbsp;培养方案</p></a></li>
                        <li><a href=""><p>>&nbsp;课程设置</p></a></li>
                        <li><a href=""><p>>&nbsp;教学成果</p></a></li>
                    </ul>
                </div>
                <div class="right">
                    <ul>
                        <%
                            for (int i = 0; i < 8; i++) {
                                if ((currentPage-1)*8+(i+1) < listAll.size()) {
                                    int nid = listAll.get((currentPage-1)*8+i).getNewsId();
                                    out.println("<li><a href=\"detailText.jsp?nid="+nid+"&ntype="+ntype+"\">"+
                                            "<h4>"+listAll.get((currentPage-1)*8+i).getNewsTitle()+"</h4>"
                                            +"<br>"+listAll.get((currentPage-1)*8+i).getPubDate()+"<br>"+"</a></li>");
                                } else {
                                    out.println("<li><a href=\"\"></a></li>");
                                }
                            }
                        %>
                    </ul>
                    <div class="page">
                        <ul>
                            <li>每页8记录</li>
                            <%
                                int cnt = listAll.size();
                                out.println("<li>总共"+cnt+"条记录</li>");
                            %>
                            <li class="firstPage"><a href="searchAll.jsp?page=1&value=<%=ntype%>&value=<%=ntype%>">第一页</a></li>
                            <%
                            if (currentPage > 1) {
                            %>
                            <li class="toPrev"><a href="searchAll.jsp?page=<%=currentPage-1%>&value=<%=ntype%>">&lt;&lt;上一页</a></li>
                            <%
                            }
                            int totalPages = (listAll.size() + 8 - 1)/8;
                            if (currentPage < totalPages) {
                            %>
                            <li class="toNext"><a href="searchAll.jsp?page=<%=currentPage+1%>&value=<%=ntype%>">下一页&gt;&gt;</a></li>
                            <%
                            }
                            %>
                            <li class="lastPage"><a href="searchAll.jsp?page=<%=totalPages%>&value=<%=ntype%>">尾页</a></li>
                            <li>页码<%=currentPage%>/<%=totalPages%></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%@include file="bottom.jsp"%>

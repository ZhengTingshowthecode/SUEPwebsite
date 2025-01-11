<%@ page import="java.util.List" %>
<%@ page import="Entity.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/22
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="top.jsp"%>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "manager.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
    if (uid != null) {
        List<User> tmplist = UserDao.checkUserbyID((String) uid);
        int tmptype = tmplist.get(0).getType();
        if (tmptype == 0) {
            String warning = null;
            warning = URLEncoder.encode("你不是管理员！禁止！", "utf-8");
            out.print("<script>alert(decodeURIComponent('"+ warning +"'));" +
                    "window.location.href='index.jsp'</script>");
        }
    }
%>

<html>
    <head>
        <title>管理员页面</title>
        <link rel="stylesheet" href="css/manager.css">
        <link rel="stylesheet" href="css/base.css">
    </head>
    <body>
        <div class="container">
            <div class="left">
                <ul class="menu" id="menu01">
                    <li class="menu_item userInfo">
                        <a href=""><h2>用户信息管理</h2></a>
                    </li>
                    <li class="menu_item">
                        <h2 style="color: #d9d9d9">新闻、通知管理</h2>
                        <ul class="type">
                            <li class="newsType">
                                <a href=""><h3>学院新闻</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>教务通知</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>通知公告</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>研究生教学</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>学术讲座</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>学生工作</h3></a>
                            </li>
                            <li class="newsType">
                                <a href=""><h3>招聘信息</h3></a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu_item publish">
                        <a href="publishNews.jsp"><h2>发布</h2></a>
                    </li>
                </ul>
                <ul>
                    <li class="menu_item Upload">
                        <a href=""><h2>上传主页轮播图</h2></a>
                    </li>
                </ul>
            </div>
            <div class="right">
                <iframe frameborder="0" scrolling="yes" style="width: 80%;height: 100%;" src="" id="aa"></iframe>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        let item02 = document.getElementsByClassName("userInfo");
        for (let i=0; i<item02.length; i++) {
            item02[i].onclick = function () {
                document.getElementById("aa").src = "managerTable.jsp?value=userInfo";
            }
        }

        let items = document.getElementsByClassName("newsType");
        for(let i=0; i<items.length; i++) {
            items[i].onclick = function (){
                let src;
                if (i === 0) src = "managerTable.jsp?value=news0"
                if (i === 1) src = "managerTable.jsp?value=news1"
                if (i === 2) src = "managerTable.jsp?value=news2"
                if (i === 3) src = "managerTable.jsp?value=news3"
                if (i === 4) src = "managerTable.jsp?value=news4"
                if (i === 5) src = "managerTable.jsp?value=news5"
                if (i === 6) src = "managerTable.jsp?value=news6"
                document.getElementById("aa").setAttribute("src", src)
            }
        }

        let item01 = document.getElementsByClassName("Upload");
        for (let i=0; i<item01.length; i++) {
            item01[i].onclick = function () {
                document.getElementById("aa").src = "uploadImg.jsp";
            }
        }
    </script>
</html>

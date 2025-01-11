<%@ page import="DAO.UserDao" %>
<%@ page import="Entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/12/20
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>修改用户信息</title>
    </head>
    <body>
        <%
            String uid02 = request.getParameter("uid");
            List<User> list = UserDao.showUserInfo02(uid02);
        %>
        <form action="User.action?opttype=update" method="post">
            <label>
                用户id (不可更改！)：<input type=text name='id' value="<%=list.get(0).getId()%>" style="color: red">
            </label>
            <br>
            <label>
                用户姓名：<input type=text name='name' value="<%=list.get(0).getName()%>">
            </label>
            <br>
            <label>
                用户密码：<input type=text name='pwd' value="<%=list.get(0).getPwd()%>">
            </label>
            <br>
            <label>
                用户类型：<input type=text name='type' value="<%=list.get(0).getType()%>">
            </label>
            <button type="submit">修改</button>
        </form>
    </body>
</html>

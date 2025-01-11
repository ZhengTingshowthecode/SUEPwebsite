<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/16
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>统一身份认证</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container">
            <form action="User.action?opttype=login" method="post" class="loginForm">
                <input type="hidden" name="opttype" value="login">
                <div class="suep-logo">学校logo</div>
                <h2>统一身份认证登录</h2>
                <label>
                    <input type="text" name="uid" placeholder="学号">
                </label>
                <label>
                    <input type="password" name="upwd" placeholder="密码">
                </label>
                <label>
                    <input type="text" class="useryzm" name="useryzm" placeholder="验证码">
                </label>
                <img src="YZM.action" alt="yzm" class="yzm"/>
                <button type="submit">登录</button>
            </form>
        </div>
    </body>
</html>

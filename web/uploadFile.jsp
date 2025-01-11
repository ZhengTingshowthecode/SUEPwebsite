<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/12/14
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "uploadFile.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <title>附件上传</title>
    </head>
    <body>
        <!--附件上传-->
        <form method="post" action="file.action" ENCTYPE="multipart/form-data">
            <input type="hidden" name="opttype" value="fileupload">
            <table width="50%" border="1" align="center">
                <tr>
                    <td><div align="center">
                        1、 <input type="FILE" name="FILE1" size="25">
                    </div></td>
                </tr>
                <tr>
                    <td><div align="center">
                        2、 <input type="FILE" name="FILE2" size="25">
                    </div></td>
                </tr>
                <tr>
                    <td><div align="center">
                        3、 <input type="FILE" name="FILE3" size="25">
                    </div></td>
                </tr>
                <tr>
                    <td><div align="center">
                      <input type="submit" name="Submit" value="上传">
                    </div></td>
                </tr>
            </table>
        </form>
    </body>
</html>

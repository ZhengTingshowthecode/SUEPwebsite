<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/12/19
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>上传图片</title>
    </head>
    <body>
        <!--img上传-->
        <form method="post" action="file.action" ENCTYPE="multipart/form-data">
            <input type="hidden" name="opttype" value="imgupload">
            <table width="50%" border="1" align="center">
                <tr>
                  <td><div align="center">
                      <input type="FILE" name="FILE1" size="25">
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

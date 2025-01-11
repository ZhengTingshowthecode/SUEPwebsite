<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/18
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "publishNews.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <title>Publish</title>
        <link rel="stylesheet" href="./css/publishNews.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="editer/normalize.min.css" rel="stylesheet">
        <link href="editer/style.css" rel="stylesheet">
        <link href="editer/layout.css" rel="stylesheet">
        <script src="editer/custom-elem.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="banner">
                头部图片
            </div>
            <div class="middle">
                <form class="form1" name="form1" method="post" action="News.action">
                    标题:<input type="text" name="title" style="width: 755px">
                    <br><br>
                    新闻、通知类型：
                    <select name="ntype" style="width: 500px">
                        <option value="0">学院新闻</option>
                        <option value="1">教务通知</option>
                        <option value="2">通知公告</option>
                        <option value="3">研究生教学</option>
                        <option value="4">学术讲座</option>
                        <option value="5">学生工作</option>
                        <option value="6">招聘信息</option>
                    </select>
                    <input type="hidden" name="optType" value="publish">
                    <input type="hidden" name="newstxt" id="newstxt"/>
                    <div class="page-container">
                        <div class="page-right">
                            <!-- 编辑器 DOM -->
                            <div style="border: 1px solid #ccc;width: 800px">
                                <div id="editor-toolbar" style="border-bottom: 1px solid #ccc;"></div>
                                <div id="editor-text-area" style="height: 300px"></div>
                            </div>
                            <br>
                            <!-- 内容状态 -->
                            <p style="background-color: #f1f1f1; width: 800px">
                                Text length: <span id="total-length"></span>；
                                Selected text length: <span id="selected-length"></span>；
                            </p>
                            <br>
                            <input type="submit" value="提交"
                                   style="width: 100px; height: 50px; border: none;
                                   background-color: #5EB69C; color: white; font-size: 15px">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="editer/index.js"></script>
        <script>
            const E = window.wangEditor
            // 切换语言
            const LANG = location.href.indexOf('lang=en') > 0 ? 'en' : 'zh-CN'
            E.i18nChangeLanguage(LANG)
            window.editor = E.createEditor({
                selector: '#editor-text-area',
                html: '<p><br></p>',
                config: {
                    placeholder: 'Type here...',
                    MENU_CONF: {
                        uploadImage: {
                            fieldName: 'your-fileName',
                            base64LimitSize: 10 * 1024 * 1024 // 10M 以下插入 base64
                        }
                    },
                    onChange(editor) {
                        console.log(editor.getHtml())
                        // 选中文字
                        const selectionText = editor.getSelectionText()
                        document.getElementById('selected-length').innerHTML = selectionText.length
                        // 全部文字
                        const text = editor.getText().replace(/\n|\r/mg, '')
                        document.getElementById('total-length').innerHTML = text.length

                        document.getElementById('newstxt').value= editor.getHtml()
                    }
                }
            })

            window.toolbar = E.createToolbar({
                editor,
                selector: '#editor-toolbar',
                config: {}
            })
        </script>
    </body>
</html>
<%@include file="bottom.jsp"%>

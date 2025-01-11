<%@ page import="Entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.NewsDao" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/12
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="top.jsp"%>
<%
    Object uid = request.getSession().getAttribute("uid");
    if (uid == null) {
        String nowView = "index.jsp";
        request.getSession().setAttribute("nowView", nowView);
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <title>计算机科学与技术学院</title>
        <link rel="stylesheet" href="./css/common.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/index.css">
        <%
            List<String> bannersList = NewsDao.getBanner();
            String url01 = bannersList.get(0).substring(34);
            System.out.println(url01);
            String url02 = bannersList.get(1).substring(34);
            String url03 = bannersList.get(2).substring(34);
        %>
    </head>
    <body>
        <!-- 中间海报 -->
        <div class="banner">
            <!-- 轮播图 -->
            <div class="pics">
                <ul class="pic">
                    <li><a href="#"><img id="lunBo_pics" src="<%=url01 %>" alt="轮播图"></a></li>
                    <!--<li><a href="#"><img id="lunBo_pics" src="upload/banner01.png.png" alt=""></a></li>-->
                    <!--<li><a href="#"><img src="upload/banner02.jpg" alt=""></a></li>
                    <li><a href="#"><img src="upload/banner03.png" alt=""></a></li>-->
                </ul>
            </div>
            <!-- 小圆点切换  -->
            <ol class="circle">
                <li class="active"><i></i></li>
                <li><i></i></li>
                <li><i></i></li>
            </ol>
        </div>
        <!-- 学院新闻 -->
        <div class="news">
            <div class="newsTop">
                <div class="left">
                    <h3>学院新闻</h3>
                </div>
                <div class="right">
                    <a href="searchAll.jsp?value=0"><span>查看全部&nbsp;&nbsp;></span></a>
                </div>
            </div>
            <div class="newsList">
                <div class="list1">
                    <ul>
                    <%
                        List<News> list0 = NewsDao.getNewsInfo(0);
                        for (int i = 0; i < 8; i++) {
                            String txt = list0.get(i).getNewsTitle().length()>=30?
                                    list0.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list0.get(i).getNewsTitle();
                            int nid = list0.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=0&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
                <div class="list2">
                    <ul>
                        <li><a href="">
                            <div class="img">
                                <%
                                // 第九条新闻的图片路径
                                List<String> imgurl = NewsDao.getImg(0, 9);
                                if (imgurl.size() > 0) {
                                    out.println("<img src=\""+imgurl.get(0)+"\" width=\"304\" height=\"220\">");
                                } else {
                                    out.println("<img src=\"\" alt=\"\">");
                                }
                                %>
                            </div>
                            <div class="text">
                                <%
                                    String txt01 = list0.get(8).getNewsTitle().length()>=30?
                                            list0.get(8).getNewsTitle().substring(0, 29)+"...":
                                            list0.get(8).getNewsTitle();
                                    int nid01 = list0.get(8).getNewsId();
                                    out.println("<a href=\"detailText.jsp?ntype=0&nid="+nid01+"\"><p>"+txt01+"</p>");
                                    out.println("<br>");
                                    out.println("<p>"+list0.get(8).getPubDate()+"</p></a>");
                                %>
                            </div>
                        </a></li>
                        <li><a href="">
                            <div class="img">
                                <%
                                    // 第九条新闻的图片路径
                                    List<String> imgurl02 = NewsDao.getImg(0, 10);
                                    if (imgurl02.size() > 0) {
                                        out.println("<img src=\""+imgurl02.get(0)+"\" width=\"304\" height=\"220\">");
                                    } else {
                                        out.println("<img src=\"\" alt=\"\">");
                                    }
                                %>
                            </div>
                            <div class="text">
                                <%
                                    String txt02 = list0.get(9).getNewsTitle().length()>=30?
                                            list0.get(9).getNewsTitle().substring(0, 29)+"...":
                                            list0.get(9).getNewsTitle();
                                    int nid02 = list0.get(9).getNewsId();
                                    out.println("<a href=\"detailText.jsp?ntype=0&nid="+nid02+"\"><p>"+txt02+"</p>");
                                    out.println("<br>");
                                    out.println("<p>"+list0.get(9).getPubDate()+"</p></a>");
                                %>
                            </div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 栏目块通知 -->
        <div class="boxes">
            <!-- 教务通知 -->
            <div class="jiaowutongzhi">
                <div class="title">
                    <div class="left">
                        <h3>教务通知</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=1" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list1 = NewsDao.getNewsInfo(1);
                        for (int i = 0; i < 7; i++) {
                            String txt = list1.get(i).getNewsTitle().length()>=30?
                                    list1.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list1.get(i).getNewsTitle();
                            int nid = list1.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=1&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
            <!-- 通知公告 -->
            <div class="tongzhigonggao">
                <div class="title">
                    <div class="left">
                        <h3>通知公告</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=2" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list2 = NewsDao.getNewsInfo(2);
                        for (int i = 0; i < 7; i++) {
                            String txt = list2.get(i).getNewsTitle().length()>=30?
                                    list2.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list2.get(i).getNewsTitle();
                            int nid = list2.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=2&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
            <!-- 研究生教学 -->
            <div class="yanjiusheng">
                <div class="title">
                    <div class="left">
                        <h3>研究生教学</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=3" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list3 = NewsDao.getNewsInfo(3);
                        for (int i = 0; i < 7; i++) {
                            String txt = list3.get(i).getNewsTitle().length()>=30?
                                    list3.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list3.get(i).getNewsTitle();
                            int nid = list3.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=3&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
            <!-- 学术讲座 -->
            <div class="jiangzuo">
                <div class="title">
                    <div class="left">
                        <h3>学术讲座</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=4" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list4 = NewsDao.getNewsInfo(4);
                        for (int i = 0; i < 7; i++) {
                            String txt = list4.get(i).getNewsTitle().length()>=30?
                                    list4.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list4.get(i).getNewsTitle();
                            int nid = list4.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=4&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
            <!-- 学生工作 -->
            <div class="xueshenggongzuo">
                <div class="title">
                    <div class="left">
                        <h3>学生工作</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=5" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list5 = NewsDao.getNewsInfo(5);
                        for (int i = 0; i < 7; i++) {
                            String txt = list5.get(i).getNewsTitle().length()>=30?
                                    list5.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list5.get(i).getNewsTitle();
                            int nid = list5.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=5&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
            <!-- 招聘信息 -->
            <div class="zhaopin">
                <div class="title">
                    <div class="left">
                        <h3>招聘信息</h3>
                    </div>
                    <div class="right">
                        <a href="searchAll.jsp?value=6" class="more"><span>查看全部&nbsp;&nbsp;></span></a>
                    </div>
                </div>
                <div class="bd">
                    <ul>
                    <%
                        List<News> list6 = NewsDao.getNewsInfo(6);
                        for (int i = 0; i < 7; i++) {
                            String txt = list6.get(i).getNewsTitle().length()>=30?
                                    list6.get(i).getNewsTitle().substring(0, 29)+"...":
                                    list6.get(i).getNewsTitle();
                            int nid = list6.get(i).getNewsId();
                            out.println("<li><a href=\"detailText.jsp?ntype=6&nid="+nid+"\"><span>" +txt+ "</span></a></li>");
                        }
                    %>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 快速导航 -->
        <div class="nav">
            <ul>
                <li><p>快速导航&nbsp;:</p></li>
                <li><a href="#"><p>系部简介&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>实验中心&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>思政重点改革领航学院&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>工程认证&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>人工智能现代产业学院&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>常用下载&nbsp;&nbsp;/</p></a></li>
                <li><a href="#"><p>毕业设计&nbsp;&nbsp;</p></a></li>
            </ul>
        </div>
    </body>
    <script>
        let circle = document.querySelector(`.banner .circle`);
        let index = 0;
        setInterval(function (){
            for (let i = 0; i < 3; i++) {
                circle.children[i].className = '';
            }
            circle.children[index].className = 'active';
            const img = document.getElementById('lunBo_pics');
            if (index === 1) img.src = <%="\""+url01+"\""%>;
            else if (index ===2) img.src = <%="\""+url02+"\""%>;
            else img.src = <%="\""+url03+"\""%>;
            index++;
            if(index === 3){
                index = 0;
            }
        }, 1500);
    </script>
</html>
<%@ include file="bottom.jsp"%>

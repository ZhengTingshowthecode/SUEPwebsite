package DAO;

import Entity.News;
import Util.SqlHelper;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NewsDao {
    // 得到某一类型的所有通知、新闻
    // 0：学院新闻
    // 1：教务通知   2：通知公告    3：研究生教学
    // 4：学术讲座   5：学生工作    6：招聘信息
    public static List<News> getNewsInfo(int type) {
        List<News> ulist = new ArrayList<>();
        try {
            // 按照最新发布到旧发布的顺序排列
            String sql = "select * from news"+type+"  order by pubDate desc;";
            ResultSet rs = SqlHelper.executeQueryParams(sql);
            while (rs.next()) {
                int newsId = rs.getInt(1);
                String newsTitle = rs.getString(2);
                String newsContent = rs.getString(3);
                String pubPerson = rs.getString(4);
                String pubDate = rs.getString(5);
                News news = new News(newsId, newsTitle, newsContent, pubPerson, pubDate);
                ulist.add(news);
            }
            SqlHelper.closeConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    // 根据nid得到新闻全文内容
    public static List<News> getNewsInfo02(int type, int nid) {
        List<News> ulist = new ArrayList<>();
        try {
            String sql = "select * from news"+type+"  where newsId=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, nid);
            while (rs.next()) {
                int newsId = rs.getInt(1);
                String newsTitle = rs.getString(2);
                String newsContent = rs.getString(3);
                String pubPerson = rs.getString(4);
                String pubDate = rs.getString(5);
                News news = new News(newsId, newsTitle, newsContent, pubPerson, pubDate);
                ulist.add(news);
            }
            SqlHelper.closeConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    public static int deleteNews(int type, int nid) {
        int r = 0;
        String sql="";
        try {
            sql = "delete from news"+type+"   where newsId=?";
            r = SqlHelper.executeUpdateParams(sql, nid);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    public static int publishNews(News news, int type) {
        int r = 0;
        String sql="";
        try {
            sql = "insert into news"+type+"(newsTitle, newsContent, pubPerson, pubDate) values(?,?,?,?)";
            r = SqlHelper.executeUpdateParams(sql, news.getNewsTitle(),news.getNewsContent(),
                    news.getPubPerson(), news.getPubDate());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    public static int getNewsId(int type, String newsTitle, String pubDate) {
        int resID = -1;
        try {
            String sql = "select * from news" + type + "  where newsTitle=? and pubDate=?";
            ResultSet rs = SqlHelper.executeQueryParams(sql, newsTitle, pubDate);
            while(rs.next()) {
                resID = rs.getInt(1);
            }
            SqlHelper.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resID;
    }
    public static int saveImgs(List<String> list, int type, String newsTitle, String pubDate) {
        int newsId = getNewsId(type, newsTitle, pubDate);
        int r = 0;
        String sql="";
        try {
            int index = 0;
            while (index < list.size()) {
                sql = "insert into news"+type+"Img(newsId, ImgUrl) values(?,?)";
                r = SqlHelper.executeUpdateParams(sql, newsId, list.get(index));
                index++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    // 获取某新闻的图片
    public static List<String> getImg(int type, int index) {
        List<String> imglist = new ArrayList<>();
        try {
            // 按照最新发布到旧发布的顺序排列
            String sql = "select * from news"+type+"img  where newsId=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, index);
            while (rs.next()) {
                String url = rs.getString(2);
                imglist.add(url);
            }
            SqlHelper.closeConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return imglist;
    }
    public static int saveFuJian(List<String> list, int type, String newsTitle, String pubDate) {
        int newsId = getNewsId(type, newsTitle, pubDate);
        int r = 0;
        String sql="";
        try {
            int index = 0;
            while (index < list.size()) {
                sql = "insert into news"+type+"FuJian(newsId, FJurl) values(?,?)";
                r = SqlHelper.executeUpdateParams(sql, newsId, list.get(index));
                index++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    public static List<String> getfujian(int type, int id) {
        List<String> fjlist = new ArrayList<>();
        try {
            // 按照最新发布到旧发布的顺序排列
            String sql = "select * from news"+type+"fujian  where newsId=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, id);
            while (rs.next()) {
                String url = rs.getString(2);
                fjlist.add(url);
            }
            SqlHelper.closeConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return fjlist;
    }
    public static int saveBanner(List<String> list) {
        int r = 0;
        String sql="";
        try {
            int index = 0;
            while (index < list.size()) {
                sql = "insert into banners(url) values(?)";
                r = SqlHelper.executeUpdateParams(sql, list.get(index));
                index++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    // 获取banner图片
    public static List<String> getBanner() {
        List<String> bannerList = new ArrayList<>();
        try {
            // 按照最新发布到旧发布的顺序排列
            String sql = "select * from banners order by id desc;";
            ResultSet rs = SqlHelper.executeQueryParams(sql);
            while (rs.next()) {
                String url = rs.getString(2);
                bannerList.add(url);
            }
            SqlHelper.closeConnection();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return bannerList;
    }
}

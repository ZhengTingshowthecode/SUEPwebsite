package DAO;

import Entity.User;
import Util.SqlHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    // 登录检测
    public static List<User> checkUser(String id, String pwd) {
        List<User> ulist = new ArrayList<>();
        try {
            String sql = "select * from user where id=? and pwd=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, id, pwd);
            while(rs.next()) {
                String uid = rs.getString(1);
                String uname = rs.getString(2);
                String upwd = rs.getString(3);
                int utype = rs.getInt(4);
                User user = new User(uid, uname, upwd, utype);
                ulist.add(user);
            }
            SqlHelper.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    // 根据id查用户权限
    public static List<User> checkUserbyID(String id) {
        List<User> ulist = new ArrayList<>();
        try {
            String sql = "select * from user where id=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, id);
            while(rs.next()) {
                String uid = rs.getString(1);
                String uname = rs.getString(2);
                String upwd = rs.getString(3);
                int utype = rs.getInt(4);
                User user = new User(uid, uname, upwd, utype);
                ulist.add(user);
            }
            SqlHelper.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    public static List<User> showUserInfo() {
        List<User> ulist = new ArrayList<>();
        try {
            String sql = "select * from user;";
            ResultSet rs = SqlHelper.executeQueryParams(sql);
            while(rs.next()) {
                String uid = rs.getString(1);
                String uname = rs.getString(2);
                String upwd = rs.getString(3);
                int utype = rs.getInt(4);
                User user = new User(uid, uname, upwd, utype);
                ulist.add(user);
            }
            SqlHelper.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    public static List<User> showUserInfo02(String id) {
        List<User> ulist = new ArrayList<>();
        try {
            String sql = "select * from user where id=?;";
            ResultSet rs = SqlHelper.executeQueryParams(sql, id);
            while(rs.next()) {
                String uid = rs.getString(1);
                String uname = rs.getString(2);
                String upwd = rs.getString(3);
                int utype = rs.getInt(4);
                User user = new User(uid, uname, upwd, utype);
                ulist.add(user);
            }
            SqlHelper.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ulist;
    }
    // 删除
    public static int deleteUser(String uid) {
        int r = 0;
        String sql="";
        try {
            sql = "delete from user where id=?";
            r = SqlHelper.executeUpdateParams(sql, uid);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
    // 修改
    public static int updateUser(String id, String name, String pwd, int type) {
        int r = 0;
        String sql="";
        try {
            sql = "update user set name=? , pwd=? , type=?  where id=?";
            r = SqlHelper.executeUpdateParams(sql, name, pwd, type, id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return r;
    }
}
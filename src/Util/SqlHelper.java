package Util;

import java.sql.*;
public class SqlHelper {
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/suepwebsite";
    private static String dbUser = "root", dbPwd ="123456";
    private static Connection conn = null;
    static {
        try {
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 关闭数据库连接
    public static void closeConnection() {
        try {
            if(conn!=null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 查询
    public static ResultSet executeQueryParams(String sql, Object... params) {
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(url, dbUser, dbPwd);
            PreparedStatement cmd = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                if (params[i] instanceof String) {
                    cmd.setString(i+1, params[i].toString());
                } else if (params[i] instanceof Integer) {
                    cmd.setInt(i+1, Integer.parseInt(params[i].toString()));
                } else if (params[i] instanceof Double) {
                    cmd.setDouble(i+1, Double.parseDouble(params[i].toString()));
                } else if (params[i] instanceof Float) {
                    cmd.setFloat(i+1, Float.parseFloat(params[i].toString()));
                } else {
                    cmd.setObject(i+1, params[i]);
                }
            }
            rs = cmd.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    // 增删改
    public static int executeUpdateParams(String sql, Object... params) {
        int r = 0;
        try {
            conn = DriverManager.getConnection(url, dbUser, dbPwd);
            PreparedStatement cmd = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                if (params[i] instanceof String) {
                    cmd.setString(i+1, params[i].toString());
                } else if (params[i] instanceof Integer) {
                    cmd.setInt(i+1, Integer.parseInt(params[i].toString()));
                } else if (params[i] instanceof Double) {
                    cmd.setDouble(i+1, Double.parseDouble(params[i].toString()));
                } else if (params[i] instanceof Float) {
                    cmd.setFloat(i+1, Float.parseFloat(params[i].toString()));
                } else {
                    cmd.setObject(i+1, params[i]);
                }
            }
            r = cmd.executeUpdate();
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return r;
    }
}

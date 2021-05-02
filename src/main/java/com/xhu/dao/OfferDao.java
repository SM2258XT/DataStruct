package com.xhu.dao;

import com.xhu.datastruct.MyLinkedList;
import com.xhu.datastruct.MyList;
import com.xhu.domain.Offer;
import com.xhu.domain.Staff;
import com.xhu.utils.DBUtils;

import java.sql.*;

public class OfferDao {
    private static final String BASE_NAME = "hr";
    private static final String TABLE_NAME = "offer";
    private static final String USER = "root";
    private static final String PWD = "zhang";

    protected Connection con = null;
    protected Statement stat = null;
    protected ResultSet res = null;

    public OfferDao(){
        Connection con = DBUtils.getConnection(BASE_NAME,USER,PWD);
    }

    public boolean insert(Offer offer) {
        /*
            插入一条招聘记录
         */
        try {
            PreparedStatement ps = con.prepareStatement("insert into " + TABLE_NAME + " values(?,?,?)");
            ps.setString(1, offer.getJob());
            ps.setInt(2, offer.getTotal());
            ps.setInt(3, offer.getNeeds());
            int k = ps.executeUpdate();
            ps.close();
            return k > 0;
        } catch (SQLException throwable) {
            System.out.println("JDBC:" + TABLE_NAME + "：插入失败！");
        }
        return false;
    }

    public boolean delete(String id) {
        return false;
    }

    public MyList select(String sql) {
        try {
            stat = con.createStatement();
            res = stat.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：查询失败！");
            return null;
        }

        MyLinkedList list = new MyLinkedList();
        try {
            while (res.next()) {
                Staff staff = new Staff(
                        res.getInt(1),
                        res.getString(2),
                        res.getString(3),
                        res.getString(4),
                        res.getString(5),
                        res.getString(6),
                        res.getString(7));
                list.push(staff);
            }
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：结果为空！");
        }
        return list;
    }

    public MyList selectAll() {
        return select("select * from " + TABLE_NAME + ";");
    }

    public boolean clearTable() {
        try {
            stat = con.createStatement();
            String sql = "delete from " + TABLE_NAME + ";";
            int k = stat.executeUpdate(sql);
            return k > 0;
        } catch (SQLException e) {
            System.out.println("JDBC:" + TABLE_NAME + "：尝试清空失败");
            System.out.println(e.getMessage());
        }
        return false;
    }

    public void close() {
        DBUtils.close(con, stat, res);
    }


}

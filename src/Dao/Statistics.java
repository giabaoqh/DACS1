package Dao;

import Admin.AdminDashboard;
import Connection.MyConnection;
import Supplier.SupplierDashboard;
import User.UserDashboard;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Statistics {

    Connection con = MyConnection.getConnection();
    PreparedStatement ps;
    Statement st;
    ResultSet rs;

    private int total(String tableName) {
        int total = 0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select count(*) as 'total' from " + tableName + "");
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    private double totalSales() {
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select sum(total) as 'total' from purchase");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    private double todaySales() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date date = new Date();
        String today = df.format(date);
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select sum(total) as 'total' from purchase where p_date = '" + today + "'");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    private double totalPurchase(int id) {
        double total = 0.0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select sum(total) as 'total' from purchase where uid = " + id + "");
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    private int totalDeliveries(String name) {
        int total = 0;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select count(*) as 'total' from purchase where supplier =  '" + name + "' and status = 'Đã nhận'");
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Statistics.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
    
    //admin dashboard
    public void admin() {
        AdminDashboard.stCat.setText(String.valueOf(total("category")));
        AdminDashboard.stPro.setText(String.valueOf(total("product")));
        AdminDashboard.stUser.setText(String.valueOf(total("user")));
        AdminDashboard.stSupplier.setText(String.valueOf(total("supplier")));
        AdminDashboard.stSales.setText(String.valueOf(totalSales()));
        AdminDashboard.stTSales.setText(String.valueOf(todaySales()));
    }

    //user
    public void user(int id) {
        UserDashboard.stCat.setText(String.valueOf(total("category")));
        UserDashboard.stPro.setText(String.valueOf(total("product")));
        UserDashboard.stPur.setText(String.valueOf(totalPurchase(id)));
    }
    
    //supplier
    
    public void supplier(String name){
        SupplierDashboard.stDel.setText(String.valueOf(totalDeliveries(name)));
    }
}

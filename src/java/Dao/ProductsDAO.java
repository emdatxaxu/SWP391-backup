/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Category;
import Model.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author toanl
 */
public class ProductsDAO extends DBContext {

    public Statement stm; // thuc thi cac cau lenh sql
    public ResultSet rs; // luu tru va xu ly du lieu
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Products> getProducts() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Products> get3Newest() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product where status=1 order by id desc limit 0,3";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Products> getProductsbyCateID(int cateid) {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product where categoryid = " + cateid;
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public Products getProductsbyID(int productid) {
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product where id = " + productid;
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                return new Products(id, name, price, description, maker, status, inventory, categoryid);
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return null;
    }

    public ArrayList<Products> getFeaturedProducts() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "SELECT * FROM product\n"
                    + "WHERE (maker = \"apple\" OR maker = \"samsung\")\n"
                    + "AND categoryid != \"5\" and status=1";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from category";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String category = rs.getString(2);
                list.add(new Category(id, category));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<String> getDistinctMakers() {
        ArrayList<String> makersList = new ArrayList<>();
        try {
            stm = connection.createStatement();
            String sql = "select distinct maker from product";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                String maker = rs.getString(1);
                makersList.add(maker);
            }
        } catch (Exception e) {
            System.out.println("getDistinctMakers Error: " + e.getMessage());
        }
        return makersList;
    }

    public ArrayList<Products> getAllProduct(String search, String categories, String maker1, String minPrice, String maxPrice, String sort) {
        String whereSql = "where p.status=1";
        String sortSql = "";
        if (search != null) {
            whereSql = "where p.name like '%" + search + "%' and p.status=1;";
        }
        if (categories != null) {
            whereSql = "where c.id like '" + categories + "' and p.status=1;";
        }
        if (maker1 != null) {
            whereSql = "where p.name like '%" + maker1 + "%' and p.status=1;";
        }

        if (minPrice != null && maxPrice == null) {
            whereSql = "where (p.price-(p.price*10/100)) >= " + minPrice + "and p.status=1;";
        } else if (minPrice == null && maxPrice != null) {
            whereSql = "where (p.price-(p.price*10/100)) <= " + maxPrice + "and p.status=1;";
        } else if (minPrice != null && maxPrice != null) {
            whereSql = "where (p.price IS NOT NULL AND (p.price-(p.price*10/100)) BETWEEN " + minPrice + " AND " + maxPrice + ") and p.status=1";
        }
        if (sort != null) {
            sortSql = "order by p.price " + sort;
        }

        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select p.id,p.name,p.price,p.description,p.maker,p.status,p.inventory,c.id from product p  join category c on p.categoryid=c.id "
                    + whereSql + "\n" + sortSql + "\n";

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                String description = rs.getString(4);
                String maker = rs.getString(5);
                boolean status = rs.getBoolean(6);
                int inventory = rs.getInt(7);
                int categoryid = rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }

    public void updateStatusProduct(int price, int id, boolean status, int inventory, String description) {
        String sql = " update product set status = ?, price=?, inventory=?, description=? Where id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setBoolean(1, status);
            statement.setInt(2, price);
            statement.setInt(3, inventory);
            statement.setString(4, description);
            statement.setInt(5, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateInventoryProduct(int num, int id) {
        String sql = " update product set inventory=inventory-? Where id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteBook(int id) {
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "update image set productid = NULL where productid=" + id;
            stm.executeUpdate(sql);
            sql = "delete from specification where productid = " + id;
            stm.executeUpdate(sql);
            sql = "delete from feedback where productid = " + id;
            stm.executeUpdate(sql);
            sql = "delete from product where id = " + id;
            stm.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("del Error:" + e.getMessage());
        }
    }

    public int addProduct(String name, double price, String description, String maker, boolean status, int inventory, int categoryid) {
        int n = 0;
        try {
            stm = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "insert product ( name, price, description, maker,status, inventory, categoryid)"
                    + " values (N'" + name + "', N'" + price + "', N'" + description + "', N'" + maker + "', "
                    + (status ? 1 : 0) + ", " + inventory + ", " + categoryid + ")";
            n = stm.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println("add Error:" + e.getMessage());

        }
        return n;
    }

}

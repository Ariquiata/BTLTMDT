/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tmdt.web.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Saber
 */
public class OtherDAO {
    private Connection c;

    public OtherDAO() {
        c = new ConnectionDB().getCon();
    }
     public ArrayList<Category> getCategory(){
        String sql = "select * from category";
        ArrayList<Category> C = new ArrayList<Category>();
        try{ 
        PreparedStatement pst = c.prepareStatement(sql);
         ResultSet rs= pst.executeQuery();
         while(rs.next()){
             C.add(new Category(rs.getInt(1), rs.getString(2)));
         }
         return C;
        }catch(Exception e){
            return C;
        }
     }
     
     public String getUserTheSame(User u, product p){
         String sql ="";
         try{
             if(u==null){             
                 sql ="select o.user_email from  tmdt.order o inner join order_pro op on o.id = op.order_id and op.pro_id=? ";             
                 PreparedStatement pst = c.prepareCall(sql);
                 pst.setString(1, p.getId()+"");
                 ResultSet rs = pst.executeQuery();
                 String user ="";
                 if(rs.next()) user = rs.getString(1);
                 return user;
             } else{
                 sql ="select user_email from (select count(result2.id) as same,result2.user_email from\n" +
"( select p.id, p.name, p.link_image, p.description, p.price,p.discount ,p.amount\n" +
"from product p, tmdt.order o, order_pro op where\n" +
"o.user_email= ? and op.order_id = o.id and p.id = op.pro_id ) as result1 inner join\n" +
"( select p.id, p.name, p.link_image, p.description, p.price,p.discount ,p.amount,o.user_email\n" +
"from product p, tmdt.order o, order_pro op, (select o.user_email from  tmdt.order o inner join order_pro op on o.id = op.order_id and op.pro_id=? and o.user_email != ?)  as usersame where\n" +
"o.user_email= usersame.user_email and op.order_id = o.id and p.id = op.pro_id ) as result2 on result1.id = result2.id\n" +
"group by result2.user_email\n" +
"order by same DESC) as r limit 0,1";
                PreparedStatement pst = c.prepareCall(sql);
                pst.setString(1, u.getEmail());
                pst.setString(2, p.getId()+"");
                pst.setString(3, u.getEmail());
                 System.out.println(sql);
                ResultSet rs = pst.executeQuery();
                String user ="";
                if(rs.next()) user = rs.getString(1);
                return user;
             }
         } catch(Exception ex){
             return "";
         }
     }
     
     public boolean addProductToOrder(Cart C){
         PreparedStatement pst;
         ResultSet rs;
         try {            
            pst = c.prepareStatement("Select max(id) from tmdt.order;");
            rs=pst.executeQuery();
            int x=0;
            if(rs.next()) x =rs.getInt(1);
            for(Items i : C.getC()){
                pst = c.prepareStatement("insert into order_pro values (?,?,?)");
                pst.setString(1, x+"");
                pst.setString(2, i.getP().getId()+"");
                pst.setString(3, i.getN()+"");
                pst.execute();
            }
            return true;
            
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
     }
     
     public boolean addOrder(User u, Cart C){
         String sql = "insert into tmdt.order (total_price, user_email, status)values (?,?,'pending')";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, C.getTotalPrice()+"");
            pst.setString(2, u.getEmail());
            pst.execute();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
     }
     
     public boolean addReview(String rv, String id){
         String sql = "insert into review(name,pro_id) values (?,?)"  ;
         try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, rv);
            pst.setString(2, id);
            pst.execute();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
     }
     public boolean addRating(String rt, String id){
         String sql = "insert into rating(score,pro_id) values (?,?)"  ;
         try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, rt);
            pst.setString(2, id);
            pst.execute();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
     }
}

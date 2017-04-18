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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Saber
 */
public class ProductDAO {
    private Connection c;

    public ProductDAO() {
        c = new ConnectionDB().getCon();
    }
    
    @SuppressWarnings("null")
    public ArrayList<product> getSaleProduct(){
        String sql = "Select * from product where discount > 0 limit 0,8";
        ArrayList<product> A = new ArrayList<product>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("link_image"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setRating(getRating(p.getId()+""));
                A.add(p);
            }
            return A;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return A;
            //
        }
    }
    
    private ArrayList<Attribute> getAtrri(String id){
        String sql = "Select a.name as n, av.attri_value as v from  attribute a,attribute_value av, attri_pro ap  where \n" +
                        " ap.id_pro = ? and ap.id_attri_value = av.id and av.attri_id = a.id";
        ArrayList<Attribute> A = new ArrayList<Attribute>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Attribute a = new Attribute(rs.getString("n"),rs.getString("v"));
                A.add(a);
            }
            return A;
        } catch (SQLException ex) {
            return A;
            //Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    private ArrayList<Review> getReivew(String id){
        String sql = "Select id, name from review where pro_id=?";
        ArrayList<Review> A = new ArrayList<Review>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Review a = new Review(rs.getInt("id"),rs.getString("name"));
                A.add(a);
            }
            return A;
        } catch (SQLException ex) {
            return A;
            //Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    private ArrayList<Rating> getRating(String id){
        String sql = "Select id, score from rating where pro_id=?";
        ArrayList<Rating> A = new ArrayList<Rating>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Rating a = new Rating(rs.getInt("id"),rs.getInt("score"));
                A.add(a);
            }
            return A;
        } catch (SQLException ex) {
            return A;
            //Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public product getProductToCart(String id){
        String sql = "Select * from product where id=?";
        try{
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            product p = new product();
            if(rs.next()){
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setImageUrl(rs.getString("link_image"));
            p.setDescription(rs.getString("description"));
            p.setPrice(rs.getFloat("price"));
            p.setDiscount(rs.getFloat("discount"));
            p.setAmount(rs.getInt("amount"));
            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return new product();
        }
        
        
    }
    
    public product getProduct(String id){
        String sql = "Select * from product where id = ?";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            product p = new product();
            if(rs.next()){
                
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("link_image"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setAmount(rs.getInt("amount"));
                p.setAtt(getAtrri(id));
                p.setReview(getReivew(id));
                p.setRating(getRating(id));
            }
            return p;
        }catch(Exception e){
                 return null;
            }
        
    }
    
    public ArrayList<product> SearchProduct(String name,String description, String age, String catId, String orderBy, int offset, int steps){
        if(name.length()!=0) name = "'%"+name+"%' ";
        else name= "'%%'";
        String sql = "Select p.id, p.name, p.link_image, p.description, p.price,p.discount, avg(score) as score  from product p, attri_pro ap, attribute a, attribute_value av\n" +
",rating r where p.id= r.pro_id and ";
        if(description.length()!=0) sql+=(" (p.name like "+name+" or p.description like "+name+")");
        else sql+="p.name like "+name+" ";
        
        if (catId.length()!=0) sql+=" and p.cat_id='"+catId+"' ";
        if(age.length()!=0) sql += " and p.id = ap.id_pro and ap.id_attri_value = av.id  and av.attri_id ='1' "+age;
        sql+= " group by p.id";
        if(orderBy.length()!=0) sql += " order by "+orderBy;
        sql += " limit "+offset+","+steps;
        System.out.println(sql);
        ArrayList<product> A = new ArrayList<product>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("link_image"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setRating(getRating(p.getId()+""));
                A.add(p);
            }
            return A;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return A;
            //
        }
        }
    
    public int getRowCount(String name,String description, String age, String catId, String orderBy){

        if(name!=null) name = "'%"+name+"%' ";
        else name= "'%%'";
        String sql = "Select count(*) as c from (select p.id from product p, attri_pro ap, attribute a, attribute_value av\n" +
"where ";
        if(description.length()!=0) sql+=(" (p.name like "+name+" or p.description like "+name+")");
        else sql+="p.name like "+name;
        if (catId.length()!=0) sql+=" and p.cat_id='"+catId+"' ";
        if(age.length()!=0) sql += " and p.id = ap.id_pro and ap.id_attri_value = av.id  and av.attri_id ='1' "+age;
        sql+= " group by p.id ) as result ";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            int count=0;
            if(rs.next()) count = rs.getInt("c");
            return count;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
            //
        }
    }
    
    public ArrayList<product> getReccomendProduct(User u,String user, product pr){
        String sql="";
        if(u==null){
       sql ="select result.id, result.name, result.link_image, result.description, result.price,result.discount ,result.amount, count(id) as c  from order_pro,\n" +
"(select p.id, p.name, p.link_image, p.description, p.price,p.discount ,p.amount\n" +
"from product p, tmdt.order o, order_pro op where\n" +
"o.user_email= ? and op.order_id = o.id and p.id = op.pro_id and p.id!= ?) as result\n" +
"where order_pro.pro_id = result.id\n" +
"group by result.id\n" +
"order by c DESC limit 0,4";
        } else {
            sql = "select * from\n" +
"(select result.id, result.name, result.link_image, result.description, result.price,result.discount ,result.amount, count(id) as c  from order_pro,\n" +
"(select p.id, p.name, p.link_image, p.description, p.price,p.discount ,p.amount\n" +
"from product p, tmdt.order o, order_pro op where\n" +
"o.user_email= ? and op.order_id = o.id and p.id = op.pro_id and p.id!=? ) as result\n" +
"where order_pro.pro_id = result.id \n" +
"group by result.id) as a left join (select p.id as di  from product p, tmdt.order o, order_pro op where o.user_email=? and op.order_id = o.id and p.id = op.pro_id )as sub on a.id = sub.di\n" +
"where sub.di is null\n" +
"order by c DESC limit 0,4";
        }
        ArrayList<product> A = new ArrayList<product>();
        try {
            System.out.println(sql);
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pr.getId()+"");
            if(u!=null) pst.setString(3,u.getEmail());
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("link_image"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setRating(getRating(p.getId()+""));
                A.add(p);
            }
            return A;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return A;
            //
        }    
    }
    
    public ArrayList<product> getProductByCategory(String id, int offset, int step){
        String sql = "Select * from product where cat_id = ? limit "+offset+","+step;
        ArrayList<product> A = new ArrayList<product>();
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("link_image"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setDiscount(rs.getFloat("discount"));
                p.setRating(getRating(p.getId()+""));
                A.add(p);
            }
            return A;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return A;
            //
        }
    }
    
    public int getNumProductByCategory(String id){
        String sql = "Select count(*) from product where cat_id = ?";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            int count =0;
            if(rs.next()){
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
}

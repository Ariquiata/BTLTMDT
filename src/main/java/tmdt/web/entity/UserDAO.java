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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Saber
 */
public class UserDAO {
    private Connection c;
    
    public UserDAO(){
        c = new ConnectionDB().getCon();
    }
    
    public boolean checkLogin(String email, String password){
         String sql = "Select count(*) as dem from user where email =? and password =?";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            rs.next();
            if(rs.getInt("dem")==1) return true;
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public String addUser(User u){
        String sql = "Insert into user(first_name,last_name,email,password,telephone,address,city,role) values(?,?,?,?,?,?,?,'1')";
        try {
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, u.getFirstName());
            pst.setString(2, u.getLastName());
            pst.setString(3, u.getEmail());
            pst.setString(4,u.getPassword());
            pst.setString(5, u.getTelephone());
            pst.setString(6, u.getAddress());
            pst.setString(7, u.getCity());
            pst.executeUpdate();
            return "success";
        } catch (SQLException ex) {
            if(ex.getMessage().contains("PRIMARY")) return "key";
            return "unique";
        }
    }
    
    public User getUser(String email){
        String sql = "select * from user where email=?";
        try {
            PreparedStatement pst =c.prepareCall(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            User u = new User();
            while (rs.next()){
                u.setFirstName(rs.getString("first_name"));
                u.setPassword(rs.getString("password"));
                u.setLastName(rs.getString("last_name"));
                u.setTelephone(rs.getString("telephone"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setCity(rs.getString("city"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }}
        
      
}

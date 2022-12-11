/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import entity.Account;
import entity.Account1;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duan1
 */
public class UserDAOIplm implements UserDAO{
 public static void main(String[] args) {
        UserDAOIplm dao = new UserDAOIplm();
        User user = dao.getUserByID(12);
        System.out.println(user);
        //dao.UpdateUserbyId(new User(12, "Nguyen ","Duan", "0123456789", "Nam Dinh", "avata", true));
    }
    @Override
    public User getUserByID(int Id) {
       User user = null ;
      
        try {
            
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT [user_id]\n" +
"      ,[first_name]\n" +
"      ,[last_name]\n" +
"      ,[phone]\n" +
"      ,[address]\n" +
"      ,[avatar]\n" +
"      ,[sex]\n" +
"      ,[acc_id]\n" +
"  FROM [ChildrenCare].[dbo].[User] Where [user_id] = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Id);
            ResultSet rs= ps.executeQuery();
            
           if(rs.next()){
                Account account = new Account(rs.getInt(1));
              
               user= new User(rs.getInt(1),account,rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5),rs.getString(6),rs.getBoolean(7));
           }
            
            
            
        
        } catch (Exception ex) {
            Logger.getLogger(UserDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }  
   

    @Override
    public boolean UpdateUserbyId(User user) {
        boolean flag=false;
     try {
         Connection conn = new DBContext().getConnection();
         String sql = "UPDATE [dbo].[User]\n" +
"   SET [first_name] = ?\n" +
"      ,[last_name] = ?\n" +
"      ,[phone] = ?\n" +
"      ,[address] = ?\n" +
"      ,[avatar] =?\n" +
"      ,[sex] = ?\n" +
"      \n" +
" WHERE   [user_id] = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         
         ps.setString(1, user.getFirstName());
         ps.setString(2, user.getLastName());
         ps.setString(3, user.getPhone());
         ps.setString(4, user.getAddress());
         ps.setString(5, user.getAvatar());
         ps.setBoolean(6, user.isSex());
         ps.setInt(7, user.getId());
            
           
          
         flag=ps.executeUpdate()>0;
         
     } catch (Exception ex) {
         Logger.getLogger(UserDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
     }
     return flag;
        
    }
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Feedback;
import entity.FeedbackReply;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duan1
 */
public class FeebackRepplydaunDAOIpl  implements FeebackRepplyduanDAO{
    public static void main(String[] args) {
        FeebackRepplyduanDAO dao= new FeebackRepplydaunDAOIpl();
        System.out.println(dao.getafeedllbyid(12));
    }
    @Override
    public List<FeedbackReply> getafeedllbyid(int id) {
        List<FeedbackReply> feed = new ArrayList<>();
        try {
            
            Connection con = new DBContext().getConnection();
            String sql = "  Select f.fb_id,f.fb_content,f.fb_time,r.reply_id,r.reply_content,r.reply_time from Feedback f,FeedbackReply r where f.fb_id =r.fb_id and f.[user_id] = ?";
           
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                feed.add(new FeedbackReply(rs.getInt(4), new Feedback(rs.getInt(1),rs.getString(2) ,rs.getTimestamp(3), null, null), null,rs.getString(5), rs.getTimestamp(6)));
            }
        } catch (Exception ex) {
            Logger.getLogger(FeebackRepplydaunDAOIpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feed;
    }
    
}

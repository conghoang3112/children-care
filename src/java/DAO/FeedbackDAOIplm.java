/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Feedback;

import entity.Reservationduan;

import entity.User;
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
public class FeedbackDAOIplm implements FeedbackDAO {

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAOIplm();

        System.out.println(dao.getallFeednoReplyy(12));
    }

    @Override
    public boolean addFeedback(Feedback fe) {
        boolean flag = false;
        try {
            Connection con = new DBContext().getConnection();
            String sql = "Insert into Feedback  values(?,(SELECT SYSDATETIME()),?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fe.getContent());
            ps.setInt(2, fe.getReservation().getId());
            ps.setInt(3, fe.getUser().getId());

            flag = ps.executeUpdate() > 0;

        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;

    }

    @Override
    public List<Feedback> getallFeednoReplyy(int id) {
        List<Feedback> feed = new ArrayList<>();
        try {
            Connection con = new DBContext().getConnection();
            String sql = "  select f.fb_id,f.fb_content,f.fb_time from Feedback f  where f.fb_id not in (select fb_id from FeedbackReply ) and f.[user_id] =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                feed.add(new Feedback(rs.getInt(1), rs.getString(2), rs.getTimestamp(3), null, new User(id)));

            }

        } catch (Exception ex) {
            Logger.getLogger(FeedbackDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feed;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Feedback;
import java.util.List;

/**
 *
 * @author duan1
 */
public interface FeedbackDAO {
     boolean addFeedback(Feedback fe);
     List<Feedback> getallFeednoReplyy( int id);
    
}

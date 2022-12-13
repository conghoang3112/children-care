/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Reservation;
import entity.Reservationduan;

/**
 *
 * @author duan1
 */
public interface DuanReservationDAO {
    Reservationduan getReservationDetail(int uid,int rid);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Reservation;

/**
 *
 * @author duan1
 */
public interface DuanReservationDAO {
    Reservation getReservationDetail(int uid,int rid);
}

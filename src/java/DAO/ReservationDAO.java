/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Reservation;
import java.util.List;

/**
 *
 * @author duan1
 */
public interface ReservationDAO {
    public boolean  addReservation(Reservation res);
    public List<Reservation> getALlReservationbyUid(int UserId);
     public List<Reservation> getListViewReservationbyUid(int UserId);
    public Reservation getResReservationbyId(int ReId);
    public List<Reservation> getAllRes();
}

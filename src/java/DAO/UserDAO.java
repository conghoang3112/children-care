/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.User;

/**
 *
 * @author duan1
 */
public interface UserDAO {
    public User getUserByID(int Id);
    public boolean UpdateUserbyId(User user);
}

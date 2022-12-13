/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class TimeSlot {

    private int id;
    private String slotTime;

    public TimeSlot() {
    }

    public TimeSlot(int id) {
        this.id = id;
    }

    public TimeSlot(int id, String slotTime) {
        this.id = id;
        this.slotTime = slotTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
    }

    @Override
    public String toString() {
        return "TimeSlot{" + "id=" + id + ", slotTime=" + slotTime + '}';
    }

}

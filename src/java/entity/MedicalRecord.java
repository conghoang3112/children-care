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
public class MedicalRecord {

    private int id;
    private int reservation;
    private String dieaseName;
    private String prescription;
    private String recordNote;

    public MedicalRecord() {
    }

    public MedicalRecord(int id, int reservation, String dieaseName, String prescription, String recordNote) {
        this.id = id;
        this.reservation = reservation;
        this.dieaseName = dieaseName;
        this.prescription = prescription;
        this.recordNote = recordNote;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReservation() {
        return reservation;
    }

    public void setReservation(int reservation) {
        this.reservation = reservation;
    }

    public String getDieaseName() {
        return dieaseName;
    }

    public void setDieaseName(String dieaseName) {
        this.dieaseName = dieaseName;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public String getRecordNote() {
        return recordNote;
    }

    public void setRecordNote(String recordNote) {
        this.recordNote = recordNote;
    }

   

}

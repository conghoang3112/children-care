/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author duan1
 */
public class Docter1 {
    private int docId;
    private Account accountId;
    private Specialist specialistId;
    private int profileId;
    private  int romId;

    public Docter1() {
    }

    public Docter1(int docId, Account accountId, Specialist specialistId, int profileId, int romId) {
        this.docId = docId;
        this.accountId = accountId;
        this.specialistId = specialistId;
        this.profileId = profileId;
        this.romId = romId;
    }

    public int getDocId() {
        return docId;
    }

    public void setDocId(int docId) {
        this.docId = docId;
    }

    public Account getAccountId() {
        return accountId;
    }

    public void setAccountId(Account accountId) {
        this.accountId = accountId;
    }

    public Specialist getSpecialistId() {
        return specialistId;
    }

    public void setSpecialistId(Specialist specialistId) {
        this.specialistId = specialistId;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public int getRomId() {
        return romId;
    }

    public void setRomId(int romId) {
        this.romId = romId;
    }

    @Override
    public String toString() {
        return "Docter1{" + "docId=" + docId + ", accountId=" + accountId + ", specialistId=" + specialistId + ", profileId=" + profileId + ", romId=" + romId + '}';
    }
    
    
}

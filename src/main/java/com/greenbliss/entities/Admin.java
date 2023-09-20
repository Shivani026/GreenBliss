
package com.greenbliss.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Admin {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10)
    private int aid;
    @Column(length = 20)
    private String aname;
    @Column(length = 20)
    private String apass;
    @Column(length = 20)
    private String amail;
    @Column(length = 10)
    private String amob;

    public Admin(int aid, String aname, String apass, String amail, String amob) {
        this.aid = aid;
        this.aname = aname;
        this.apass = apass;
        this.amail = amail;
        this.amob = amob;
    }

    public Admin(String aname, String apass, String amail, String amob) {
        this.aname = aname;
        this.apass = apass;
        this.amail = amail;
        this.amob = amob;
    }

    public Admin() {
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApass() {
        return apass;
    }

    public void setApass(String apass) {
        this.apass = apass;
    }

    public String getAmail() {
        return amail;
    }

    public void setAmail(String amail) {
        this.amail = amail;
    }

    public String getAmob() {
        return amob;
    }

    public void setAmob(String amob) {
        this.amob = amob;
    }

    @Override
    public String toString() {
        return "admin{" + "aid=" + aid + ", aname=" + aname + ", apass=" + apass + ", amail=" + amail + ", amob=" + amob + '}';
    }
    
    
}

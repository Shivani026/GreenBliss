package com.greenbliss.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10)
    private int cid;
    @Column(length = 30)
    private String cname;
    @Column(length = 40)
    private String cmail;
    @Column(length = 12)
    private String cpass;
    @Column(length = 12)
    private String cmob;
    @Column(length = 3000)
    private String cadd;

    public Customer(int cid, String cname, String cmail, String cpass, String cmob, String cadd) {
        this.cid = cid;
        this.cname = cname;
        this.cmail = cmail;
        this.cpass = cpass;
        this.cmob = cmob;
        this.cadd = cadd;
    }

    public Customer(String cname, String cmail, String cpass, String cmob, String cadd) {
        this.cname = cname;
        this.cmail = cmail;
        this.cpass = cpass;
        this.cmob = cmob;
        this.cadd = cadd;
    }

    public Customer() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getcmail() {
        return cmail;
    }

    public void setcmail(String cmail) {
        this.cmail = cmail;
    }

    public String getCpass() {
        return cpass;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public String getCmob() {
        return cmob;
    }

    public void setCmob(String cmob) {
        this.cmob = cmob;
    }

    public String getCadd() {
        return cadd;
    }

    public void setCadd(String cadd) {
        this.cadd = cadd;
    }

    @Override
    public String toString() {
        return "customer{" + "cid=" + cid + ", cname=" + cname + ", cmail=" + cmail + ", cpass=" + cpass + ", cmob=" + cmob + ", cadd=" + cadd + '}';
    }

    
    
    
}

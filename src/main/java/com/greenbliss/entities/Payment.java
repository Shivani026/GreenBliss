package com.greenbliss.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import org.springframework.web.servlet.ModelAndView;

@Entity
public class Payment {

    @Id
    String payid;
    int cid;
    int oid;
    int payamt;
    String paydate;
    String payStatus;

    public Payment() {
    }


    public Payment(String payid, int cid, int oid, int payamt, String paydate, String payStatus) {
        this.payid = payid;
        this.cid = cid;
        this.oid = oid;
        this.payamt = payamt;
        this.paydate = paydate;
        this.payStatus = payStatus;
    }

    public String getPayid() {
        return payid;
    }

    public void setPayid(String payid) {
        this.payid = payid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPayamt() {
        return payamt;
    }

    public void setPayamt(int payamt) {
        this.payamt = payamt;
    }

    public String getPaydate() {
        return paydate;
    }

    public void setPaydate(String paydate) {
        this.paydate = paydate;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

}

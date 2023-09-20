package com.greenbliss.entities;


import jakarta.persistence.*;

@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int oid;
    String oname;
    String omail;
    String oadd;
    String omob;
    @Column(columnDefinition = "LONGTEXT")
    String oprods;
    String odate;
    int ototalamt;
    String ostatus;
    int cid;


    public Orders() {
    }


    public Orders(String oname, String omail, String oadd, String omob, String oprods, String odate, int ototalamt, String ostatus, int cid) {

        this.oname = oname;
        this.omail = omail;
        this.oadd = oadd;
        this.omob = omob;
        this.oprods = oprods;
        this.odate = odate;
        this.ototalamt = ototalamt;
        this.ostatus = ostatus;
        this.cid = cid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getOmail() {
        return omail;
    }

    public void setOmail(String omail) {
        this.omail = omail;
    }

    public String getOadd() {
        return oadd;
    }

    public void setOadd(String oadd) {
        this.oadd = oadd;
    }

    public String getOmob() {
        return omob;
    }

    public void setOmob(String omob) {
        this.omob = omob;
    }

    public String getOprods() {
        return oprods;
    }

    public void setOprods(String oprods) {
        this.oprods = oprods;
    }

    public String getOdate() {
        return odate;
    }

    public void setOdate(String odate) {
        this.odate = odate;
    }

    public int getOtotalamt() {
        return ototalamt;
    }

    public void setOtotalamt(int ototalamt) {
        this.ototalamt = ototalamt;
    }


    public String getOstatus() {
        return ostatus;
    }

    public void setOstatus(String ostatus) {
        this.ostatus = ostatus;
    }


    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "oid=" + oid +
                ", oname='" + oname + '\'' +
                ", omail='" + omail + '\'' +
                ", oadd='" + oadd + '\'' +
                ", omob='" + omob + '\'' +
                ", oprods='" + oprods + '\'' +
                ", odate='" + odate + '\'' +
                ", ototalamt=" + ototalamt +
                ", ostatus='" + ostatus + '\'' +
                ", cid=" + cid +
                '}';
    }
}

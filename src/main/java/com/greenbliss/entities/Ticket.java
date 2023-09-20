package com.greenbliss.entities;

import jakarta.persistence.*;

@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int tid;
    String tsub;
    @Column(columnDefinition = "Text")
    String tcon;
    String tres;
    int cid;

    public Ticket() {
    }

    public Ticket(String tsub, String tcon, int cid) {
        this.tsub = tsub;
        this.tcon = tcon;
        this.cid = cid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int id) {
        this.tid = tid;
    }

    public String getTsub() {
        return tsub;
    }

    public void setTsub(String tsub) {
        this.tsub = tsub;
    }

    public String getTcon() {
        return tcon;
    }

    public void setTcon(String tcon) {
        this.tcon = tcon;
    }


    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTres() {
        return tres;
    }

    public void setTres(String tres) {
        this.tres = tres;
    }



    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + tid +
                ", tsub='" + tsub + '\'' +
                ", tcon='" + tcon + '\'' +
                '}';
    }
}

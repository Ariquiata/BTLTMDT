/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tmdt.web.entity;

import java.io.Serializable;

/**
 *
 * @author Saber
 */
public class Items implements Serializable{
    private product p;
    private int n;

    public Items(product p, int n) {
        this.p = p;
        this.n = n;
    }

    public Items() {
    }

    public product getP() {
        return p;
    }

    public void setP(product p) {
        this.p = p;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }
    public float getPrice(){
        return (float) p.getPriceAfterDiscount()*n;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tmdt.web.entity;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Saber
 */
public class Cart implements Serializable{
    private ArrayList<Items> c;

    public Cart() {
        c = new ArrayList<Items>();
    }

    public Cart(ArrayList<Items> c) {
        this.c = c;
    }

    public ArrayList<Items> getC() {
        return c;
    }

    public void setC(ArrayList<Items> c) {
        this.c = c;
    }
    public int getTotalItem(){
        return c.size();
    }
    public float getTotalPrice(){
        float total=0;
        for(Items i:c)
            total += i.getPrice();
        return total;
    }
}

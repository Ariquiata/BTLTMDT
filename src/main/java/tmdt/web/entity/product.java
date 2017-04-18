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
public class product implements Serializable{
    private int id;
    private String name;
    private String imageUrl;
    private String description;
    private float price;
    private float discount;
    private int amount;
    ArrayList<Attribute> att;
    ArrayList<Review> review;
    ArrayList<Rating> rating;

    public product() {
    }

    public product(int id, String name, String imageUrl, String description, float price, float discount, ArrayList<Attribute> att) {
        this.id = id;
        this.name = name;
        this.imageUrl = imageUrl;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.att = att;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public ArrayList<Attribute> getAtt() {
        return att;
    }

    public void setAtt(ArrayList<Attribute> att) {
        this.att = att;
    }
    
    public float getPriceAfterDiscount(){
        
        return price - (float) price*discount/100;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public ArrayList<Review> getReview() {
        return review;
    }

    public void setReview(ArrayList<Review> review) {
        this.review = review;
    }

    public ArrayList<Rating> getRating() {
        return rating;
    }

    public void setRating(ArrayList<Rating> rating) {
        this.rating = rating;
    }
    
    public int getTotalScore(){
        int sum =0;
        for(Rating i: rating) sum+=i.getScore();
        
        return (int) Math.floor((double) sum/rating.size());
    }
    
    public int getScore(){
        int sum =0;
        for(Rating i: rating) sum+=i.getScore();
        return sum;
    }
}

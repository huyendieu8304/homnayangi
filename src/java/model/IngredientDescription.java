/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BKC
 */
public class IngredientDescription {
    private int ingredientId;
    private String heading;
    private String content;

    public IngredientDescription() {
    }

    //constructor missing ingredient-id
    public IngredientDescription(String heading, String content) {
        this.heading = heading;
        this.content = content;
    }

      
    public IngredientDescription(int ingredientId, String heading, String content) {
        this.ingredientId = ingredientId;
        this.heading = heading;
        this.content = content;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}

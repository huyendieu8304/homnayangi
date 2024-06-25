/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Ingredient;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author BKC
 */
public class IngredientDAO extends DBContext {

    public int countIngredient(String keyword, String cateIdRaw,
            String subcateIdRaw, String priceFromRaw, String priceToRaw) {
        String sql = "SELECT COUNT(*) FROM [dbo].[Ingredient] WHERE 1 = 1";

        if (keyword != null && !keyword.equals("")) {
            sql += " AND [ingredient_name] LIKE '%" + keyword + "%'";
        }

        if (cateIdRaw != null) {
            try {
                int cateId = Integer.parseInt(cateIdRaw);
                sql += " AND [category_id] = " + cateId;
            } catch (Exception e) {
                System.out.println("Error while parsing categoryId");
            }

        }

        if (subcateIdRaw != null) {
            try {
                int subcateId = Integer.parseInt(subcateIdRaw);
                sql += " AND [subcategory_id] = " + subcateId;
            } catch (Exception e) {
                System.out.println("Error while parsing subcategoryId");
            }

        }

        if (priceFromRaw != null) {
            try {
                float priceFrom = Float.parseFloat(priceFromRaw);
                sql += " AND [price] >= " + priceFrom;
            } catch (Exception e) {
                System.out.println("Error while parsing price from");
            }

        }

        if (priceToRaw != null) {
            try {
                float priceTo = Float.parseFloat(priceToRaw);
                sql += " AND [price] <= " + priceTo;
            } catch (Exception e) {
                System.out.println("Error while parsing price to");
            }

        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); //get result from the first column
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve"
                    + " the number of ingredient's");
        }
        return 0;
    }

    public ArrayList<Ingredient> searchIngredient(String keyword, String cateIdRaw,
            String subcateIdRaw, String priceFromRaw, String priceToRaw,
            String indexRaw, int size) {
        ArrayList<Ingredient> list = new ArrayList<>();
        try {
            String sql = "WITH x AS "
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY [ingredient_id] ASC) AS r, * "
                    + "FROM [dbo].[Ingredient] WHERE 1 = 1 ";
            if (keyword != null && !keyword.equals("")) {
                sql += " AND [ingredient_name] LIKE '%" + keyword + "%'";
            }

            if (cateIdRaw != null) {
                try {
                    int cateId = Integer.parseInt(cateIdRaw);
                    sql += " AND [category_id] = " + cateId;
                } catch (Exception e) {
                    System.out.println("Error while parsing categoryId");
                }

            }

            if (subcateIdRaw != null) {
                try {
                    int subcateId = Integer.parseInt(subcateIdRaw);
                    sql += " AND [subcategory_id] = " + subcateId;
                } catch (Exception e) {
                    System.out.println("Error while parsing subcategoryId");
                }

            }

            if (priceFromRaw != null) {
                try {
                    float priceFrom = Float.parseFloat(priceFromRaw);
                    sql += " AND [price] >= " + priceFrom;
                } catch (Exception e) {
                    System.out.println("Error while parsing price from");
                }

            }

            if (priceToRaw != null) {
                try {
                    float priceTo = Float.parseFloat(priceToRaw);
                    sql += " AND [price] <= " + priceTo;
                } catch (Exception e) {
                    System.out.println("Error while parsing price to");
                }

            }

            int index;
            if (indexRaw != null) {
                    index = Integer.parseInt(indexRaw);
            } else {
                index = 1;
            }
            //BETWEEN (? * ? - (? - 1)) AND (? * ?)"
            // index * pagesize - (pagesize - 1) and (index * pagesize)
            sql += ") SELECT * FROM x WHERE r BETWEEN (? * ? - (? - 1)) AND (? * ?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, size);
            st.setInt(3, size);
            st.setInt(4, index);
            st.setInt(5, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit,
                        price, stockQuantity, imageUrl);
                list.add(i);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve"
                    + " ingredient's information by search");
        }

        return list;
    }

    //get all product in a same category
    public ArrayList<Ingredient> getAllIngredients() {
        ArrayList<Ingredient> list = new ArrayList<>();
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[ingredient_name]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[unit]\n"
                + "      ,[quantity_per_unit]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Ingredient]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit,
                        price, stockQuantity, imageUrl);
                list.add(i);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve"
                    + " ingredient's information by category id");
        }
        return list;
    }

    //get all product in a same category
    public ArrayList<Ingredient> getIngredientsByCategoryId(int catId) {
        ArrayList<Ingredient> list = new ArrayList<>();
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[ingredient_name]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[unit]\n"
                + "      ,[quantity_per_unit]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Ingredient] WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, catId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit,
                        price, stockQuantity, imageUrl);
                list.add(i);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve"
                    + " ingredient's information by category id");
        }
        return list;
    }

    //get n ingredient in the same category
    public ArrayList<Ingredient> getNIngredientsByCategoryId(int catId, int n) {
        ArrayList<Ingredient> list = new ArrayList<>();
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[ingredient_name]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[unit]\n"
                + "      ,[quantity_per_unit]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Ingredient] WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, catId);
            ResultSet rs = st.executeQuery();
            int c = 0;
            while (rs.next() && c < n) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit,
                        price, stockQuantity, imageUrl);
                list.add(i);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve "
                    + "ingredient's information by category id");
        }
        return list;
    }

    public Ingredient getIngredientById(int id) {
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[ingredient_name]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[unit]\n"
                + "      ,[quantity_per_unit]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Ingredient] WHERE ingredient_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit,
                        price, stockQuantity, imageUrl);
                return i;
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve ingredient's information");
        }

        return null;
    }

    public void addAnIngredient(Ingredient x) {
        String sql = "INSERT INTO [dbo].[Ingredient]\n"
                + "           ([ingredient_name]\n"
                + "           ,[category_id]\n"
                + "           ,[subcategory_id]\n"
                + "           ,[unit]\n"
                + "           ,[quantity_per_unit]\n"
                + "           ,[price]\n"
                + "           ,[stock_quantity]\n"
                + "           ,[image_url])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getIngredientName());
            st.setInt(2, x.getCategoryId());
            st.setInt(3, x.getSubcategoryId());
            st.setString(4, x.getUnit());
            st.setFloat(5, x.getQuantityPerUnit());
            st.setFloat(6, x.getPrice());
            st.setInt(7, x.getStockQuantity());
            st.setString(8, x.getImageUrl());

            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("Having error while add a new ingredient");
        }
    }

    public void updateAnIngredientById(int id, Ingredient x) {
        String sql = "UPDATE [dbo].[Ingredient]\n"
                + "   SET [ingredient_name] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[subcategory_id] = ?\n"
                + "      ,[unit] = ?\n"
                + "      ,[quantity_per_unit] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[stock_quantity] = ?\n"
                + "      ,[image_url] = ?\n"
                + " WHERE ingredient_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getIngredientName());
            st.setInt(2, x.getCategoryId());
            st.setInt(3, x.getSubcategoryId());
            st.setString(4, x.getUnit());
            st.setFloat(5, x.getQuantityPerUnit());
            st.setFloat(6, x.getPrice());
            st.setInt(7, x.getStockQuantity());
            st.setString(8, x.getImageUrl());
            st.setInt(9, x.getIngredientId());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("Having error while update an ingredient");
        }
    }

    //set status to not display to the customer;
    public void deleteAnIngredientById(int id) {
        String sql = "DELETE FROM [dbo].[Ingredient]\n"
                + "      WHERE ingredient_id = ?";
    }

}

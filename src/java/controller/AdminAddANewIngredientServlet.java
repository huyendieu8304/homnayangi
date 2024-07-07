/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.IngredientDAO;
import dal.IngredientDescriptionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import model.Category;
import model.Ingredient;
import model.IngredientDescription;

/**
 *
 * @author BKC
 */
@MultipartConfig

public class AdminAddANewIngredientServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddANewIngredientServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddANewIngredientServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get category 
        CategoryDAO catdb = new CategoryDAO();
        ArrayList<Category> catlist = catdb.getAllCategory();
        request.setAttribute("catlist", catlist);

        request.getRequestDispatcher("adminAddAnIngredient.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ingredientName = request.getParameter("ingredientName");
        String catIdRaw = request.getParameter("categoryId");
        String unit = request.getParameter("unit");
        String quantityPerUnitRaw = request.getParameter("quantityPerUnit");
        String priceRaw = request.getParameter("price");
        String stockQuantityRaw = request.getParameter("stockQuantity");

        try {
            int categoryId = Integer.parseInt(catIdRaw);
            float quantityPerUnit = Float.parseFloat(quantityPerUnitRaw);
            BigDecimal price = BigDecimal.valueOf(Double.parseDouble(priceRaw));
            int stockQuantity = Integer.parseInt(stockQuantityRaw);

            CategoryDAO catdb = new CategoryDAO();
            String categoryName = catdb.getCategoryNameById(categoryId); //handle image upload

            //get the path of the image
            Part file = request.getPart("image");

            //get image name
            String imageFileName = file.getSubmittedFileName();
            String imageURL = "image\\ingredientImage\\"
                    + imageFileName;
//            System.out.println(imageURL);
            //the path where actually the image saved
            String saveImagePath = "E:\\04 FA24\\PRJ301\\assignment\\MainFolder\\homnayangi\\web\\image\\ingredientImage\\"
                    + imageFileName;
            
            //create image in file
            try {
                FileOutputStream fos = new FileOutputStream(saveImagePath);
                InputStream is = file.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            //insert ingredient to database
            Ingredient i = new Ingredient(ingredientName, categoryId,
                    -1, unit, quantityPerUnit, price, stockQuantity, 
                    imageURL);
            
            IngredientDAO ingredientdb = new IngredientDAO();
            int result = ingredientdb.addAnIngredient(i);
            if (result == -1) {
                request.setAttribute("errorMessage", "Đã có lỗi xảy ra khi thêm sản phẩm vào database, mời thử lại sau");
                request.getRequestDispatcher("adminAddAnIngredient.jsp").forward(request, response);
            } else {
                //add ingredient description
                IngredientDescriptionDAO ingredientDesdb = new IngredientDescriptionDAO();
                int ingredientId = ingredientdb.getIngredientIdOfAddedIngredient();
                String[] heading = request.getParameterValues("heading");
                String[] content = request.getParameterValues("content");
                if (heading != null && content != null) {
                    for (int j = 0; j < heading.length; j++) {
                        System.out.println(heading[j]);
                        System.out.println(content[j]);
                        IngredientDescription ingredientDes = new IngredientDescription(ingredientId, heading[j], content[j]);
                        ingredientDesdb.addAnIngredientDescription(ingredientDes);
                    }
                }
                
                response.sendRedirect("ShowIngredient");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static String toLowerCaseNoSpacesOrDashes(String input) {
        if (input == null) {
            return null; // Handle null input if necessary
        }
        return input.toLowerCase().replaceAll("[\\s-]+", "");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

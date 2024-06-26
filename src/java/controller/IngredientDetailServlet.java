/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.IngredientDAO;
import dal.IngredientDescriptionDAO;
import dal.SubcategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;
import model.Ingredient;
import model.IngredientDescription;
import model.Subcategory;

/**
 *
 * @author BKC
 */
public class IngredientDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet IngredientDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IngredientDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        
        //get subcategory 
        SubcategoryDAO subcatdb = new SubcategoryDAO();
        ArrayList<Subcategory> subcatlist = subcatdb.getAllSubcategory();
        request.setAttribute("subcatlist", subcatlist);
        
        //get the ingredient
        String idRaw = request.getParameter("id");
        try {
            int ingredientId = Integer.parseInt(idRaw);
            IngredientDAO ingredientdb = new IngredientDAO();
            Ingredient i = ingredientdb.getIngredientById(ingredientId);
            request.setAttribute("ingredient", i);
            
            ArrayList<Ingredient> relatedIngredients = ingredientdb.getNIngredientsByCategoryId(i.getCategoryId(), 8);
            request.setAttribute("relatedIngredients", relatedIngredients);
            
            IngredientDescriptionDAO desdb = new IngredientDescriptionDAO();
            ArrayList<IngredientDescription> ingredientDescription = desdb.getIngredientDescriptionById(ingredientId);
            request.setAttribute("ingredientDescriptions", ingredientDescription);
            
            String categoryName = catdb.getCategoryNameById(i.getCategoryId());
            request.setAttribute("categoryName", categoryName);
            
            //the product belongs to a subcategory
            if (i.getSubcategoryId() != 0) {
                String subcategoryName = subcatdb.getSubcategoryNameById(i.getSubcategoryId());
                request.setAttribute("subcategoryName", subcategoryName);
            } 
            
            request.getRequestDispatcher("ingredientDetail.jsp").forward(request, response);
            
        } catch (Exception e) {
        }
        
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

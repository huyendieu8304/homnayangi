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

public class AdminUpdateAnIngredientServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminUpdateAnIngredientServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateAnIngredientServlet at " + request.getContextPath() + "</h1>");
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

        String ingredientIdRaw = request.getParameter("ingredientId");
        try {
            int ingredientId = Integer.parseInt(ingredientIdRaw);
            IngredientDAO ingredientdb = new IngredientDAO();
            Ingredient i = ingredientdb.getIngredientById(ingredientId);
            request.setAttribute("i", i);

            IngredientDescriptionDAO ingredientDesdb = new IngredientDescriptionDAO();
            ArrayList<IngredientDescription> listIngredientDes = ingredientDesdb.getIngredientDescriptionById(ingredientId);
            request.setAttribute("ingredientDes", listIngredientDes);

        } catch (Exception e) {
        }

        request.getRequestDispatcher("adminUpdateAnIngredient.jsp").forward(request, response);
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
        String ingredientIdRaw = request.getParameter("ingredientId");
        String ingredientName = request.getParameter("ingredientName");
        String catIdRaw = request.getParameter("categoryId");
        String unit = request.getParameter("unit");
        String quantityPerUnitRaw = request.getParameter("quantityPerUnit");
        String priceRaw = request.getParameter("price");
        String stockQuantityRaw = request.getParameter("stockQuantity");
        String stateRaw = request.getParameter("state");
        
        try {
            int ingredientId = Integer.parseInt(ingredientIdRaw);
            IngredientDAO ingredientdb = new IngredientDAO();
            Ingredient i = ingredientdb.getIngredientById(ingredientId);

            System.out.println(i.getSubcategoryId());
            
            int categoryId = Integer.parseInt(catIdRaw);
            float quantityPerUnit = Float.parseFloat(quantityPerUnitRaw);
            BigDecimal price = BigDecimal.valueOf(Double.parseDouble(priceRaw));
            int stockQuantity = Integer.parseInt(stockQuantityRaw);
            boolean state = true;
            if (stateRaw.equals("0")) {
                state = false;
            }
            // Lấy file image
            Part file = request.getPart("image");
            String imageURL = i.getImageUrl();

            // Kiểm tra nếu file không trống
            if (file != null && file.getSize() > 0) {
                // Get image name
                String imageFileName = file.getSubmittedFileName();
                imageURL = "image\\ingredientImage\\" + imageFileName;

                // Lưu ảnh vào thư mục chỉ định
                String saveImagePath = "E:\\04 FA24\\PRJ301\\assignment\\MainFolder\\homnayangi\\web\\image\\ingredientImage\\"
                        + imageFileName;

                try (FileOutputStream fos = new FileOutputStream(saveImagePath); InputStream is = file.getInputStream()) {
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            // Tạo đối tượng Ingredient sử dụng để update
            Ingredient updateIngredient = new Ingredient(ingredientId, ingredientName, 
                    categoryId, i.getSubcategoryId(), unit, quantityPerUnit,
                    price, stockQuantity, imageURL, state);
            int result = ingredientdb.updateAnIngredientById(ingredientId, updateIngredient);
            if (result == -1) {
                request.setAttribute("errorMessage", "Đã có lỗi xảy ra khi cập nhật sản phẩm trong database, mời thử lại sau");
                request.getRequestDispatcher("adminUpdateAnIngredient.jsp").forward(request, response);
            } else {
                // Update ingredient description
                IngredientDescriptionDAO ingredientDesdb = new IngredientDescriptionDAO();
                ingredientDesdb.deleteIngredientDescriptionById(ingredientId);

                String[] header = request.getParameterValues("heading");
                String[] content = request.getParameterValues("content");
                if (header != null && content != null) {
                    for (int j = 0; j < header.length; j++) {
                        IngredientDescription ingredientDes = new IngredientDescription(ingredientId, header[j], content[j]);
                        ingredientDesdb.addAnIngredientDescription(ingredientDes);
                    }
                }
                response.sendRedirect("ShowIngredient");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ. Vui lòng kiểm tra lại các giá trị nhập vào.");
            request.getRequestDispatcher("adminUpdateAnIngredient.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã có lỗi xảy ra. Vui lòng thử lại sau.");
            request.getRequestDispatcher("adminUpdateAnIngredient.jsp").forward(request, response);
        }
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

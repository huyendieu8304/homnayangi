/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author BKC
 */
public class StatisticDAO extends DBContext {

    // Method to get monthly revenue for the year 2024
    public List<BigDecimal> getMonthlyRevenueFor2024() {
        List<BigDecimal> revenueList = new ArrayList<>();

        // SQL query to get monthly revenue for 2024
        String sql = "SELECT \n"
                + "    YEAR(o.order_date) AS Year,\n"
                + "    MONTH(o.order_date) AS Month,\n"
                + "    SUM(od.quantity * od.price) AS MonthlyRevenue\n"
                + "FROM \n"
                + "    [dbo].[Order] o\n"
                + "INNER JOIN \n"
                + "    [dbo].[OrderDetail] od ON o.order_id = od.order_id\n"
                + "WHERE \n"
                + "    YEAR(o.order_date) = 2024\n"
                + "GROUP BY \n"
                + "    YEAR(o.order_date),\n"
                + "    MONTH(o.order_date)\n"
                + "ORDER BY \n"
                + "    YEAR(o.order_date),\n"
                + "    MONTH(o.order_date)";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            int currentMonth = 1;
            while (rs.next() && currentMonth <= 12) {
                int month = rs.getInt("Month");

                // Add zeros for any months with no data
                while (currentMonth < month) {
                    revenueList.add(BigDecimal.ZERO);
                    currentMonth++;
                }

                BigDecimal monthlyRevenue = rs.getBigDecimal("MonthlyRevenue");
                revenueList.add(monthlyRevenue);
                currentMonth++;
            }

            // Fill remaining months with zero revenue if needed
            while (currentMonth <= 12) {
                revenueList.add(BigDecimal.ZERO);
                currentMonth++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueList;
    }

    public List<BigDecimal> getEachCategoryRevenue() {
        List<BigDecimal> revenueList = new ArrayList<>();
        String sql = "SELECT\n"
                + "    c.category_id,\n"
                + "    c.category_name,\n"
                + "    SUM(od.quantity * od.price) AS CategoryRevenue\n"
                + "FROM\n"
                + "    [dbo].[Order] o\n"
                + "INNER JOIN\n"
                + "    [dbo].[OrderDetail] od ON o.order_id = od.order_id\n"
                + "INNER JOIN\n"
                + "    [dbo].[Ingredient] i ON od.ingredient_id = i.ingredient_id\n"
                + "INNER JOIN\n"
                + "    [dbo].[Category] c ON i.category_id = c.category_id\n"
                + "WHERE\n"
                + "    o.order_date >= '2024-01-01' AND o.order_date < '2025-01-01' -- Filter orders for the year 2024\n"
                + "GROUP BY\n"
                + "    c.category_id,\n"
                + "    c.category_name";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            int currentCategory = 1;
            while (rs.next() && currentCategory <= 9) {
                int categoryId = rs.getInt("category_id");

                // Add zeros for any months with no data
                while (currentCategory < categoryId) {
                    revenueList.add(BigDecimal.ZERO);
                    currentCategory++;
                }

                BigDecimal monthlyRevenue = rs.getBigDecimal("CategoryRevenue");
                revenueList.add(monthlyRevenue);
                currentCategory++;
            }

            // Fill remaining months with zero revenue if needed
            while (currentCategory <= 9) {
                revenueList.add(BigDecimal.ZERO);
                currentCategory++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueList;

    }
}

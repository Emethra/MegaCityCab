/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

/**
 *
 * @author Hasara Hithaishi
 */
import com.dao.DriverDAO;
import com.entity.Driver;
import com.conn.DbConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AddDriverServlet")
public class AddDriveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String name = request.getParameter("name");
            String carModel = request.getParameter("carModel");
            String vehicleNumber = request.getParameter("vehicleNumber");
            String phoneNumber = request.getParameter("phoneNumber");

            Driver driver = new Driver(name, carModel, vehicleNumber, phoneNumber);
            DriverDAO dao = new DriverDAO(DbConnect.getConn());
            
            if (dao.addDriver(driver)) {
                session.setAttribute("succMsg", "Driver Added Successfully");
            } else {
                session.setAttribute("failedMsg", "Failed to Add Driver");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Error Adding Driver: " + e.getMessage());
        }
        response.sendRedirect("adminManageDrivers.jsp");
    }
}
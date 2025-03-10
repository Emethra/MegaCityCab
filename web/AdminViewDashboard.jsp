<%-- 
    Document   : AdminViewDashboard
    Created on : Mar 9, 2025, 5:36:11 PM
    Author     : Hasara Hithaishi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dao.BookingDAO"%>
<%@page import="com.dao.DriverDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.UserDAO" %>
<%@ page import="com.conn.DbConnect" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Mega City Cab</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: #ffffff; /* Pure white background */
    min-height: 100vh;
    font-family: 'Poppins', sans-serif;
    color: #333;
}

/* Dashboard Header */
.dashboard-header {
    text-align: center;
    margin: 60px 0;
    animation: fadeIn 1s ease-out;
}

.dashboard-header h1 {
    font-size: 2.5rem;
    font-weight: 700;
    color: #2c3e50;
    position: relative;
    display: inline-block;
}

.dashboard-header h1::after {
    content: '';
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, #F4B400, #FFD700);
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 2px;
}

/* Dashboard Container */
.dashboard-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 25px;
}

/* Dashboard Card */
.dashboard-card {
    background: #f9f9f9;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: all 0.3s ease;
    position: relative;
    animation: slideUp 0.8s ease-out forwards;
    opacity: 0;
}

.dashboard-card:nth-child(1) { animation-delay: 0.2s; }
.dashboard-card:nth-child(2) { animation-delay: 0.4s; }
.dashboard-card:nth-child(3) { animation-delay: 0.6s; }

.dashboard-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    background: #fff;
}

/* Card Header */
.card-header {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    margin-bottom: 15px;
}

.card-icon {
    width: 40px;
    height: 40px;
    background: #F4B400;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-size: 1.2rem;
    transition: transform 0.3s ease;
}

.dashboard-card:hover .card-icon {
    transform: rotate(360deg);
}

.dashboard-card h2 {
    color: #2c3e50;
    font-size: 1.3rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Card Body */
.dashboard-card h3 {
    color: #F4B400;
    font-size: 2.2rem;
    font-weight: 700;
    margin: 10px 0;
    animation: numberFade 1s ease-in;
}

.dashboard-card p {
    color: #7f8c8d;
    font-size: 0.9rem;
    margin-bottom: 20px;
}

/* Progress Circle (Decorative) */
.progress-circle {
    width: 80px;
    height: 80px;
    margin: 0 auto 15px;
    position: relative;
}

.progress-circle svg {
    width: 100%;
    height: 100%;
    transform: rotate(-90deg);
}

.progress-circle circle {
    fill: none;
    stroke-width: 8;
    stroke-linecap: round;
    cx: 40;
    cy: 40;
    r: 36;
}

.progress-circle .bg {
    stroke: #e0e0e0;
}

.progress-circle .progress {
    stroke: #F4B400;
    stroke-dasharray: 226;
    stroke-dashoffset: 0;
    transition: stroke-dashoffset 1s ease;
}

.progress-circle span {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 1rem;
    color: #F4B400;
    font-weight: 600;
}

/* View Button */
.btn-adminView {
    display: inline-block;
    padding: 10px 25px;
    background: #F4B400;
    color: #fff;
    text-decoration: none;
    border-radius: 25px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    transition: all 0.3s ease;
    border: none;
    box-shadow: 0 3px 10px rgba(244, 180, 0, 0.3);
}

.btn-adminView:hover {
    background: #E0A800;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(244, 180, 0, 0.5);
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes slideUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes numberFade {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Responsive Design */
@media (max-width: 768px) {
    .dashboard-container {
        grid-template-columns: 1fr;
        margin: 20px;
    }

    .dashboard-header h1 {
        font-size: 2rem;
    }

    .dashboard-card {
        padding: 20px;
    }

    .btn-adminView {
        padding: 8px 20px;
        font-size: 0.9rem;
    }
}

    </style>
    <script>
        // Animate progress circles based on data
        document.addEventListener('DOMContentLoaded', () => {
            const circles = document.querySelectorAll('.progress-circle');
            circles.forEach(circle => {
                const progress = circle.getAttribute('data-progress');
                const progressBar = circle.querySelector('.progress');
                const circumference = 2 * Math.PI * 36; // 36 is the radius of the circle
                progressBar.style.strokeDasharray = circumference;
                progressBar.style.strokeDashoffset = circumference * (1 - progress / 100);
            });
        });
    </script>
</head>
<body>
    <%@include file="component/adminNavbar.jsp" %>
    <%
        String admin = (String) session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserDAO userDao = new UserDAO(DbConnect.getConn());
        BookingDAO bookingDao = new BookingDAO(DbConnect.getConn());
        DriverDAO driverDao = new DriverDAO(DbConnect.getConn());
        
        int userCount = userDao.getUserCount();
        double totalAmount = bookingDao.getTotalBookingAmount();
        int driverCount = driverDao.getDriverCount();
        
        DecimalFormat df = new DecimalFormat("#,##0.00");
        String formattedAmount = df.format(totalAmount);

        // Placeholder percentages for progress circles (you can calculate these dynamically)
        int userProgress = Math.min(userCount * 10, 100); // Example: 10 users = 100%
        int amountProgress = Math.min((int)(totalAmount / 10000), 100); // Example: 10000 Rs = 100%
        int driverProgress = Math.min(driverCount * 20, 100); // Example: 5 drivers = 100%
    %>
    
    <div class="dashboard-header">
        <h1>Admin Dashboard</h1>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-card">
            <div class="card-header">
                <span class="card-icon"><i class="fas fa-users"></i></span>
                <h2>Total Users</h2>
            </div>
            <div class="progress-circle" data-progress="<%= userProgress %>">
                <svg>
                    <circle class="bg" cx="40" cy="40" r="36"></circle>
                    <circle class="progress" cx="40" cy="40" r="36"></circle>
                </svg>
                <span><%= userProgress %>%</span>
            </div>
            <h3><%= userCount %></h3>
            <p>Registered Users</p>
            <a href="adminManageUser.jsp" class="btn-adminView" aria-label="View users">View Users</a>
        </div>
        
        <div class="dashboard-card">
            <div class="card-header">
                <span class="card-icon"><i class="fas fa-money-bill-wave"></i></span>
                <h2>Total Booking Amount</h2>
            </div>
            <div class="progress-circle" data-progress="<%= amountProgress %>">
                <svg>
                    <circle class="bg" cx="40" cy="40" r="36"></circle>
                    <circle class="progress" cx="40" cy="40" r="36"></circle>
                </svg>
                <span><%= amountProgress %>%</span>
            </div>
            <h3>Rs. <%= formattedAmount %></h3>
            <p>Total Revenue</p>
            <a href="adminManageBooking.jsp" class="btn-adminView" aria-label="View bookings">View Bookings</a>
        </div>
        
        <div class="dashboard-card">
            <div class="card-header">
                <span class="card-icon"><i class="fas fa-user-tie"></i></span>
                <h2>Total Drivers</h2>
            </div>
            <div class="progress-circle" data-progress="<%= driverProgress %>">
                <svg>
                    <circle class="bg" cx="40" cy="40" r="36"></circle>
                    <circle class="progress" cx="40" cy="40" r="36"></circle>
                </svg>
                <span><%= driverProgress %>%</span>
            </div>
            <h3><%= driverCount %></h3>
            <p>Active Drivers</p>
            <a href="adminManageDriver.jsp" class="btn-adminView" aria-label="View drivers">View Drivers</a>
        </div> 
    </div>
</body>
</html>
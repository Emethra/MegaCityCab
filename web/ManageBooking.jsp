<%-- 
    Document   : ManageBooking
    Created on : Mar 7, 2025, 10:38:37 AM
    Author     : Hasara Hithaishi
--%>

<%@page import="com.entity.Booking"%>
<%@page import="com.dao.BookingDAO"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Cab Bookings - Mega City Cab</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <%@include file="component/allCss.jsp"%>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('img/displayb.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: #fff;
            position: relative;
            min-height: 100vh;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.7), rgba(26, 26, 46, 0.9));
            z-index: -1;
        }

        .booking-container {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        /* Header Section */
        .booking-header {
            text-align: center;
            margin-bottom: 50px;
            animation: fadeIn 1s ease-out;
        }

        .booking-header h2 {
            font-size: 3rem;
            font-weight: 700;
            color: #FFD700;
            text-shadow: 0 2px 10px rgba(255, 215, 0, 0.5);
            position: relative;
        }

        .booking-header h2::before {
            content: '🚘';
            margin-right: 10px;
            animation: carPulse 2s infinite;
        }

        .booking-header .btn-download {
            margin-top: 20px;
            background: #FFD700;
            color: #1a1a2e;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .booking-header .btn-download:hover {
            background: #fff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.6);
        }

        /* Booking Cards */
        .booking-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 25px;
        }

        .booking-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px); /* Glassmorphism effect */
            border-radius: 20px;
            padding: 25px;
            border: 1px solid rgba(255, 215, 0, 0.2);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            animation: slideIn 0.8s ease-out forwards;
            opacity: 0;
        }

        .booking-card:nth-child(1) { animation-delay: 0.2s; }
        .booking-card:nth-child(2) { animation-delay: 0.4s; }
        .booking-card:nth-child(3) { animation-delay: 0.6s; }

        .booking-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 35px rgba(255, 215, 0, 0.4);
            background: rgba(255, 255, 255, 0.15);
        }

        .booking-card::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 215, 0, 0.1), transparent);
            animation: glow 6s infinite;
            z-index: -1;
        }

        .booking-card h5 {
            color: #FFD700;
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.4rem;
            display: flex;
            align-items: center;
        }

        .route-icon {
            width: 35px;
            height: 35px;
            background: #4a90e2;
            border-radius: 50%;
            color: #fff;
            text-align: center;
            line-height: 35px;
            margin-right: 12px;
            transition: transform 0.5s ease;
        }

        .booking-card:hover .route-icon {
            transform: scale(1.2);
        }

        .booking-card p {
            color: #ddd;
            margin: 10px 0;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .status {
            font-weight: 600;
            padding: 6px 15px;
            border-radius: 15px;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .status-pending {
            color: #f39c12;
            background: rgba(243, 156, 18, 0.2);
        }

        .status-accepted {
            color: #27ae60;
            background: rgba(39, 174, 96, 0.2);
        }

        /* Buttons */
        .btn-custom {
            border-radius: 25px;
            padding: 12px 30px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            margin: 5px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            font-weight: 500;
        }

        .btn-edit {
            background: #27ae60;
            color: #fff;
            border: none;
        }

        .btn-delete {
            background: #e74c3c;
            color: #fff;
            border: none;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        /* Alerts */
        .alert {
            padding: 15px 30px;
            border-radius: 15px;
            font-size: 1.2rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            text-align: center;
            backdrop-filter: blur(5px);
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 215, 0, 0.3);
            animation: bounceIn 0.8s ease-out;
        }

        .alert i {
            margin-right: 12px;
            font-size: 24px;
        }

        .alert-success {
            color: #2ecc71;
        }

        .alert-danger {
            color: #e74c3c;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes carPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes glow {
            0% { transform: scale(0); opacity: 0.5; }
            50% { transform: scale(1.5); opacity: 0; }
            100% { transform: scale(0); opacity: 0.5; }
        }

        @keyframes bounceIn {
            0% { opacity: 0; transform: scale(0.95); }
            50% { transform: scale(1.05); }
            100% { opacity: 1; transform: scale(1); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .booking-header h2 {
                font-size: 2.2rem;
            }

            .booking-grid {
                grid-template-columns: 1fr;
            }

            .booking-card {
                padding: 20px;
            }

            .btn-custom {
                padding: 10px 20px;
                font-size: 1rem;
            }

            .alert {
                font-size: 1rem;
                max-width: 90%;
            }
        }
    </style>
    <script>
        // PDF Download Function
        function downloadPDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            let y = 20;

            doc.setFontSize(20);
            doc.setTextColor(255, 215, 0);
            doc.text('My Cab Bookings', 105, y, { align: 'center' });
            y += 15;

            doc.setFontSize(12);
            doc.setTextColor(255, 255, 255);
            const bookings = document.querySelectorAll('.booking-card');
            bookings.forEach((card, index) => {
                y += 10;
                doc.text(`Booking ${index + 1}`, 10, y);
                y += 5;
                const details = card.querySelectorAll('h5, p');
                details.forEach(detail => {
                    const text = detail.textContent;
                    if (text) {
                        y += 5;
                        doc.text(text, 15, y);
                    }
                });
                y += 10;
            });

            doc.save('my_cab_bookings.pdf');
        }
    </script>
</head>
<body>
    <%@include file="component/navbar.jsp" %>

    <%
    if (user == null) {
        session.setAttribute("invalidMsg", "Login Please..");
        response.sendRedirect("login.jsp");
    }
    %>

    <% 
    String sucssMsg = (String) session.getAttribute("succMsg");
    String errorMsg = (String) session.getAttribute("failedMsg");
    if (sucssMsg != null) {
    %>
    <div class="alert alert-success" role="alert">
        <i class="fas fa-check-circle"></i> <%= sucssMsg %>
    </div>
    <%
        session.removeAttribute("succMsg");
    }
    if (errorMsg != null) { 
    %>
    <div class="alert alert-danger" role="alert">
        <i class="fas fa-times-circle"></i> <%= errorMsg %>
    </div>
    <%
        session.removeAttribute("failedMsg");
    }
    %> 

    <div class="booking-container">
        <div class="booking-header">
            <h2>My Cab Bookings</h2>
            <button class="btn-download" onclick="downloadPDF()">Download PDF</button>
        </div>
        <div class="booking-grid">
            <% 
            if (user != null) {                       
                BookingDAO dao = new BookingDAO(DbConnect.getConn());
                List<Booking> booking = dao.getAllContact(user.getID());
                
                for (Booking c : booking) {
                    String driverName = "Not Assigned";
                    String driverPhoneNumber = "Not Available";
                    if ("Accepted".equals(c.getStatus()) && c.getDriverId() != null) {
                        String[] driverDetails = dao.getDriverDetailsByDriverId(c.getDriverId());
                        if (driverDetails != null) {
                            driverName = driverDetails[0];
                            driverPhoneNumber = driverDetails[1];
                        } else {
                            driverName = "Driver Not Found";
                        }
                    }
            %>
           <div class="booking-card">
    <div class="card-header">
        <div class="route-details">
            <span class="route-icon route-start"><i class="fas fa-map-marker-alt"></i></span>
            <span class="route-text"><%= c.getStart() %></span>
            <span class="route-arrow"><i class="fas fa-arrow-right"></i></span>
            <span class="route-icon route-end"><i class="fas fa-flag-checkered"></i></span>
            <span class="route-text"><%= c.getEnd() %></span>
        </div>
        <span class="status status-<%= c.getStatus().toLowerCase() %>"><%= c.getStatus() %></span>
    </div>
    <div class="card-body">
        <div class="info-row">
            <span class="info-label"><i class="fas fa-user"></i> Name:</span>
            <span class="info-value"><%= c.getName() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-phone-alt"></i> Phone:</span>
            <span class="info-value"><%= c.getPhno() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-envelope"></i> Email:</span>
            <span class="info-value"><%= c.getEmail() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-home"></i> Address:</span>
            <span class="info-value"><%= c.getAddress() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-info-circle"></i> About:</span>
            <span class="info-value"><%= c.getAbout() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-money-bill-wave"></i> Amount:</span>
            <span class="info-value">LKR <%= c.getAmount() %></span>
        </div>
        <div class="info-row">
            <span class="info-label"><i class="fas fa-calendar-alt"></i> Date:</span>
            <span class="info-value"><%= c.getBookingDate() %></span>
        </div>
        <% if ("Accepted".equals(c.getStatus())) { %>
            <div class="info-row">
                <span class="info-label"><i class="fas fa-user-tie"></i> Driver:</span>
                <span class="info-value"><%= driverName %></span>
            </div>
            <div class="info-row">
                <span class="info-label"><i class="fas fa-phone-square"></i> Contact:</span>
                <span class="info-value"><%= driverPhoneNumber %></span>
            </div>
        <% } %>
    </div>
    <div class="card-footer">
        <a href="EditBooking.jsp?cid=<%= c.getID() %>" class="btn-custom btn-edit" aria-label="Edit booking">Edit</a>
        <a href="delete?cid=<%= c.getID() %>" class="btn-custom btn-delete" aria-label="Delete booking">Delete</a>
    </div>
</div>
            <%
                }
            }
            %>
        </div>
    </div>
</body>
</html>
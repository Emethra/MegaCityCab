<%-- 
    Document   : aboutUs
    Created on : Mar 4, 2025, 5:20:58 PM
    Author     : Hasara Hithaishi
--%>

<%@page import="com.entity.User"%>
<%@page import="com.conn.DbConnect"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>About Us - Mega City Cab</title>
    <%@include file="component/allCss.jsp"%>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style type="text/css">
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* About Hero Section */
        .about-home {
            position: relative;
            min-height: 92vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('img/aboutbg.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            overflow: hidden;
        }

        .about-content {
            padding: 0 2rem;
            max-width: 800px;
            animation: fadeInDown 1s ease-out;
        }

        .about-content h3 {
            font-size: 2rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
        }

        .about-content h1 {
            font-size: 3.5rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .about-content h1 span {
            background: #FFD700;
            color: #000;
            padding: 0.3rem 0.6rem;
            transform: skew(-15deg);
            display: inline-block;
            box-shadow: 0 0 10px #FFD700;
            animation: glow 2s ease-in-out infinite;
        }

        /* About Section 1 */
        .about-1 {
            padding: 80px 5%;
            background: #f5f5f5;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .about-1 h1 {
            font-size: 3rem;
            color: #1a1a2e;
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
            animation: slideInLeft 1s ease-out;
        }

        .about-1 h1::before {
            content: '🚖';
            margin-right: 10px;
            animation: bounce 2s infinite;
        }

        .about-1 p {
            font-size: 1.2rem;
            line-height: 1.8;
            color: #666;
            max-width: 900px;
            margin: 0 auto;
            animation: fadeInUp 1s ease-out 0.5s forwards;
            opacity: 0;
        }

        /* About Section 2 */
        .about-2 {
            padding: 80px 5%;
            background: #fff;
        }

        .content-box-lg {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .about-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .about-row {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 30px;
        }

        .about-col-md-4 {
            flex: 1 1 30%;
            background: linear-gradient(135deg, #fff, #f0f0f0);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease-in-out;
            opacity: 0;
            animation: fadeInUp 1s ease-out forwards;
        }

        .about-col-md-4:nth-child(1) { animation-delay: 0.2s; }
        .about-col-md-4:nth-child(2) { animation-delay: 0.4s; }
        .about-col-md-4:nth-child(3) { animation-delay: 0.6s; }

        .about-col-md-4:hover {
            transform: translateY(-10px) scale(1.02);
            background: linear-gradient(135deg, #FFD700, #f0e102);
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.4);
        }

        .about-item-text-center i {
            font-size: 2.5rem;
            color: #FFD700;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .about-col-md-4:hover .about-item-text-center i {
            transform: rotate(15deg) scale(1.2);
        }

        .about-item-text-center h3 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1a1a2e;
            margin-bottom: 15px;
            transition: color 0.3s ease;
        }

        .about-col-md-4:hover .about-item-text-center h3 {
            color: #fff;
        }

        .about-item-text-center p {
            font-size: 1rem;
            line-height: 1.6;
            color: #777;
            transition: color 0.3s ease;
        }

        .about-col-md-4:hover .about-item-text-center p {
            color: #ddd;
        }

        /* Animations */
        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideInLeft {
            0% { opacity: 0; transform: translateX(-50px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        @keyframes bounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        @keyframes glow {
            0% { box-shadow: 0 0 5px #FFD700; }
            50% { box-shadow: 0 0 20px #FFD700, 0 0 30px #FFD700; }
            100% { box-shadow: 0 0 5px #FFD700; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .about-home {
                min-height: 70vh;
                background-attachment: scroll;
            }

            .about-content h3 {
                font-size: 1.5rem;
                letter-spacing: 2px;
            }

            .about-content h1 {
                font-size: 2.5rem;
            }

            .about-1 {
                padding: 40px 5%;
            }

            .about-1 h1 {
                font-size: 2rem;
            }

            .about-1 p {
                font-size: 1rem;
            }

            .about-col-md-4 {
                flex: 1 1 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp" %>
    <%
        if (user == null) {
            session.setAttribute("invalidMsg", "Login Please..");
            response.sendRedirect("login.jsp");
        }
    %>

    <!-- About Hero Section -->
    <div class="about-home">
        <div class="about-content">
            <h3>Hire the Best Service</h3>
            <h1>Trusted and <span>Cheapest Cab</span><br>Company Service</h1>
        </div>    
    </div>

    <!-- About Us Section -->
    <section>
        <div class="about-1">
            <h1>About Us</h1>
            <p>Welcome to Mega City Cab, your trusted partner for safe, reliable, and convenient transportation. "Ride with Comfort, Arrive with Confidence!" We are dedicated to providing top-notch cab services that cater to your travel needs with comfort, efficiency, and affordability. Whether you're heading to the airport, commuting to work, or planning a city tour, our well-maintained fleet and experienced drivers ensure a smooth and punctual ride. Our services are available 24/7, with advanced booking options, real-time tracking, and flexible payment methods to make your journey stress-free. Experience the difference with our customer-focused approach, where your safety and satisfaction are our top priorities.</p>
        </div>

        <!-- Mission, Vision, Achievements Section -->
        <div id="about-2" class="about-2">
            <div class="content-box-lg">
                <div class="about-container">
                    <div class="about-row">
                        <div class="about-col-md-4">
                            <div class="about-item-text-center">
                                <i class="fa fa-book"></i>
                                <h3>Our Mission</h3>
                                <p>Our mission is to make your journeys seamless and enjoyable, with a strong commitment to customer satisfaction at every step. We ensure timely pickups, professional drivers, and a smooth ride every time.</p>
                            </div>
                        </div>
                        <div class="about-col-md-4">
                            <div class="about-item-text-center">
                                <i class="fa fa-globe"></i>
                                <h3>Our Vision</h3>
                                <p>We envision a world where transportation is effortless, safe, and accessible to everyone. Mega City Cab aims to lead the industry by setting new standards in reliability and customer care.</p>
                            </div>
                        </div>
                        <div class="about-col-md-4">
                            <div class="about-item-text-center">
                                <i class="fa fa-trophy"></i>
                                <h3>Our Achievements</h3>
                                <p>With thousands of happy customers, a 98% on-time arrival rate, and multiple awards for excellence in transportation, Mega City Cab is proud to be a leader in the cab service industry.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="component/footer.jsp" %>
</body>
</html>
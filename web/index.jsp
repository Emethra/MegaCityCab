<%-- 
    Document   : index
    Created on : Mar 3, 2025, 11:37:32 PM
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
        <title>Mega City Cab - Premium Transportation</title>
        <%@include file="component/allCss.jsp"%>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <style type="text/css">
            * {
                font-family: 'Poppins', sans-serif;
            }

            /* Hero Section */
.hero-section {
    position: relative;
    min-height: 100vh;
    background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                url('img/addBookingB.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    padding: 20px;
}
section {
                padding: 100px 17% 90px;
            }
            .home{
                position: relative;
                height: 100vh;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                text-align: center;
                background: url(img/bg.jpg);
                background-size: cover;
                background-position: center;
            }
            .home-content{
                padding-top: 170px;
            }
            .home-img{
                position: relative;
            }
            .home-img img{
                margin-top: 50px;
                max-width: 850px;
                width: 100%;
                height: 100%;
                object-fit: contain;
            }
            .home-content h5{
                font-size: 18px;
                font-weight: 600;
                color: yellow;
                text-transform:uppercase;
                margin-top: 9px;
                letter-spacing:7px;
            }
            .home-content h1{
                font-size: 60px;
                font-weight: 900;
                color: white;
                line-height: 1.2;
            }

/* Hero Content */
.hero-content {
    position: relative;
    z-index: 1;
    text-align: center;
    color: white;
    padding: 40px;
    background: rgba(0, 0, 0, 0.8); /* Slightly darker overlay for contrast */
    border-radius: 20px;
    max-width: 800px;
    margin: 20px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(5px); /* Glass effect */
    animation: fadeInScale 1s ease-out forwards;
}

/* Animated Title */
.hero-title {
    font-size: 3.5rem;
    font-weight: 700;
    margin-bottom: 20px;
    color: #fff;
    position: relative;
    display: inline-block;
}

.hero-title span {
    color: #FFD700; /* Highlight "Mega City Cab" in gold */
}

.underline-glow {
    position: absolute;
    bottom: -5px;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 3px;
    background: #FFD700;
    box-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700;
    animation: expandGlow 1.5s ease-in-out forwards;
}


/* Animated Subtitle */
.hero-subtitle {
    font-size: 1.2rem;
    margin-bottom: 30px;
    color: #ddd;
    opacity: 0;
    animation: fadeInUp 1.2s ease-out 0.5s forwards;
}

/* Animated CTA Button */
.cta-button {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 15px 40px;
    background: #FFD700;
    color: #000;
    text-decoration: none;
    border-radius: 50px;
    font-weight: 600;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    animation: bounceIn 1.4s ease-out 0.8s forwards;
    opacity: 0;
}

.cta-button::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
    transition: 0.5s;
}

.cta-button:hover::before {
    left: 100%;
}

.cta-button:hover {
    background: #fff;
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(255, 215, 0, 0.5);
}

.button-icon i {
    transition: transform 0.3s ease;
}

.cta-button:hover .button-icon i {
    transform: translateX(5px);
}

/* Social Bar */
.social-bar {
    position: absolute;
    left: 30px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    flex-direction: column;
    gap: 20px;
    z-index: 2;
}

.social-bar a {
    color: #FFD700;
    font-size: 1.5rem;
    transition: all 0.3s ease;
    text-decoration: none;
    opacity: 0;
    animation: fadeInLeft 0.5s ease-out forwards;
}

.social-bar a:nth-child(1) { animation-delay: 0.2s; }
.social-bar a:nth-child(2) { animation-delay: 0.4s; }
.social-bar a:nth-child(3) { animation-delay: 0.6s; }
.social-bar a:nth-child(4) { animation-delay: 0.8s; }

.social-bar a:hover {
    color: #fff;
    transform: scale(1.2);
}

/* Responsive Design */
@media (max-width: 768px) {
    .hero-section {
        background-attachment: scroll; /* Disable fixed background on mobile */
    }

    .hero-content {
        padding: 20px;
        max-width: 90%;
    }

    .hero-title {
        font-size: 2.5rem;
    }

    .hero-subtitle {
        font-size: 1rem;
    }

    .social-bar {
        display: none;
    }
}

            /* Social Bar */
            .social-bar {
                position: absolute;
                left: 30px;
                top: 50%;
                transform: translateY(-50%);
                display: flex;
                flex-direction: column;
                gap: 20px;
                z-index: 2;
            }

            .social-bar a {
                color: #FFD700;
                font-size: 1.5rem;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .social-bar a:hover {
                color: #fff;
                transform: scale(1.2);
            }

            /* Animations */
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(50px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* About Section */
            .about-section {
                padding: 100px 10%;
                background: #f9f9f9;
                position: relative;
            }

            .about-container {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 50px;
                align-items: center;
            }

            .about-image {
                position: relative;
                overflow: visible;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            }

            .about-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .about-image:hover img {
                transform: scale(1.1);
            }

            .about-content h2 {
                font-size: 2.5rem;
                font-weight: 700;
                color: #1a1a1a;
                margin-bottom: 20px;
            }

            .about-content p {
                color: #666;
                line-height: 1.8;
                margin-bottom: 30px;
            }

            /* Animated Taxi Image */
            .taxi-animated {
                animation: driveMotion 4s ease-in-out infinite;
                transform-origin: center;
            }

            

            .feature-list {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
                margin-bottom: 30px;
            }

            .feature-item {
                display: flex;
                align-items: center;
                gap: 15px;
                padding: 15px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            }

            .feature-item i {
                font-size: 2rem;
                color: #FFD700;
            }

            /* Services Section */
            .services-section {
                padding: 100px 10%;
                background: white;
            }

            .section-title {
                text-align: center;
                margin-bottom: 60px;
            }

            .section-title h2 {
                font-size: 2.5rem;
                font-weight: 700;
                color: #1a1a1a;
            }

            .section-title p {
                color: #666;
                font-size: 1.1rem;
            }

            .services-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 30px;
            }

            .service-card {
                background: #fff;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .service-card:hover {
                transform: translateY(-10px);
            }

            .service-image {
                height: 200px;
                overflow: hidden;
            }

            .service-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .service-card:hover .service-image img {
                transform: scale(1.1);
            }

            .service-content {
                padding: 25px;
                text-align: center;
            }

            .service-content h3 {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 15px;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .hero-section {
                    background-attachment: scroll; /* Disable fixed background on mobile for performance */
                }

                .hero-content {
                    padding: 20px;
                    max-width: 90%;
                }

                .hero-content h1 {
                    font-size: 2.5rem;
                }

                .hero-content p {
                    font-size: 1rem;
                }

                .social-bar {
                    display: none; /* Hide social bar on mobile */
                }

                .about-container {
                    grid-template-columns: 1fr;
                }
                .brand-name {
    /* ... existing styles ... */
    animation: fadeInUp 1.2s ease-out 0.5s forwards;
    opacity: 0;
}
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <!-- Hero Section -->
        
<section class="home" id="home">
            <div class="home-content">
                <div class="home-text">
                    <h5>Welcome to Mega City Cab </h5>
                    <h1>Securely Booking your Cab today <br> From Any Location</h1>
                </div>
                <div class="home-img">
                    <img src="img/home.png">
                    <div class="info-box">
                        <div class="count">80+</div>
                        <div class="info-text">Available taxi for booking</div>
                    </div>
                </div>
                <div class="socail-icons">
                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    <a href="#"><i class="fa-solid fa-basketball"></i></a>
                </div>
                
                <div class="arrow">
                    <a href="#about"><i class="fa-solid fa-arrow-down-long"></i></a>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section class="about-section">
            <div class="about-container">
                <div class="about-image">
                    <img src="img/Cab6.jpg" alt="Premium Taxi" class="taxi-animated">
                </div>
                <div class="about-content">
                    <h2>Why Choose Mega City Cab?</h2>
                    <p>Experience the best in urban transportation with our premium cab services. We offer reliable, safe, and comfortable rides across the city, tailored to your needs.</p>
                    
                    <div class="feature-list">
                        <div class="feature-item">
                            <i class="ri-calendar-line"></i>
                            <span>Instant Online Booking</span>
                        </div>
                        <div class="feature-item">
                            <i class="ri-customer-service-line"></i>
                            <span>24/7 Customer Support</span>
                        </div>
                        <div class="feature-item">
                            <i class="ri-car-line"></i>
                            <span>Luxury Fleet</span>
                        </div>
                        <div class="feature-item">
                            <i class="ri-shield-check-line"></i>
                            <span>Guaranteed Safety</span>
                        </div>
                    </div>
                    
                    <a href="AddBooking.jsp" class="cta-button">Book Now</a>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section class="services-section">
            <div class="section-title">
                <h2>Our Premium Services</h2>
                <p>Explore our range of transportation solutions designed for your comfort</p>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-image">
                        <img src="img/yellow-black-sign-taxi-placed-top-car-night.jpg" alt="Business Transfer">
                    </div>
                    <div class="service-content">
                        <h3>Business Transfer</h3>
                        <p>Professional transportation for your business needs with premium comfort</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-image">
                        <img src="img/paul-hanaoka-D-qq7W751vs-unsplash.jpg" alt="Online Booking">
                    </div>
                    <div class="service-content">
                        <h3>Online Booking</h3>
                        <p>Book your ride instantly with our user-friendly online platform</p>
                    </div>
                </div>
                
                <div class="service-card">
                    <div class="service-image">
                        <img src="img/courier-girl-sitting-car.jpg" alt="City Transport">
                    </div>
                    <div class="service-content">
                        <h3>City Transport</h3>
                        <p>Reliable transportation services across the city, anytime, anywhere</p>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
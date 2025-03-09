<%-- 
    Document   : adminNavbar
    Created on : Mar 9, 2025, 5:51:34 PM
    Author     : Hasara Hithaishi
--%>

<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Mega City Cab</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(90deg, #1a1a2e, #2a2a4e); /* Gradient background */
            padding: 15px 0;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            position: sticky;
            top: 0;
            z-index: 1000;
            animation: slideDown 0.8s ease-out;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #FFD700 !important;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-left: 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .navbar-brand i {
            margin-right: 10px;
            animation: carPulse 2s infinite;
        }

        .navbar-brand:hover {
            text-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700;
            transform: scale(1.05);
        }

        /* Navbar Links */
        .navbar-nav .nav-item {
            position: relative;
        }

        .navbar-nav .nav-item .nav-link {
            color: #ffffff !important;
            font-size: 1.1rem;
            font-weight: 500;
            padding: 10px 20px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .navbar-nav .nav-item .nav-link i {
            transition: transform 0.3s ease;
        }

        .navbar-nav .nav-item .nav-link:hover i {
            transform: rotate(15deg);
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #FFD700 !important;
            text-shadow: 0 0 5px #FFD700;
            background: rgba(255, 215, 0, 0.1);
            border-radius: 5px;
        }

        /* Underline Effect */
        .navbar-nav .nav-item .nav-link::after {
            content: '';
            position: absolute;
            bottom: 5px;
            left: 15px;
            width: 0;
            height: 2px;
            background: #FFD700;
            transition: width 0.3s ease;
        }

        .navbar-nav .nav-item .nav-link:hover::after {
            width: calc(100% - 30px);
        }

        /* Active Link */
        .navbar-nav .nav-item.active .nav-link {
            color: #FFD700 !important;
            font-weight: 600;
            background: rgba(255, 215, 0, 0.2);
            border-radius: 5px;
        }

        /* Toggler */
        .navbar-toggler {
            border: none;
            padding: 5px;
        }

        .navbar-toggler-icon {
            background: url('data:image/svg+xml;charset=utf8,%3Csvg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"%3E%3Cpath stroke="rgba%28255, 215, 0, 1%29" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"/%3E%3C/svg%3E');
            width: 30px;
            height: 30px;
        }

        /* Buttons */
        .btn-danger {
            background: #FFD700;
            border: none;
            color: #1a1a2e;
            font-size: 1.1rem;
            padding: 8px 20px;
            border-radius: 25px;
            margin-right: 20px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-danger:hover {
            background: #fff;
            color: #1a1a2e;
            box-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700;
            transform: translateY(-2px);
        }

        .btn-danger::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: 0.5s;
        }

        .btn-danger:hover::before {
            left: 100%;
        }

        /* Modal Styling */
        .modal-content {
            border: 2px solid #FFD700;
            border-radius: 15px;
            background: #1a1a2e;
            color: #fff;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            animation: fadeIn 0.5s ease-out;
        }

        .modal-header {
            background: #FFD700;
            color: #1a1a2e;
            border-top-left-radius: 13px;
            border-top-right-radius: 13px;
            border-bottom: none;
            padding: 15px;
            position: relative;
        }

        .modal-title {
            font-weight: 600;
            text-align: center;
            width: 100%;
            font-size: 1.2rem;
        }

        .modal-body {
            padding: 30px;
            text-align: center;
            font-size: 1.1rem;
        }

        .btn-close {
            position: absolute;
            right: 15px;
            top: 15px;
            color: #1a1a2e;
            opacity: 1;
            transition: all 0.3s ease;
        }

        .btn-close:hover {
            transform: rotate(90deg);
        }

        .modal-footer {
            border-top: none;
            padding: 15px;
            justify-content: center;
            gap: 15px;
        }

        .modal-footer .btn {
            border-radius: 10px;
            padding: 10px 25px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .modal-footer .btn-secondary {
            background: #666;
            border: none;
            color: #fff;
        }

        .modal-footer .btn-secondary:hover {
            background: #888;
            transform: translateY(-2px);
        }

        .modal-footer .btn-danger {
            background: #FFA500;
            border: none;
            color: #fff;
        }

        .modal-footer .btn-danger:hover {
            background: #e69500;
            box-shadow: 0 0 10px #FFA500;
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes slideDown {
            from { transform: translateY(-100%); }
            to { transform: translateY(0); }
        }

        @keyframes carPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .navbar-nav {
                text-align: center;
                padding: 20px 0;
            }

            .navbar-nav .nav-item .nav-link {
                padding: 15px 0;
            }

            .navbar-nav .nav-item .nav-link::after {
                display: none;
            }

            .btn-danger {
                margin: 10px auto;
                display: block;
                width: fit-content;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="AdminViewDashboard.jsp"><i class="fa-solid fa-car"></i> Admin Panel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>   
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto">
            <li class="nav-item active mx-3">
                <a class="nav-link" href="AdminViewDashboard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="adminManageUsers.jsp"><i class="fa-solid fa-users"></i> Manage Users</a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="adminManageBookings.jsp"><i class="fa-solid fa-calendar-check"></i> Manage Bookings</a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="adminManageDrivers.jsp"><i class="fa-solid fa-chart-bar"></i> Manage Drivers</a>
            </li>
        </ul>

        <div class="navbar-nav ml-auto">
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">
                <i class="fa-solid fa-sign-out-alt"></i> Logout
            </button>
        </div>
    </div>
</nav>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Logout Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Do you really want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="login.jsp" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
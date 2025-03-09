<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* Navbar */
        .navbar {
            background: #000000; /* Solid black background */
            padding: 15px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Slightly darker shadow for contrast */
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #FFD700 !important; /* Gold color for the brand */
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-left: 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .navbar-brand i {
            margin-right: 10px;
            animation: carBounce 2s ease-in-out infinite;
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
            transform: translateX(5px);
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #FFD700 !important;
            text-shadow: 0 0 5px #FFD700;
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
        .btn-success {
            background: #FFD700;
            border: none;
            color: #1a1a2e;
            font-size: 1.1rem;
            padding: 8px 20px;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-success:hover {
            background: #fff;
            color: #1a1a2e;
            box-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700;
            transform: translateY(-2px);
        }

        .btn-success::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: 0.5s;
        }

        .btn-success:hover::before {
            left: 100%;
        }

        .btn-danger {
            background: #e74c3c;
            border: none;
            color: #fff;
            font-size: 1.1rem;
            padding: 8px 20px;
            border-radius: 25px;
            margin-right: 15px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-danger:hover {
            background: #c0392b;
            box-shadow: 0 0 10px #e74c3c, 0 0 20px #e74c3c;
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
        }

        .modal-header {
            background: #FFD700;
            color: #1a1a2e;
            border-top-left-radius: 13px;
            border-top-right-radius: 13px;
            border-bottom: none;
        }

        .modal-title {
            font-weight: 600;
        }

        .modal-body {
            padding: 30px;
            text-align: center;
        }

        .modal-body h6 {
            color: #ddd;
            margin-bottom: 20px;
        }

        .btn-secondary {
            background: #666;
            border: none;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background: #888;
            transform: translateY(-2px);
        }

        .btn-warning {
            background: #FFA500;
            border: none;
            color: #fff;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-warning:hover {
            background: #e69500;
            box-shadow: 0 0 10px #FFA500;
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes carBounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
            100% { transform: translateY(0); }
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

            .form-inline {
                justify-content: center;
                margin-top: 10px;
            }

            .btn-success, .btn-danger {
                margin: 5px;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-car"></i> Mega City Cab</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>   
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto">
            <li class="nav-item active mx-3">
                <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="aboutUs.jsp"><i class="fa-solid fa-eject"></i> About Us</a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="AddBooking.jsp"><i class="fa-solid fa-square-plus"></i> Add Booking</a>
            </li>
            <li class="nav-item active mx-3">
                <a class="nav-link" href="ManageBooking.jsp"><i class="fa-solid fa-eye"></i> Display Booking</a>
            </li>
        </ul>
        <% 
            User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
        <form class="form-inline my-2 my-lg-0">
            <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> Login</a>   
        </form>
        <% } else { %>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-success"><%= user.getName() %></button> \t
            <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger text-white">Logout</a>
        </form>
        <% } %>  
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Logout Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h6>Do you really want to logout?</h6>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="logout" class="btn btn-warning">Logout</a>
                </div>
            </div>
        </div>
    </div>
</nav>
</body>
</html>
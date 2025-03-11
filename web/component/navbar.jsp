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
            background: #000000;
            padding: 15px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #FFD700 !important;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-left: 20px;
            display: flex;
            align-items: center;
        }

        .navbar-nav .nav-item .nav-link {
            color: #ffffff !important;
            font-size: 1.1rem;
            font-weight: 500;
            padding: 10px 20px;
        }

        .navbar-nav .nav-item .nav-link:hover {
            color: #FFD700 !important;
        }

        .navbar-toggler {
            border: none;
            padding: 5px;
        }

        .navbar-toggler-icon {
            background: url('data:image/svg+xml;charset=utf8,%3Csvg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"%3E%3Cpath stroke="rgba%28255, 215, 0, 1%29" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"/%3E%3C/svg%3E');
            width: 30px;
            height: 30px;
        }

        .btn-success {
            background: #FFD700;
            border: none;
            color: #1a1a2e;
            font-size: 1.1rem;
            padding: 8px 20px;
            border-radius: 25px;
        }

        .btn-danger {
            background: #e74c3c;
            border: none;
            color: #fff;
            font-size: 1.1rem;
            padding: 8px 20px;
            border-radius: 25px;
            margin-right: 15px;
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
                <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
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
            <button class="btn btn-success"><%= user.getName() %></button> 	
            <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger text-white">Logout</a>
        </form>
        <% } %>  
    </div>

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

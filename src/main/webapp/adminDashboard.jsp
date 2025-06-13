<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Hotel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2d5c4d;
            --secondary-color: #60d1ad;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
            --danger-color: #e74c3c;
            --success-color: #2ecc71;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
        }
        .sidebar {
            background-color: var(--primary-color);
            min-height: 100vh;
            color: white;
        }
        .sidebar .nav-link {
            color: white;
            margin-bottom: 5px;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: var(--secondary-color);
            border-radius: 5px;
        }
        .sidebar .nav-link i {
            margin-right: 10px;
        }
        .main-content {
            padding: 20px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: var(--primary-color);
            color: white;
            border-radius: 10px 10px 0 0 !important;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .badge-success {
            background-color: var(--success-color);
        }
        .badge-warning {
            background-color: #f39c12;
        }
        .badge-danger {
            background-color: var(--danger-color);
        }
    </style>
</head>
<body>


    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar p-0">
                <div class="p-3">
                    <h4 class="text-center mb-4">Admin Panel</h4>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#dashboard" data-bs-toggle="tab">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#hotels" data-bs-toggle="tab">
                                <i class="fas fa-hotel"></i> Manage Hotels
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#tickets" data-bs-toggle="tab">
                                <i class="fas fa-ticket-alt"></i> Contact Tickets
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#feedbacks" data-bs-toggle="tab">
                                <i class="fas fa-comment-alt"></i> Customer Feedback
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#accounts" data-bs-toggle="tab">
                                <i class="fas fa-users"></i> User Accounts
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#activities" data-bs-toggle="tab">
                                <i class="fas fa-history"></i> Recent Activities
                            </a>
                        </li>
                        <li class="nav-item mt-4">
    <form action="LogoutServlet" method="POST" style="display: inline;">
        <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
        <button type="submit" class="nav-link text-danger bg-transparent border-0 p-0 w-100 text-start">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </form>
</li>
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <div class="tab-content">
                    <!-- Dashboard Tab -->
                    <div class="tab-pane fade show active" id="dashboard">
                        <h2 class="mb-4"><i class="fas fa-tachometer-alt me-2"></i>Dashboard Overview</h2>
                        
                        <!-- Stats Cards -->
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Total Hotels</h5>
                                        <h2 class="card-text">24</h2>
                                        <p class="text-success"><i class="fas fa-arrow-up"></i> 12% from last month</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Active Bookings</h5>
                                        <h2 class="card-text">156</h2>
                                        <p class="text-success"><i class="fas fa-arrow-up"></i> 8% from last week</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Pending Tickets</h5>
                                        <h2 class="card-text">7</h2>
                                        <p class="text-danger"><i class="fas fa-arrow-down"></i> 3 new today</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Total Revenue</h5>
                                        <h2 class="card-text">LKR12,245,678</h2>
                                        <p class="text-success"><i class="fas fa-arrow-up"></i> 15% from last month</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Bookings -->
                        <div class="card mt-4">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-calendar-check me-2"></i>Recent Bookings</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Booking ID</th>
                                                <th>Hotel</th>
                                                <th>Customer</th>
                                                <th>Check-In</th>
                                                <th>Check-Out</th>
                                                <th>Status</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>BK1001</td>
                                                <td>Oliphant Boutique Villa</td>
                                                <td>John Doe</td>
                                                <td>2023-06-15</td>
                                                <td>2023-06-20</td>
                                                <td><span class="badge bg-success">Confirmed</span></td>
                                                <td>LKR75890</td>
                                            </tr>
                                            <tr>
                                                <td>BK1002</td>
                                                <td>Hotel Paradiso del Sol</td>
                                                <td>Jane Smith</td>
                                                <td>2023-06-18</td>
                                                <td>2023-06-25</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>LKR76780</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Manage Hotels Tab -->
                    <div class="tab-pane fade" id="hotels">
                        <h2 class="mb-4"><i class="fas fa-hotel me-2"></i>Manage Hotels</h2>
                        
                        <!-- Add Hotel Form -->
<div class="card mb-4">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Hotel</h5>
    </div>
    <div class="card-body">
        <form action="InsertHotelAddServlet" method="POST">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="hotelName" class="form-label">Hotel Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <input type="text" class="form-control" id="location" name="location" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="amenities" class="form-label">Amenities (comma separated)</label>
                        <input type="text" class="form-control" id="amenities" name="amenities" placeholder="WiFi, Pool, Gym, Spa">
                    </div>
                    <div class="mb-3">
                        <label for="rating" class="form-label">Rating</label>
                        <select class="form-select" id="rating" name="rating">
                            <option value="1">1 Star</option>
                            <option value="2">2 Stars</option>
                            <option value="3" selected>3 Stars</option>
                            <option value="4">4 Stars</option>
                            <option value="5">5 Stars</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Hotel Image</label>
                        <input type="file" class="form-control" id="imageUrl" name="imageUrl">
                    </div>
                </div>
            </div>
            
            <!-- Room Rates Section -->
            <div class="row mt-3">
                <div class="col-12">
                    <h5 class="mb-3"><i class="fas fa-bed me-2"></i>Room Rates (per night)</h5>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="singleRate" class="form-label">Single Room</label>
                        <div class="input-group">
                            <span class="input-group-text">LKR</span>
                            <input type="number" class="form-control" id="singleRate" name="singleRate" min="0" step="0.01" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="doubleRate" class="form-label">Double Room</label>
                        <div class="input-group">
                            <span class="input-group-text">LKR</span>
                            <input type="number" class="form-control" id="doubleRate" name="doubleRate" min="0" step="0.01" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="suiteRate" class="form-label">Suite</label>
                        <div class="input-group">
                            <span class="input-group-text">LKR</span>
                            <input type="number" class="form-control" id="suiteRate" name="suiteRate" min="0" step="0.01" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="deluxeRate" class="form-label">Deluxe Room</label>
                        <div class="input-group">
                            <span class="input-group-text">LKR</span>
                            <input type="number" class="form-control" id="deluxeRate" name="deluxeRate" min="0" step="0.01" required>
                        </div>
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Add Hotel</button>
        </form>
    </div>
</div>

                     <!-- Hotels List -->
<div class="card">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-list me-2"></i>All Hotels</h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hotel Name</th>
                        <th>Location</th>
                        <th>Rating</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="hotel" items="${allhotels}">
                        <tr>
                            <td>${hotel.id}</td>
                            <td>${hotel.name}</td>
                            <td>${hotel.location}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${hotel.rating == 5}">★★★★★</c:when>
                                    <c:when test="${hotel.rating == 4}">★★★★☆</c:when>
                                    <c:when test="${hotel.rating == 3}">★★★☆☆</c:when>
                                    <c:when test="${hotel.rating == 2}">★★☆☆☆</c:when>
                                    <c:when test="${hotel.rating == 1}">★☆☆☆☆</c:when>
                                    <c:otherwise>${hotel.rating}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <span class="badge bg-success">Active</span>
                            </td>
                            <td>
                                <td>
    <a href="updateHotel.jsp?id=${hotel.id}&name=${hotel.name}&location=${hotel.location}&description=${hotel.description}&singleRate=${hotel.singleRate}&doubleRate=${hotel.doubleRate}&suiteRate=${hotel.suiteRate}&deluxeRate=${hotel.deluxeRate}&rating=${hotel.rating}&amenities=${hotel.amenities}&imageUrl=${hotel.imageUrl}" class="btn btn-sm btn-primary">
    <i class="fas fa-edit"></i>
</a>
 <form action="DeleteHotelAddServlet" method="post" class="delete-form" style="display:inline;">
        <input type="hidden" name="id" value="${hotel.id}" />
    <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
    </form>
</td>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

                    <!-- Contact Tickets Tab -->
                    <div class="tab-pane fade" id="tickets">
                        <h2 class="mb-4"><i class="fas fa-ticket-alt me-2"></i>Contact Tickets</h2>
                        
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-inbox me-2"></i>Customer Support Tickets</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Ticket ID</th>
                                                <th>Customer</th>
                                                <th>Subject</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>TCK1001</td>
                                                <td>john.doe@example.com</td>
                                                <td>Booking Modification Request</td>
                                                <td>2023-06-10</td>
                                                <td><span class="badge bg-warning">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#replyModal">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>TCK1002</td>
                                                <td>jane.smith@example.com</td>
                                                <td>Refund Request</td>
                                                <td>2023-06-08</td>
                                                <td><span class="badge bg-success">Resolved</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-secondary" disabled>
                                                        <i class="fas fa-check"></i> Replied
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Customer Feedback Tab -->
                    <div class="tab-pane fade" id="feedbacks">
                        <h2 class="mb-4"><i class="fas fa-comment-alt me-2"></i>Customer Feedback</h2>
                        
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-star me-2"></i>Guest Reviews</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Customer</th>
                                                <th>Hotel</th>
                                                <th>Rating</th>
                                                <th>Feedback</th>
                                                <th>Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>FB1001</td>
                                                <td>John Doe</td>
                                                <td>Grand Plaza</td>
                                                <td>★★★★★</td>
                                                <td>Excellent service and facilities!</td>
                                                <td>2023-06-05</td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary">
                                                        <i class="fas fa-reply"></i> Respond
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>FB1002</td>
                                                <td>Jane Smith</td>
                                                <td>Sea View Resort</td>
                                                <td>★★★☆☆</td>
                                                <td>Good but room service was slow</td>
                                                <td>2023-06-03</td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary">
                                                        <i class="fas fa-reply"></i> Respond
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- User Accounts Tab -->
                    <div class="tab-pane fade" id="accounts">
                        <h2 class="mb-4"><i class="fas fa-users me-2"></i>User Accounts</h2>
                        
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-user-cog me-2"></i>All Registered Users</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>User ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Registration Date</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>USR1001</td>
                                                <td>John Doe</td>
                                                <td>john.doe@example.com</td>
                                                <td>+1 234 567 890</td>
                                                <td>2023-01-15</td>
                                                <td><span class="badge bg-success">Active</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                                                    <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>USR1002</td>
                                                <td>Jane Smith</td>
                                                <td>jane.smith@example.com</td>
                                                <td>+1 987 654 321</td>
                                                <td>2023-02-20</td>
                                                <td><span class="badge bg-success">Active</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></button>
                                                    <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activities Tab -->
                    <div class="tab-pane fade" id="activities">
                        <h2 class="mb-4"><i class="fas fa-history me-2"></i>Recent Activities</h2>
                        
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="fas fa-list-ol me-2"></i>System Logs</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="fas fa-user-plus text-success me-2"></i>
                                            New user registered: michael@example.com
                                        </div>
                                        <small class="text-muted">2 minutes ago</small>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="fas fa-hotel text-primary me-2"></i>
                                            Booking created: BK1003 for Grand Plaza
                                        </div>
                                        <small class="text-muted">15 minutes ago</small>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="fas fa-ticket-alt text-warning me-2"></i>
                                            New support ticket: TCK1003
                                        </div>
                                        <small class="text-muted">1 hour ago</small>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="fas fa-star text-info me-2"></i>
                                            New feedback received for Sea View Resort
                                        </div>
                                        <small class="text-muted">3 hours ago</small>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Reply Modal -->
    <div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="replyModalLabel">Reply to Ticket</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="replyMessage" class="form-label">Your Response</label>
                            <textarea class="form-control" id="replyMessage" rows="5"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send Reply</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Activate the first tab
        document.addEventListener('DOMContentLoaded', function() {
            var firstTab = new bootstrap.Tab(document.querySelector('.nav-link.active'));
            firstTab.show();
        });
    </script>
</body>
</html>
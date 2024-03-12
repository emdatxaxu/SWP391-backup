<%-- 
    Document   : marketingDashboard
    Created on : Feb 22, 2024, 18:48:09 PM
    Author     : bxthu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>

<%
    // Kiểm tra xem người dùng đã đăng nhập chưa
    User user = (User) request.getAttribute("user");
    if (user != null) {
        // Nếu đã đăng nhập, kiểm tra vai trò
        int role = (int)(user.getRole().getId());
        if (role != 2 && role != 5) { // Nếu không phải là vai trò 2
            response.sendRedirect("notFoundController"); // Chuyển hướng về trang home
            return; // Dừng xử lý tiếp theo
        }
    } else {
        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
        response.sendRedirect("notFoundController"); // Ví dụ: Chuyển hướng đến trang đăng nhập
        return; // Dừng xử lý tiếp theo
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Manager</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="./admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./admin/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="./admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="./admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="./admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="./admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./admin/css/adminstyle.css" rel="stylesheet" type="text/css" />




        <style type="text/css">

        </style>
    </head>

    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a  class="logo">
                Manager
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                 <div class="navbar-right">


                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            <span>Manager<i class="caret"></i></span>
                        </a>
                        <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                            <li class="dropdown-header text-center">Account</li>
<<<<<<< HEAD
                                <%
                         if(user != null) {
                            int role = (int)(user.getRole().getId());
                            if(role == 2) { %>
                            <li><a href="adminDashboardController">Admin Manager</a></li>
                            <li><a href="saledashboard">Sale</a></li>
                            <li>
                                <a href="saledashboard">Sale Manager</a>
                            </li>
                            <li>
                                <a href="marketingDashboard">Marketing Manager</a>
                            </li>
                            <% } else if (role == 3) { %>
                            <li><a href="saledashboard">Sale</a></li>
                                <% } else if (role == 4) { %>
                            <li><a href="saledashboard">Sale</a></li>
                            <li><a href="saledashboard">Sale Manager</a></li>
                                <% } else if (role == 5) { %>
                            <li><a href="marketingDashboard">Marketing Manager </a></li>
                                <% } } %>
=======
                            <li><a href="marketingDashboard">Marketing Dashboard</a></li>
                            <li><a href="settingblogs">Setting Blogs</a></li>
                            <li><a href="customersList">Customers List</a></li>
                            <li><a href="slidersList">Sliders List</a></li>
                             <li><a href="adminProductList">Product List</a></li>
                            <li><a href="home">Home</a></li>
>>>>>>> bad27f5838e41a702d49893959251126b78fbb31


                            <li>
                                <a href="home"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                            </li>
                        </ul>
                    </li>

                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="./admin/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello</p>



                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="marketingDashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="settingblogs">
                                <i class="fa fa-cog"></i> <span>Setting Blogs</span>
                            </a>
                        </li>

                        <li class="active">
                            <a href="customersList">
                                <i class="fa fa-user"></i> <span>Customers List</span>
                            </a>
                        </li>
                        <li>
                            <a href="slidersList">
                                <i class="fa fa-user"></i> <span>Sliders List</span>
                            </a>
                        </li>
                         <li >
                            <a href="adminProductList">
                                <i class="fa fa-user"></i> <span>ProductList</span>
                            </a>
                        </li>

                        <li>
                            <a href="adminProductList">
                                <i class="fa fa-user"></i> <span>ProductList</span>
                            </a>
                        </li>
                        <li>
                            <a href="home">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>


                    </ul>
                </section>
            </aside>
            <aside class="right-side">

                <div class="row">
                    <div class="col-md-12">
                        <section class="panel">
                            <header class="panel-heading">
                                Customer newly registered
                            </header>
                            <div class="d-flex justify-content-center text-center">
                                <form action="searchCustomer" method="get">
                                    <input name="name" type="search" />
                                    <input type="submit" value="search" />
                                </form>
                            </div>
                            <div class="panel-body table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Email</th>
                                            <th>Full Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                            <!-- <th>Client</th> -->
                                        </tr>
                                    </thead>
                                    <tbody>                                       
                                        <c:forEach items="${customers}" var="item" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1 }</td>
                                                <td>${item.email}</td>
                                                <td>${item.name}</td>
                                                <td>${item.phone}</td>
                                                <td>${item.address}</td>
                                                <td>
                                                    ${item.status == true ? 'active' : 'inactive'} 
                                                    <form action="statusChange?id=${item.id}&&s=${item.status}" method="POST">
                                                        <input type="submit" value="change" />
                                                    </form>
                                                </td>
                                                <!-- <td>Steve</td> -->
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <div class="text-center">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li><a href="?page=1">&laquo;</a></li>
                                        </c:if>
                                        <c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="page">
                                            <c:choose>
                                                <c:when test="${page.index == currentPage}">
                                                <li class="active"><a href="?page=${page.index}">${page.index}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li><a href="?page=${page.index}">${page.index}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage < numberOfPages}">
                                        <li><a href="?page=${numberOfPages}">&raquo;</a></li>
                                        </c:if>
                                </ul>
                            </div>


                    </div><!--end col-6 -->
                </div>
            </aside>

        </div><!--end col-6 -->

    </section>
</div>
<!-- row end -->
<!-- /.content -->
<div class="footer-main">
    LaViBan-2024
</div>
</aside><!-- /.right-side -->s

</div><!-- ./wrapper -->


<!-- jQuery 2.0.2 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="./admin/js/jquery.min.js" type="text/javascript"></script>

<!-- jQuery UI 1.10.3 -->
<script src="./admin/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="./admin/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="./admin/js/plugins/chart.js" type="text/javascript"></script>

<!-- datepicker
    <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
<!-- Bootstrap WYSIHTML5
    <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
<!-- iCheck -->
<script src="./admin/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- calendar -->
<script src="./admin/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

<!-- Director App -->
<script src="./admin/js/Director/app.js" type="text/javascript"></script>

<!-- Director dashboard demo (This is only for demo purposes) -->
<script src="./admin/js/Director/dashboard.js" type="text/javascript"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-- Director for demo purposes -->
<script type="text/javascript">
    $('input').on('ifChecked', function (event) {
        // var element = $(this).parent().find('input:checkbox:first');
        // element.parent().parent().parent().addClass('highlight');
        $(this).parents('li').addClass("task-done");
        console.log('ok');
    });
    $('input').on('ifUnchecked', function (event) {
        // var element = $(this).parent().find('input:checkbox:first');
        // element.parent().parent().parent().removeClass('highlight');
        $(this).parents('li').removeClass("task-done");
        console.log('not');
    });

</script>
<script>
    $('#noti-box').slimScroll({
        height: '400px',
        size: '5px',
        BorderRadius: '5px'
    });

    $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
        checkboxClass: 'icheckbox_flat-grey',
        radioClass: 'iradio_flat-grey'
    });
</script>


</body>

</html>
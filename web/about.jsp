<%-- 
    Document   : about
    Created on : Jan 16, 2024, 6:32:09 PM
    Author     : toanl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image, Model.Cart, Model.CartItem"%>
<%@page import="Dao.ProductsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Electronic Shop</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- bootstrap links -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- bootstrap links -->
        <!-- fonts links -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/testpro4.css">
        <link rel="stylesheet" href="./assets/css/right_banner.css">
        <link rel="stylesheet" href="./assets/css/block-slider.css">
        <link rel="stylesheet" href="./assets/css/phukien.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />


        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="./assets/plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="./assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="./assets/plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="./assets/plugins/slick/slick.css">
        <link rel="stylesheet" href="./assets/plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="./assets/css/style1.css">
        <!-- fonts links -->
    </head>
    <body>

        <!-- top navbar -->
        <!-- top navbar -->

        <!-- navbar -->   <%
           
            User user = (User)session.getAttribute("User");
        %>
        <section class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <div class="contact-number">
                            <i class="tf-ion-ios-telephone"></i>
                            <span>0969146075</span>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Site Logo -->
                        <div class="logo text-center">
                            <a href="home">
                                <!-- replace logo here -->
                                <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="35"
                                   font-family="AustinBold, Austin" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                <text id="AVIATO">
                                <tspan x="108.94" y="325">LaViBan</tspan>
                                </text>
                                </g>
                                </g>
                                </svg>
                            </a>
                        </div>
                    </div> 	
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Cart -->
                        <ul class="top-menu text-right list-inline">
                        <li class="dropdown cart-nav dropdown-slide">
                                <a href="#!" id="cart" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-android-cart"></i>Cart</a>

                                <% if(user != null && user.getRole().getId()==1){%>
                                <input type="text" id="userid" value="<%=user.getId()%>" hidden="">
                                <div class="dropdown-menu cart-dropdown" id="cart-popup">
                                    <!-- Cart Item -->
                                    <!-- / Cart Item -->
                                    <!-- Cart Item -->
                                    <!-- / Cart Item -->

                                    <div class="cart-summary">
                                        <span>Total</span>
                                        <span class="total-price">$1799.00</span>
                                    </div>
                                    <ul class="text-center cart-buttons">
                                        <li><a href="cart?userid=<%= user.getId() %>" class="btn btn-small">View Cart</a></li>
                                        <li><a href="checkout?userid=<%= user.getId() %>" class="btn btn-small btn-solid-border">Checkout</a></li>
                                    </ul>
                                </div>
                                <%}%>
                            </li><!-- / Cart -->

                            <!-- Search -->
                            <li class="dropdown search dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-ios-search-strong"></i> Search</a>
                                <ul class="dropdown-menu search-dropdown">
                                    <li>
                                        <form action="shop"> <input class="text-input" type="text" placeholder="Search product..." value="${search}" name="search">
                                            <input type="hidden" name="action" value="search">
                                        </form>
                                    </li>
                                </ul>
                            </li><!-- / Search -->
                            <li class="dropdown people dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i
                                        class="tf-ion-ios-person-outline"></i> Account</a>
                                <div class="dropdown-menu">
                                    <div class="row">

                                        <!-- Introduction -->						

                                        <!-- Contact -->


                                        <!-- Utility -->


                                         <ul>
                                            <li class="dropdown-header"><%= user != null ? user.getName() : "" %></li>
                                            <li role="separator" class="divider"></li>
                                                <% if(user == null) { %>
                                            <li><a href="login">Login</a></li>
                                            <li><a href="register">Sign up</a></li>
                                            <li><a href="resetpassword">Forget Password</a></li>
                                                <% } else { %>
                                                <% if(user != null) {
                                                    int role = (int)(user.getRole().getId());
                                                    if(role == 2) { %>
                                            <li><a href="adminDashboardController">Admin Manager</a></li>
                                            <li><a href="saledashboard">Sale Manager</a></li>
                                            <li><a href="marketingDashboard">Marketing Manager</a></li>
                                                <% } else if(role == 3 || role == 4) { %>
                                            <li><a href="saledashboard">Sale Manager</a></li>
                                                <% } else if(role == 5) { %>
                                            <li><a href="marketingDashboard">Marketing Manager</a></li>
                                                <% } else if(role == 1) { %>
                                            <li><a href="myorder">My Order</a></li>

                                            <% }
        } %>

                                            <li><a href="userController">User Profile</a></li>
                                            <li><a href="changePassword">Change Password</a></li>
                                            <li><a href="logout">Logout</a></li>
                                                <% } %>
                                        </ul>



                                        <!-- Mega Menu -->

                                    </div><!-- / .row -->
                                </div>
                            </li><!-- / Search -->

                            <!-- Languages -->


                        </ul><!-- / .nav .navbar-nav .navbar-right -->
                    </div>
                </div>
            </div>
        </section>
        <section class="menu">
            <nav class="navbar navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <h2 class="menu-title">Main Menu</h2>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div><!-- / .navbar-header -->

                    <!-- Navbar Links -->
                    <div id="navbar" class="navbar-collapse collapse text-center">
                        <ul class="nav navbar-nav">

                            <!-- Home -->
                            <li class="dropdown ">
                                <a href="home">Home</a>
                            </li><!-- / Home -->


                            <!-- Elements -->
                            <li class="dropdown dropdown-slide">
                                <a href="shop" >Shop
								</a>
                            </li><!-- / Elements -->


                            <!-- Pages -->
                            <li class="dropdown dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                                   role="button" aria-haspopup="true" aria-expanded="false">Pages <span
                                        ></span></a>
                                <div class="dropdown-menu">
                                    <div class="row">

                                        <!-- Introduction -->
                                        <div class="col-sm-6 col-xs-12">
                                            <ul>
                                                <li class="dropdown-header">Introduction</li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="contact.jsp">Contact Us</a></li>
                                                <li><a href="about.jsp">About Us</a></li>
                                            </ul>
                                        </div>

                                        <!-- Contact -->


                                        <!-- Mega Menu -->
                                        <div class="col-sm-6 col-xs-12">
                                            <a href="shop.html">
                                                <img class="img-responsive" src="images/c5.png" alt="menu image" />
                                            </a>
                                        </div>
                                    </div><!-- / .row -->
                                </div><!-- / .dropdown-menu -->
                            </li><!-- / Pages -->




                            <!-- Blog -->
                            <li class="dropdown dropdown-slide">
                                <a href="blog" >Blog
                                </a>

                            </li><!-- / Blog -->

                            <!-- Shop -->

                        </ul><!-- / .nav .navbar-nav -->

                    </div>
                    <!--/.navbar-collapse -->
                </div><!-- / .container -->
            </nav>
        </section>

        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">About Us</h1>
                            <ol class="breadcrumb">
                                <li><a href="home">Home</a></li>
                                <li class="active">about us</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- navbar -->
        <section class="about section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img class="img-responsive" src="images/iphone__ky2k6x5u6vue_og.png">
                    </div>
                    <div class="col-md-6">
                        <h2 class="mt-40">General principles:</h2>
                        <p>- LaViBan Shop website is owned by the SWP project of FPT school, developed, operated and operated by group 1 of class SE1751. The target audience is all customers who want to purchase or place orders through e-commerce websites.</p>

                        <p>- Products sold at Electronic Shop must fully meet state regulations on origin, origin of goods, and product quality.</p>

                    </div>
                </div>

            </div>
        </section>
        <section class="team-members ">
            <div class="container">
                <div class="row">
                    <div class="title"><h2>Team Members</h2></div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="team-member text-center">
                            <img class="img-circle" src="images/team/team-1.jpg">
                            <h4>Nguyen Manh Hieu</h4>
                            <p>Founder</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member text-center">
                            <img class="img-circle" src="images/team/team-1.jpg">
                            <h4>Hoang Manh Toan</h4>
                            <p>Developer</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member text-center">
                            <img class="img-circle" src="images/team/team-2.jpg">
                            <h4>Duong Thanh Dat</h4>
                            <p>Developer</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member text-center">
                            <img class="img-circle" src="images/team/team-3.jpg">
                            <h4>Bui Thi Xuan Thu</h4>
                            <p>Developer</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="team-member text-center">
                            <img class="img-circle" src="images/team/team-1.jpg">
                            <h4>Nghiem Phu Duc</h4>
                            <p>Developer</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>














        <!-- offer -->

        <!-- offer -->






        <!-- newslater -->
        <!-- newslater -->






        <!-- footer -->
        <footer class="footer section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="social-media">
                            <li>
                                <a href="https://www.facebook.com/profile.php?id=100012285902227">
                                    <i class="tf-ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://gitlab.com/Mhieu26/group1-se1751">
                                    <i class="tf-ion-social-github"></i>
                                </a>
                            </li>
                            <li>
                                <a href="mailto:nguyenmanhhieu267@gmail.com">
                                    <i class="tf-ion-social-google-outline"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="footer-menu text-uppercase">
                            <li>
                                <a href="contact.jsp">CONTACT</a>
                            </li>
                            <li>
                                <a href="shop">SHOP</a>
                            </li>
                            <li>
                                <a href="blog">Blog</a>
                            </li>
                            <li>
                                <a href="about.jsp">About</a>
                            </li>
                        </ul>
                        <p class="copyright-text">Copyright &copy;2021, Designed &amp; Developed by Themefisher</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer -->







        <a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>













        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>

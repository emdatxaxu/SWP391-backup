<%-- 
    Document   : blog.jsp
    Created on : Jan 19, 2024, 3:17:14 PM
    Author     : bxthu
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Products, Model.User, Model.Image, Model.Cart, Model.CartItem"%>
<%@page import="Dao.ProductsDAO"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LaViBan</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <!-- bootstrap links -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- bootstrap links -->
        <!-- fonts links -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <!-- fonts links -->
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
            />
        <link rel="stylesheet" href="./assets/css/style1.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <link rel="preload" href="https://static.cellphones.com.vn/css/bc726cb.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/c8890e7.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/8b24af9.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/8019e2f.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/7c5b2c4.css" as="style">
        <link rel="preload" href="https://static.cellphones.com.vn/css/380ebf8.css" as="style"> 
        <link rel="preload" href="https://static.cellphones.com.vn/css/ee84d5b.css" as="style">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/bc726cb.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/c8890e7.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/8b24af9.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/8019e2f.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/7c5b2c4.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/380ebf8.css">
        <link rel="stylesheet" href="https://static.cellphones.com.vn/css/ee84d5b.css">
        <link data-n-head="ssr" rel="icon" type="image/x-icon" href="https://cdn2.cellphones.com.vn/200x/media/favicon/default/logo-cps.png">
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
    </head>
    <body id="body"><!-- top navbar -->
        <%
                    Image img = (Image)session.getAttribute("avatar");
                    String googleAvt = (String)session.getAttribute("GoogleAvatar");
                    String avt = (img == null) ? 
                            (googleAvt == null ? "https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-479x512-n8sg74wg.png" : googleAvt) 
                            : img.getSource();
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
                                        <form class="d-flex" id="search" action="blog">
                                            <input class="form-control me-2" name="search" type="search" placeholder="Search" aria-label="Search">                                         
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

                            <!-- Elements -->



                            <!-- Pages -->
                            <li class="dropdown dropdown-slide">
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                                   role="button" aria-haspopup="true" aria-expanded="false">Pages <span
                                        class="tf-ion-ios-arrow-down"></span></a>
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
        <!-- navbar -->

        <div class="container" id="about">           
            <p class="right-align">
                <fmt:parseDate value="${blog.getPostedDate()}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${parsedDateTime}" /> <br>
                Tác giả : ${blog.getAuthor()}               
                <a href="blog" class="btn btn-secondary"> Back to Blogs List</a>
                <c:if test="${User != null}">
                    <c:if test="${User.getRole().getId() == 2 || User.getRole().getId() == 5}">
                        <a href="settingblogs" class="btn btn-secondary ms-2">
                            Setting Blogs
                        </a>
                    </c:if>
                </c:if>

            </p><div style="text-align:center;">
                <h2>${blog.getTitle()}</h2>
                <img src="${blog.getImage()}" alt=""  width="1000" height="500">

            </div>


        </div>
        <br>
        <div class="container" id="about">  
        <div class="right-align">
            ${blog.getBriefinfo()}
            <br>
            ${blog.getContent()}
            <br><br><br>
        </div></div>


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











        <script src="./assets/plugins/jquery/dist/jquery.min.js"></script>

        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="./assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

        <script src="./assets/plugins/instafeed/instafeed.min.js"></script>

        <script src="./assets/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
        <script src="./assets/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

        <script src="./assets/plugins/slick/slick.min.js"></script>
        <script src="./assets/plugins/slick/slick-animation.min.js"></script>


        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="./assets/plugins/google-map/gmap.js"></script>


        <script src="./assets/js/script.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="./assets/js/app.js"></script>
        <script src="./assets/js/product_card.js"></script>
        <script src="./assets/js/menu.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js" integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>


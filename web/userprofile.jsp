<%-- 
    Document   : userprofile
    Created on : Jan 18, 2024, 11:47:16 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.usebootstrap.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/userprofile.css">
        <title>UserProfile</title>
    </head>

    <body style="background-color: rgb(21, 44, 129) " >
        <div style="padding-top: 50px">


            <div class="container">
                <div class="row gutters d-block " >
                    <form action="userController" method="post">
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="account-settings">
                                        <div class="user-profile">
                                            <div class="user-avatar">
                                                <img src="${requestScope.img.source}" alt="fail"
                                                     >
                                            </div>
                                                     <br><!-- comment -->
                                            <h6 class="user-email">${requestScope.user.email}</h6>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 title-user">
                                            <h2 style="color: #ffc800" >Personal Details</h2>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input  name="name" type="text" class="form-control" id="fullName" placeholder="Enter full name" value="${requestScope.user.name}" >
                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="phone">Phone</label>
                                                <input name="phone" type="number" class="form-control" id="email" placeholder="Phone" value="${requestScope.user.phone}">
                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group ">
                                             
                                                <input type="radio" name="gender" value="1" checked="">Male<!-- comment -->
                                                <input type="radio" name="gender" value="0" >FeMale<!-- comment -->

                                            </div>
                                        </div>



                                    </div>
                                    <div class="row gutters">

                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                <label for="Street">Address </label>
                                                <input type="name"  name="address" class="form-control" id="Street" placeholder="Enter Address" value="${requestScope.user.address}">
                                            </div>
                                        </div>



                                    </div>
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label for="profilePicture">Change Profile Picture</label>
                                            <input name="image" type="file" class="form-control-file" id="profilePicture">
                                        </div>
                                        <div class="row gutters">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="text-right">
                                                                                            
                                                                                                    <a   class="btn btn-secondary back" href="home" >Cancel</a>
                                                                                            <button type="submit" name="submit"
                                                                                                    class="btn btn-success btn-primary " style="background-color: #ffc800">Update</button> 
<!--                                                   

-->                                                    
                                                </div>
                                                 <H6>${requestScope.msg}</H6>
                                            </div><!--<!--
-->                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
    </body>

</html>

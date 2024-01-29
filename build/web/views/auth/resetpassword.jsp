<%-- 
    Document   : resetpassword
    Created on : Jan 22, 2024, 7:56:27 AM
    Author     : ducnp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- fonts links -->
    </head>
    <body>
        <div class="container" id="changepassword">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center">Reset Password</h3>
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Reset Password</h3>
                    <div class="input2 text-center">
                        <div class="row">
                            <form method="post" action="resetpassword" class="changePW">
                                <div class="col-md-12">
                                    <input type="email" placeholder="Please input your email here" name="email" required="">
                                </div>
                                <div style="color: red">${requestScope.error}</div>
                                <div style="color: green">${requestScope.report}</div>
                                <button type="submit" class="btn" >Send</button>
                            </form>


                        </div>
                    </div>

                    <p class="text-center "><a href="home" >Back to home</a></p>
                </div>

            </div>
        </div>
        <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html> 

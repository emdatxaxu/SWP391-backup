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
        <style>
            .changePW .btn{
                color: #ffc800;
                cursor: pointer;
                margin-top: 20px;
                font-weight: 600;
            }
            .changePW .btn:hover{
                background-color:rgb(21, 44, 129)
            }
            .error {
                color: red;
            }
        </style>
    </head>

    <body>

        <!-- top navbar -->

        <!-- top navbar -->

        <!-- navbar -->

        <!-- navbar -->




        <div class="container" id="changepassword">
            <div class="row">
                <div class="col-md-5 py-3 py-md-0" id="side1">
                    <h3 class="text-center">Change Password</h3>
                </div>
                <div class="col-md-7 py-3 py-md-0" id="side2">
                    <h3 class="text-center">Reset Password</h3>
                    <div class="input2 text-center">
                        <div class="row">
                            <form method="post" action="resetpass" onsubmit="return validateForm()" class="changePW">
                                <input type="text" name="email" value="${requestScope.email}" readonly="${requestScope.email}">
                                <div class="col-md-12">
                                    <input type=password id="password" name="password" placeholder="New Password">
                                </div>
                                <div class="col-md-12">
                                    <input type=password id="confirmPassword" placeholder="Repeat Your New Password">
                                </div>
                                <p id="passwordMatchError" class="error"></p>
                                <button type="submit" class="btn" >Save</button>
                            </form>


                        </div>
                    </div>

                    <p class="text-center "><a href="home" >Back to home</a></p>
                </div>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <a href="home" class="arrow"><i><img src="./images/home-icon.png" alt=""></i></a>
        <script>
            function validateForm() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var passwordMatchError = document.getElementById("passwordMatchError");
                if (password !== confirmPassword) {
                    passwordMatchError.textContent = "Passwords do not match";
                    return false;
                } else {
                    passwordMatchError.textContent = "";
                    return true;
                }
            }
            
        </script>
       
    </body>
</html>
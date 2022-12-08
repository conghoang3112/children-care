<%-- 
    Document   : newjsp
    Created on : Nov 29, 2022, 3:51:36 PM
    Author     : congh
--%>
<!--<link href="css/login.css" rel="stylesheet" type="text/css"/>-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<html>
    <head>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="../src/java/CSS/login.css"/>-->
        <!--<link href="../src/java/CSS/login.css" rel="stylesheet" type="text/css"/>-->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <body id="LoginForm">
        <div class="container">
            <h1 class="form-heading">login Form</h1>
            <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                        <p>Please enter your user name and password</p>
                    </div>
                    <form method="post" action="loginController">

                        <div class="form-group">
                            <input name="username" class="form-control" id="inputEmail" placeholder="User name">
                        </div>
                        <div class="form-group">
                            <input name="password" class="form-control" id="inputPassword" placeholder="Password">
                        </div>
                        <div class="forgot">
                            <a href="reset.html">Forgot password?</a>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                        <a>${mess}</a>

                    </form>
                </div>
            </div></div></div>


</body>
</html>


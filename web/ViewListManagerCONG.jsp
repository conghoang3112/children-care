<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<link href="css/ViewUser.css" rel="stylesheet" type="text/css"/>
<center>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/header.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <script>
        // Page loadinmg animation

        if ((".loader").length) {
            // show Preloader until the website ist loaded
            $(window).on('load', function () {
                $(".loader").fadeOut("slow");
            });
        }

        /* Onpage linkng smooth effect */

        $('a[href^="#"]').on('click', function (event) {

            var target = $($(this).attr('href'));

            if (target.length) {
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000);
            }

        });

// Sticky Header
        $(window).scroll(function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 100) {
                $(".top-nav").addClass("light-header");
            } else {
                $(".top-nav").removeClass("light-header");
            }
        });

// Year for copy content
        $(function () {
            var theYear = new Date().getFullYear();
            $('#year').html(theYear);
        });


    </script>
    <body>
        <div class="row">
            <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <!------ Include the above in your HEAD tag ---------->

            <nav class="navbar navbar-expand-md fixed-top top-nav" style="background-color: black">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html"><strong>Hi ${sessionScope.acc.username} !</strong></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"><img src="https://grafreez.com/wp-content/temp_demos/razor/img/icons/menu.png"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                        <ul class="navbar-nav m-auto text-sm-center text-md-center">
                            <!--                            <li class="nav-item">
                                                            <a class="nav-link" href="home">Home</a>
                                                        </li>-->-->
                            <li class="nav-item">
                                <a class="nav-link" href="listUserController">User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listManagerController">Manager</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listDoctorController">Doctor</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logoutController">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </body>     


    <div class="row mt-5">
        <div class="container mt-3 mb-4">
            <div class="col-lg-9 mt-4 mt-lg-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                            <table class="table manage-candidates-top mb-0">
                                <thead>
                                    <tr>
                                        <th>List manager</th>
                                        <!--<th class="text-center">Status</th>-->
                                        <th class="action text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${list}" var="o">
                                        <tr class="candidates-list">
                                            <td class="title">
                                                <div class="thumb">
                                                    <img class="img-fluid" src="${o.avata}" alt="">
                                                </div>
                                                <div class="candidate-list-details">
                                                    <div class="candidate-list-info">
                                                        <div class="candidate-list-title">
                                                            <h5 class="mb-0"><a style="margin-left: 40px">${o.firstName} ${o.lastname}</a></h5>
                                                        </div>
                                                        <div class="candidate-list-option">
                                                            <ul class="list-unstyled">
                                                                <li><i class="fa fa-mobile"></i> ${o.phone}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                                    <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</center>
<%-- 
    Document   : ViewUserProfile
    Created on : Dec 7, 2022, 10:44:32 AM
    Author     : duan1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AddConservation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>

    <body>
        <div class="row border border-bottom " style="background-image:url('asset/features/feature-01.jpg');background-size: cover;height:200px; width: 100%;">

            <div class="col-3 d-flex justify-content-center">
                <div class="row d-flex align-content-center">
                    <a class="logo" href="#">

                        <H2>Home</H2>

                    </a>
                </div>

            </div>

            <div class="col-6  d-flex justify-content-center">
                <div class="row d-flex align-content-center">
                    <h2>Childrent Care</h2>
                </div>


            </div>
            <div class="col-3 d-flex justify-content-end ">
                <div class="row d-flex align-content-center">
                    <i></i>
                </div>


            </div>

        </div>

        <div class="row" style="    height: 25px;background-color: lightskyblue; width: 100%;">
            <nav class="d-flex justify-content-evenly">
                <a href="#">Service</a> |
                <a href="#">Conservation</a> |
                <a href="#">Doctor</a> |
                <a href="#">Special</a>
            </nav>
        </div>
        <div class="row ">
            <div class="container">

                <div class="row ">
                    <div class="col-8 border border-end-1 ">
                        <div class="row d-flex flex-row">
                            <div class="col pt-5 text-center">
                                <Label>Firt Name:</Label>
                            </div>
                            <div class="col pt-5">


                                <Label>${user.firstName}</Label>


                            </div>
                            <hr>
                        </div>
                        <div class="row  ">
                            <div class="col pt-5 text-center">
                                <Label>Last Name:</Label>

                            </div>
                            <div class="col pt-5">
                                <Label>${user.lastName}</Label>
                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="col pt-5 text-center">
                                <Label>Phone:</Label>

                            </div>
                            <div class="col pt-5">
                                <Label>${user.phone}</Label>
                            </div>
                            <hr>
                        </div>
                        <div class="row  ">
                            <div class="col pt-5 text-center">
                                <Label>Sex:</Label>

                            </div>
                            <div class="col pt-5">
                                <Label>

                                    <c:if test="${user.sex =='true'}">Male</c:if>
                                    <c:if test="${user.sex =='false'}">FeMale</c:if>
                                    </Label>
                                </div>
                                <hr>
                            </div>
                            <div class="row">
                                <div class="col pt-5 text-center">
                                    <Label>Address:</Label>

                                </div>
                                <div class="col pt-5">
                                    <Label>${user.address}</Label>

                            </div>
                            <!--                            <hr>-->
                        </div>
                        <!--                        <div class="row pt-5 ">
                                                    <div class="col text-center">
                                                        <Label>Age:</Label>
                        
                                                    </div>
                                                    <div class="col">
                                                        <Label>22</Label>
                        
                                                    </div>
                        
                                                </div>-->


                    </div>
                    <div class="col-4 d-flex flex-column align-items-center justify-content-center">

                        <div class=" d-flex flex-column  justify-content-center align-items-center"
                             style="width:302px;height:302px;border:1px solid #000 ;background-size: cover;">

                             <img style=" background-size: cover ;height: 300px ;width: 300px"  src="asset/doctors/doctor-01.jpg" class="img-fliud text-center " alt="avata" />
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class=" col-6 ps-5 pt-2 text-center" >
                        <a  class="btn btn-primary" href="${s}/UpdateUserController" role="button">Update Profile</a>
                    </div>

                </div>





            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>

</html>
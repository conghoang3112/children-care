<%-- 
    Document   : UpdateUserProfile
    Created on : Dec 7, 2022, 10:45:28 AM
    Author     : duan1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UpdateUserProfile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>
    <div class="row border border-bottom" style="background-color:aliceblue;height: 200px; width: 100%;">

        <div class="col-3 d-flex justify-content-center">
            <div class="row d-flex align-content-center">
                <a class="logo" href="HomeUser.jsp">
                    <img src="" height="24" class="logo-light-mode" alt="Logo">

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
                <i>account</i>
            </div>


        </div>

    </div>

    <div class="row" style="    height: 25px;background-color: lightskyblue; width: 100%;">
          <nav class="d-flex justify-content-evenly">
            <a href="/children-care/ViewProifleUserController">UsserProfile</a> |
            <a href="/children-care/ListAllDoctorController">Doctor</a> |
            <a href="/children-care//ViewReservation">All Reservation</a> |
            <a href="/children-care/ViewCompletedReservaiotionController">Completed Reservation</a>|
            <a href="/children-care/ViewRequestRe">Upcoming calendar</a>|
            <a href="/children-care/ListFeedbackReply">Feedback</a>
            
        </nav>
    </div>
    <div class="row ">
        <div class="container">
            <form action="UpdateUserProfileController" method="POST">
                <div class="row ">
                    <div class="col-8 border border-end-1 ">s
                        <div class="row d-flex flex-row">
                            <div class="col pt-5 text-center">
                                <Label>Firt Name:</Label>
                            </div>
                            <div class="col pt-5">
                                <Input value="${update.firstName}" name="fisrtName" type="text" required></Input>
                            </div>
                            <hr>
                        </div>
                        <div class="row  ">
                            <div class="col pt-5 text-center">
                                <Label>Last Name:</Label>

                            </div>
                            <div class="col pt-5">
                                <Input value="${update.lastName}" name="lastName" type="text" required></Input>
                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="col pt-5 text-center">
                                <Label>Phone:</Label>

                            </div>
                            <div class="col pt-5">
                                <Input value="${update.phone}" name="phone" type="text" required></Input>
                            </div>
                            <hr>
                        </div>
                        <div class="row  ">
                            <div class="col pt-5 text-center">
                                <Label>Sex:</Label>

                            </div>
                            <div class="col pt-5">
                                <div class="row ">
                                    
                                    <div class="col d-flex">
                                        <input type="radio" id="Male" name="sex" value="Male" <c:if test="${update.sex =='true'}">checked</c:if>>
                                        
                                          <label for="Male">Male</label><br>
                                        
                                    </div>
                                    <div class="col">
                                       
                                            <input type="radio" id="Female" name="sex" value="FeMale"  <c:if test="${update.sex =='false'}"> checked</c:if>>
                                          <label for="Female">Female</label><br>
                                       
                                    </div>
                                </div>



                            </div>
                            <hr>
                        </div>
                        <div class="row">
                            <div class="col pt-5 text-center">
                                <Label>Address:</Label>

                            </div>
                            <div class="col pt-5">
                                <Input value="${update.address}" name="address" type="text" required></Input>

                            </div>
                           
                        </div>
                       


                    </div>
                    <div class="col-4 d-flex flex-column align-items-center justify-content-center">

                        <div class="row d-flex flex-column  justify-content-center align-items-center"
                            style="width:301px;height:301px;border:1px solid #000;">

                            <img src="" class="rounded-3 text-center " style="width: 300px;" alt="Avatar" />
                        </div>
                        <div class="row d-flex flex-row justify-content-center align-items-center">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="chosefileimage">
                                <label class="custom-file-label" for="chosefileimage"></label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class=" col-6 ps-5 pt-2 text-center">
                        <button class="btn btn-primary" type="submit">Update Profile</button>
                    </div>

                </div>


            </form>


        </div>
    </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>

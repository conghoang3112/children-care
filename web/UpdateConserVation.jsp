<%-- 
    Document   : AddConservation
    Created on : Dec 7, 2022, 12:08:15 AM
    Author     : duan1
--%>

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
    <div class="row border border-bottom" style="background-color:aliceblue;height: 200px; width: 100%;">

        <div class="col-3 d-flex justify-content-center">
            <div class="row d-flex align-content-center">
                <a class="logo" href="#">
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
            <a href="#">Service</a> |
            <a href="#">Conservation</a> |
            <a href="#">Doctor</a> |
            <a href="#">Special</a>
        </nav>
    </div>
    <div class="row ">
        <div class="container">
            <form>
                <div class="col ">
                    <div class="row  d-flex ">

                        <div class="col ms-5 mt-5">
                            <label for="Special">Slect Special:</label>
                            <select name="Special" id="Special">
                                <option value="A">a</option>
                                <option value="B">b</option>
                                <option value="C">c</option>
                                <option value="D">d</option>
                            </select>
                        </div>
                        <div class="col ms-5 mt-5">
                            <label for="Doctor">Slect Doctor:</label>
                            <select name="Doctor" id="Doctor">
                                <option value="A">a</option>
                                <option value="B">b</option>
                                <option value="C">c</option>
                                <option value="D">d</option>
                            </select>
                        </div>


                    </div>
                    <div class="row  d-flex ">

                        <div class="col ms-5 mt-5">
                            <label for="Special">Slect Date:</label>
                            <select name="Special" id="Special">
                                <option value="A">a</option>
                                <option value="B">b</option>
                                <option value="C">c</option>
                                <option value="D">d</option>
                            </select>
                        </div>
                        <div class="col ms-5 mt-5">
                            <label for="Doctor">Slect Time:</label>
                            <select name="Doctor" id="Doctor">
                                <option value="A">a</option>
                                <option value="B">b</option>
                                <option value="C">c</option>
                                <option value="D">d</option>
                            </select>
                        </div>


                    </div>
                    <div class="row  d-flex ">

                        <div class="col ms-5 mt-5">
                            <label for="Method">Slect Method:</label>
                            <select name="Method" id="Method">
                                <option value="A">Online</option>

                            </select>
                        </div>



                    </div>

                    <div class="row   ">

                        <div class="col ms-5 mt-5">
                            <label for="Issue">Health Issue:</label>
                            <textarea name="Issue" rows="4" cols="150">

                    </textarea>
                        </div>



                    </div>
                    <div class="row   ">

                        <div class="col ms-5 mt-5">

                            <button type="submit" value="">Update</button>
                        </div>



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
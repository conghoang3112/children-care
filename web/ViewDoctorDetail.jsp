<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListDoctor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
                <i>account:12</i>
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
    <div class="row justify-content-center">
        <h2>Doctor Profile</h2>
        <div class="col-8 mt-5">
            
        </div>

    </div>
    </div>
    </div>
    </div>

    </div>


    <script type="text/javascript">
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = String(date.getDate() + 1).padStart(2, '0');
        var pattern = year + '-' + month + '-' + day;
        document.getElementById("phone").value = "1"
        //var partt
        document.getElementById("date").value = pattern;




        function checkdate() {

            var datepick = document.getElementById("date").value;

            if (datepick < pattern) {
                alert("time must be more than now")
                document.getElementById("date").value = pattern;
                document.getElementById("myForm").submit();


            }
            else {
                document.getElementById("date").value = datepick;
                //document.getElementById("myForm").submit();


            }
            document.getElementById("date").value = datepick;
        }
//        document.write(datePattern);








    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</body>

</html>
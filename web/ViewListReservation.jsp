<%@page import="java.sql.PreparedStatement"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Reservation</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
                <div class="row d-flex justify-content-center" style="text-align: center;">
                    <div class="col-8 pt-5">
                        
                        <form action="ViewReservation" method="GET">
                            <input  value="${uid}" type="hidden" name="uid" id="uid"/>
                            <table class=" table table-bordered pt-5">
                                <tr>
                                    <th>Doctor Name</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                <%
                                        try {
                                            String sql = "select p.first_name,p.last_name,r.date_booking,t.slot_time,r.[status],r.reservation_id from  DoctorProfile p ,Doctor d ,Reservation r,TimeSlot t where p.profile_id=d.profile_id and d.doctor_id=r.doctor_id and r.time_slot_id =t.slot_id  and r.[user_id]=?";
                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                                             
                                            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ChildrenCare;User=sa;Password=sa");
                                            PreparedStatement ps = con.prepareStatement(sql);
                                            //ps.setString(1,);
                                            ps.setInt(1,Integer.parseInt(request.getAttribute("uid").toString()));
                                            ResultSet rs = ps.executeQuery();
                                            while (rs.next()) {
                                             
                                    %>
                                    <tr>
                                        <td><%=rs.getString("first_name")%>&nbsp;<%=rs.getString("last_name")%></td>
                                        <td><%=rs.getString("date_booking")%></td>
                                        <td><%=rs.getString("slot_time")%></td>
                                        <td><%=rs.getString("status")%></td>
                                        <td><a href="ViewDetail?reid=<%=rs.getString("reservation_id")%>">View</a></td>
                                        
                                    </tr>
                                    
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                    %>
                                
                            </table>
                        </form>


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


            } else {
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
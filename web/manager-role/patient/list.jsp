<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Children Care</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/manager-role/assets/images/favicon.ico.png">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- simplebar -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
    <!-- Icons -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
    <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
    <!-- Css -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

</head>

<body>
<!-- Loader -->
<div id="preloader">
    <div id="status">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
</div>
<!-- Loader -->

<div class="page-wrapper doctris-theme toggled">
    <jsp:include page="../common/sidebar.jsp"></jsp:include>

    <!-- Start Page Content -->
    <main class="page-content bg-light">
        <jsp:include page="../common/header.jsp"></jsp:include>

        <div class="container-fluid">
            <div class="layout-specing">
                <div class="d-md-flex justify-content-between">
                    <h5 class="mb-0">Patients List</h5>

                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                            <li class="breadcrumb-item"><a href="index.html">ChildrenCare</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Patients</li>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-12 mt-4">
                        <div class="table-responsive shadow rounded">
                            <table class="table table-center bg-white mb-0">
                                <thead>
                                <tr>
                                    <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                    <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                    <th class="border-bottom p-3">Age</th>
                                    <th class="border-bottom p-3">Gender</th>
                                    <th class="border-bottom p-3">Address</th>
                                    <th class="border-bottom p-3">Mobile No.</th>
                                    <th class="border-bottom p-3">Department</th>
                                    <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                    <th class="border-bottom p-3">Time</th>
                                    <th class="border-bottom p-3">Status</th>
<%--                                    <th class="border-bottom p-3" style="min-width: 100px;"></th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${patientList}" var="patient" varStatus="loop">
                                    <tr>
                                        <th class="p-3">${loop.index + 1}</th>
                                        <td class="py-3">
                                            <a href="${pageContext.request.contextPath}/patientProfile?patientId=${patient.id}" class="text-dark">
                                                <div class="d-flex align-items-center">
                                                    <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/${patient.avatar}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                    <span class="ms-2">${patient.name}</span>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="p-3">${patient.age}</td>
                                        <td class="p-3">${patient.sex == false ? "Male" : "Female"}</td>
                                        <td class="p-3">${patient.user.address}</td>
                                        <td class="p-3">${patient.user.phone}</td>
                                        <td class="p-3">${patient.reservation.doctor.specialist.name}</td>
                                        <td class="p-3"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${patient.reservation.dateBooking}" /></td>
                                        <td class="p-3">${patient.reservation.timeSlot.slotTime}</td>
                                        <td class="p-3"><span class="badge bg-soft-success">${patient.reservation.status}</span></td>
<%--                                        <td class="text-end p-3">--%>
<%--                                            <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewprofile"><i class="uil uil-eye"></i></a>--%>
<%--                                            <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#editprofile"><i class="uil uil-pen"></i></a>--%>
<%--                                            <a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>--%>
<%--                                        </td>--%>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!--end row-->

                <c:if test="${totalPage > 1}">
                <div class="row text-center">
                    <!-- PAGINATION START -->
                    <div class="col-12 mt-4">
                        <div class="d-md-flex align-items-center text-center justify-content-between">
                            <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/patients?pageNumber=${currentPage - 1}" aria-label="Previous">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${totalPage}">
                                    <li class="page-item ${i == currentPage ? ' active' : ''}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/patients?pageNumber=${i}" href="#">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${currentPage < totalPage}">
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/patients?pageNumber=${currentPage + 1}" aria-label="Next">Next</a></li>
                                </c:if>
                            </ul>
                        </div>
                </div><!--end col-->
                <!-- PAGINATION END -->
                </c:if>


            </div>
        </div><!--end container-->

        <jsp:include page="../common/footer.jsp"></jsp:include>
    </main>
    <!--End page-content" -->
</div>
<!-- page-wrapper -->

<!-- Modal start -->
<!-- Profile Settings Start -->
<div class="modal fade" id="editprofile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Profile Settings</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                    </div><!--end col-->

                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                        <h6 class="">Upload your picture</h6>
                        <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                    </div><!--end col-->

                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                        <a href="#" class="btn btn-primary">Upload</a>
                        <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                    </div><!--end col-->
                </div><!--end row-->

                <form class="mt-4">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">First Name</label>
                                <input name="name" id="name" type="text" class="form-control" placeholder="First Name :">
                            </div>
                        </div><!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Last Name</label>
                                <input name="name" id="name2" type="text" class="form-control" placeholder="Last Name :">
                            </div>
                        </div><!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Your Email</label>
                                <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                            </div>
                        </div><!--end col-->

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Phone no.</label>
                                <input name="number" id="number" type="text" class="form-control" placeholder="Phone no. :">
                            </div>
                        </div><!--end col-->

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Your Bio Here</label>
                                <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Bio :"></textarea>
                            </div>
                        </div>
                    </div><!--end row-->

                    <div class="row">
                        <div class="col-sm-12">
                            <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes">
                        </div><!--end col-->
                    </div><!--end row-->
                </form><!--end form-->
            </div>
        </div>
    </div>
</div>
<!-- Profile Settings End -->

<!-- Profile Start -->
<div class="modal fade" id="viewprofile" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel1">Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <div class="d-flex align-items-center">
                    <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/01.jpg" class="avatar avatar-small rounded-pill" alt="">
                    <h5 class="mb-0 ms-3">Howard Tanner</h5>
                </div>
                <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                    <li>
                        <ul class="list-unstyled mb-0">
                            <li class="d-flex">
                                <h6>Age:</h6>
                                <p class="text-muted ms-2">25 year old</p>
                            </li>

                            <li class="d-flex">
                                <h6>Gender:</h6>
                                <p class="text-muted ms-2">Male</p>
                            </li>

                            <li class="d-flex">
                                <h6 class="mb-0">Department:</h6>
                                <p class="text-muted ms-2 mb-0">Cardiology</p>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="list-unstyled mb-0">
                            <li class="d-flex">
                                <h6>Date:</h6>
                                <p class="text-muted ms-2">20th Dec 2020</p>
                            </li>

                            <li class="d-flex">
                                <h6>Time:</h6>
                                <p class="text-muted ms-2">11:00 AM</p>
                            </li>

                            <li class="d-flex">
                                <h6 class="mb-0">Doctor:</h6>
                                <p class="text-muted ms-2 mb-0">Dr. Calvin Carlo</p>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Profile End -->
<!-- Modal end -->

<!-- javascript -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/simplebar.min.js"></script>
<!-- Icons -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/app.js"></script>

</body>

</html>

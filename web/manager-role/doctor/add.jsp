<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- Select2 -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/select2.min.css" rel="stylesheet" />
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
                    <h5 class="mb-0">Add New Doctor</h5>

                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                            <li class="breadcrumb-item"><a href="index.html">ChildrenCare</a></li>
                            <li class="breadcrumb-item"><a href="doctors.html">Doctors</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add Doctor</li>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-lg-8 mt-4">
                        <div class="card border-0 p-4 rounded shadow">

                            <form class="mt-4" method="POST" action="${pageContext.request.contextPath}/doctors/add">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-4">
                                        <img id="addDoctorImage" src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                    </div><!--end col-->
                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                        <h5 class="">Upload your picture</h5>
                                        <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                    </div><!--end col-->
                                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
<%--                                        <a href="#" class="btn btn-primary">Upload</a>--%>
                                        <input type="file" name="image" onchange="viewUploadFile(event);" class="btn btn-primary" style="color:transparent; width:109px;">
                                        <a href="#" class="btn btn-soft-primary ms-2" onclick="removePreviewImage()">Remove</a>
                                    </div><!--end col-->
                                </div><!--end row-->

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">First Name</label>
                                            <input name="firstName" id="name" type="text" class="form-control" placeholder="First Name :" required>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Last Name</label>
                                            <input name="lastName" id="name2" type="text" class="form-control" placeholder="Last Name :" required>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Your Email</label>
                                            <input name="email" id="email" type="email" class="form-control" placeholder="Your email :" required>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Phone no.</label>
                                            <input name="number" id="number" type="text" class="form-control" placeholder="Phone no. :" required>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Departments</label>
                                            <select class="form-control department-name select2input" name="specialist">
                                                <c:forEach items="${specialistList}" var="specialist">
                                                    <option value="${specialist.id}">${specialist.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Gender</label>
                                            <select class="form-control gender-name select2input" name="gender">
                                                <option value="0">Male</option>
                                                <option value="1">Female</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Your Bio Here</label>
                                            <textarea name="comments" id="comments" rows="3" class="form-control" placeholder="Bio :"></textarea>
                                        </div>
                                    </div>
                                </div><!--end row-->

                                <button type="submit" class="btn btn-primary">Add Doctor</button>
                            </form>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 mt-4">
                        <div class="card rounded border-0 shadow">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Doctors List</h5>
                            </div>

                            <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 664px;">
                                <c:forEach items="${doctorList}" var="doctor">
                                    <li class="d-md-flex align-items-center text-center text-md-start">
                                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/${doctor.doctorProfile.avatar}" class="avatar avatar-medium rounded-md shadow" alt="">

                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                            <a href="#" class="text-dark h6">${doctor.doctorProfile.firstName.concat(" ").concat(doctor.doctorProfile.lastName)}</a>
                                            <p class="text-muted my-1">${doctor.specialist.name}</p>
                                            <p class="text-muted mb-0">${doctor.doctorProfile.experience} Years Experienced</p>
                                        </div>
                                    </li>
                                </c:forEach>

                                <li class="mt-4">
                                    <a href="${pageContext.request.contextPath}/doctors" class="btn btn-primary">All Doctors</a>
                                </li>
                            </ul>
                        </div>


                    </div>
                </div><!--end row-->
            </div>
        </div><!--end container-->

        <jsp:include page="../common/footer.jsp"></jsp:include>
    </main>
    <!--End page-content" -->
</div>
<!-- page-wrapper -->

<!-- View Appintment Start -->
<div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Appointment Detail</h5>
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
<!-- View Appintment End -->

<!-- Accept Appointment Start -->
<div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body py-5">
                <div class="text-center">
                    <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                        <i class="uil uil-check-circle h1 mb-0"></i>
                    </div>
                    <div class="mt-4">
                        <h4>Accept Appointment</h4>
                        <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                        <div class="mt-4">
                            <a href="#" class="btn btn-soft-success">Accept</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Accept Appointment End -->

<!-- Cancel Appointment Start -->
<div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body py-5">
                <div class="text-center">
                    <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                        <i class="uil uil-times-circle h1 mb-0"></i>
                    </div>
                    <div class="mt-4">
                        <h4>Cancel Appointment</h4>
                        <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                        <div class="mt-4">
                            <a href="#" class="btn btn-soft-danger">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cancel Appointment End -->
<!-- Modal end -->

<!-- javascript -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/manager-role/assets/js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/simplebar.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/manager-role/assets/js/select2.init.js"></script>
<!-- Icons -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/manager-role/assets/js/upload_file_util.js"></script>
</body>

</html>

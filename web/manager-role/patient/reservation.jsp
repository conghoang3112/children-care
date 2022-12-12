<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Doctris - Doctor Appointment Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/manager-role/assets/images/favicon.ico.png">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- simplebar -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
    <!-- Select2 -->
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/select2.min.css" rel="stylesheet" />
    <!-- Date picker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/manager-role/assets/css/flatpickr.min.css">
    <link href="${pageContext.request.contextPath}/manager-role/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
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
                <div class="row">
                    <div class="col-xl-9 col-lg-6 col-md-4">
                        <h5 class="mb-0">Appointment</h5>
                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">ChildrenCare</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Appointment</li>
                            </ul>
                        </nav>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                        <div class="justify-content-md-end">
                            <form>
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-sm-12 col-md-5">
                                        <div class="mb-0 position-relative">
                                            <select class="form-control time-during select2input">
                                                <option value="EY">Today</option>
                                                <option value="GY">Tomorrow</option>
                                                <option value="PS">Yesterday</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-sm-12 col-md-7 mt-4 mt-sm-0">
                                        <div class="d-grid">
                                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#appointmentform">Appointment</a>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </form><!--end form-->
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-12 mt-4">
                        <div class="table-responsive bg-white shadow rounded">
                            <table class="table mb-0 table-center">
                                <thead>
                                <tr>
                                    <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                    <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                    <th class="border-bottom p-3" style="min-width: 150px;">Email</th>
                                    <th class="border-bottom p-3">Age</th>
                                    <th class="border-bottom p-3">Gender</th>
                                    <th class="border-bottom p-3">Department</th>
                                    <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                    <th class="border-bottom p-3">Time</th>
                                    <th class="border-bottom p-3" style="min-width: 220px;">Doctor</th>
<%--                                    <th class="border-bottom p-3">Fees</th>--%>
<%--                                    <th class="border-bottom p-3" style="min-width: 150px;"></th>--%>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${reservationList}" var="reservation" varStatus="loop">
                                    <tr>
                                        <th class="p-3">${loop.index + 1}</th>
                                        <td class="p-3">
                                            <a href="#" class="text-dark">
                                                <div class="d-flex align-items-center">
                                                    <img src="${reservation.user.patient.avatar}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                    <span class="ms-2">${reservation.user.patient.name}</span>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="p-3">${reservation.user.account.email}</td>
                                        <td class="p-3"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${reservation.user.patient.dob}" /></td>
                                        <td class="p-3">${reservation.user.patient.sex == false ? "Male" : "Female"}</td>
                                        <td class="p-3">${reservation.doctor.specialist.name}</td>
                                        <td class="p-3"><fmt:formatDate pattern = "yyyy-MM-dd" value = "${reservation.dateBooking}" /></td>
                                        <td class="p-3">${reservation.timeSlot.slotTime}</td>
                                        <td class="p-3">
                                            <a href="#" class="text-dark">
                                                <div class="d-flex align-items-center">
                                                    <img src="${reservation.doctor.doctorProfile.avatar}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                                    <span class="ms-2">${reservation.doctor.doctorProfile.firstName.concat(reservation.doctor.doctorProfile.lastName)}</span>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
<%--                                <tr>--%>
<%--                                    <th class="p-3">1</th>--%>
<%--                                    <td class="p-3">--%>
<%--                                        <a href="#" class="text-dark">--%>
<%--                                            <div class="d-flex align-items-center">--%>
<%--                                                <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/01.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">--%>
<%--                                                <span class="ms-2">Howard Tanner</span>--%>
<%--                                            </div>--%>
<%--                                        </a>--%>
<%--                                    </td>--%>
<%--                                    <td class="p-3">howard@contact.com</td>--%>
<%--                                    <td class="p-3">25</td>--%>
<%--                                    <td class="p-3">Male</td>--%>
<%--                                    <td class="p-3">Cardiology</td>--%>
<%--                                    <td class="p-3">20th Dec 2020</td>--%>
<%--                                    <td class="p-3">11:00AM</td>--%>
<%--                                    <td class="p-3">--%>
<%--                                        <a href="#" class="text-dark">--%>
<%--                                            <div class="d-flex align-items-center">--%>
<%--                                                <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">--%>
<%--                                                <span class="ms-2">Dr. Calvin Carlo</span>--%>
<%--                                            </div>--%>
<%--                                        </a>--%>
<%--                                    </td>--%>
<%--                                    <td class="p-3">$50/Patient</td>--%>
<%--                                    <td class="text-end p-3">--%>
<%--                                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewappointment"><i class="uil uil-eye"></i></a>--%>
<%--                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptappointment"><i class="uil uil-check-circle"></i></a>--%>
<%--                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#cancelappointment"><i class="uil uil-times-circle"></i></a>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!--end row-->

                </div><!--end row-->

                <c:if test="${totalPage > 1}">
                    <div class="row text-center">
                        <!-- PAGINATION START -->
                        <div class="col-12 mt-4">
                            <div class="d-md-flex align-items-center text-center justify-content-between">
<%--                                <span class="text-muted me-3">Showing 1 - 10 out of 50</span>--%>
                                <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                    <c:if test="${currentPage != 1}">
<%--                                        <li class="page-item">--%>
<%--                                            <a class="page-link" onclick="searchHomeClient(this)" href="#" data-current_page="${currentPage - 1}">Previous</a>--%>
<%--                                        </li>--%>
                                        <li class="page-item">
                                            <a class="page-link" href="/reservation?pageNumber=${currentPage - 1}" aria-label="Previous">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="1" end="${totalPage}">
                                        <li class="page-item ${i == currentPage ? ' active' : ''}">
                                            <a class="page-link" href="/reservation?pageNumber=${i}" href="#">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPage}">
                                        <li class="page-item"><a class="page-link" href="/reservation?pageNumber=${currentPage + 1}" aria-label="Next">Next</a></li>
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
<!-- Add New Appointment Start -->
<div class="modal fade" id="appointmentform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Book an Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <form>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Patient Name <span class="text-danger">*</span></label>
                                <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Departments</label>
                                <select class="form-control department-name select2input">
                                    <option value="EY">Eye Care</option>
                                    <option value="GY">Gynecologist</option>
                                    <option value="PS">Psychotherapist</option>
                                    <option value="OR">Orthopedic</option>
                                    <option value="DE">Dentist</option>
                                    <option value="GA">Gastrologist</option>
                                    <option value="UR">Urologist</option>
                                    <option value="NE">Neurologist</option>
                                </select>
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Doctor</label>
                                <select class="form-control doctor-name select2input">
                                    <option value="CA">Dr. Calvin Carlo</option>
                                    <option value="CR">Dr. Cristino Murphy</option>
                                    <option value="AL">Dr. Alia Reddy</option>
                                    <option value="TO">Dr. Toni Kovar</option>
                                    <option value="JE">Dr. Jessica McFarlane</option>
                                    <option value="EL">Dr. Elsie Sherman</option>
                                    <option value="BE">Dr. Bertha Magers</option>
                                    <option value="LO">Dr. Louis Batey</option>
                                </select>
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Your Phone <span class="text-danger">*</span></label>
                                <input name="phone" id="phone" type="tel" class="form-control" placeholder="Your Phone :">
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label"> Date : </label>
                                <input name="date" type="text" class="flatpickr flatpickr-input form-control" id="checkin-date">
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="input-time">Time : </label>
                                <input name="time" type="text" class="form-control timepicker" id="input-time" placeholder="03:30 PM">
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Comments <span class="text-danger">*</span></label>
                                <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Your Message :"></textarea>
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-12">
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Book An Appointment</button>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Add New Appointment End -->

<!-- View Appintment Start -->
<div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel1">Appointment Detail</h5>
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
<!-- Datepicker -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/flatpickr.min.js"></script>
<script src="${pageContext.request.contextPath}/manager-role/assets/js/flatpickr.init.js"></script>
<!-- Datepicker -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/jquery.timepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/manager-role/assets/js/timepicker.init.js"></script>
<!-- Icons -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/app.js"></script>

</body>

</html>

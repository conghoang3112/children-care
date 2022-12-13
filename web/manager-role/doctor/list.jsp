<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Children  Care</title>
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
                    <div class="col-xl-9 col-md-6">
                        <h5 class="mb-0">Doctors</h5>

                        <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">ChildrenCare</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Doctors</li>
                            </ul>
                        </nav>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-6 mt-4 mt-md-0 text-md-end">
                        <a href="${pageContext.request.contextPath}/doctors/add" class="btn btn-primary">Add New Doctor</a>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row row-cols-md-2 row-cols-lg-5">
                    <c:forEach items="${doctorList}" var="doctor" >
                        <div class="col mt-4">
                            <div class="card team border-0 rounded shadow overflow-hidden">
                                <div class="team-img position-relative">
                                    <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/${doctor.doctorProfile.avatar}" class="img-fluid" alt="">
<%--                                    <ul class="list-unstyled team-social mb-0">--%>
<%--                                        <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>--%>
<%--                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>--%>
<%--                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="instagram" class="icons"></i></a></li>--%>
<%--                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>--%>
<%--                                    </ul>--%>
                                </div>
                                <div class="card-body content text-center">
                                    <a href="/doctorProfile?doctorId=${doctor.id}&doctorProfileId=${doctor.doctorProfile.id}" class="title text-dark h5 d-block mb-0">
                                            ${doctor.doctorProfile.firstName.concat(" ").concat(doctor.doctorProfile.lastName)}</a>
                                    <small class="text-muted speciality">${doctor.specialist.name}</small>
                                </div>
                            </div>
                        </div><!--end col-->
                    </c:forEach>
                </div><!--end row-->
            </div>
            <c:if test="${totalPage > 1}">
            <div class="row text-center">
                <!-- PAGINATION START -->
                <div class="col-12 mt-4">
                    <div class="d-md-flex align-items-center text-center justify-content-between">
                        <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                            <c:if test="${currentPage != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/doctors?pageNumber=${currentPage - 1}" aria-label="Previous">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <li class="page-item ${i == currentPage ? ' active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/doctors?pageNumber=${i}" href="#">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPage}">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/doctors?pageNumber=${currentPage + 1}" aria-label="Next">Next</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div><!--end col-->
                <!-- PAGINATION END -->
            </c:if>
        </div><!--end container-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </main>
    <!--End page-content" -->
</div>
<!-- page-wrapper -->

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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
  <!-- SLIDER -->
  <link href="${pageContext.request.contextPath}/manager-role/assets/css/tiny-slider.css" rel="stylesheet" />
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
          <h5 class="mb-0">Doctor Profile & Settings</h5>

          <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
            <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
              <li class="breadcrumb-item"><a href="index.html">ChildrenCard</a></li>
              <li class="breadcrumb-item"><a href="doctors.html">Doctor</a></li>
              <li class="breadcrumb-item active" aria-current="page">Profile</li>
            </ul>
          </nav>
        </div>

        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
          <div class="p-5 bg-primary bg-gradient"></div>
          <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
            <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/${doctor.doctorProfile.avatar}" class="rounded-circle shadow-md avatar avatar-medium" alt="">
            <div class="mt-4 ms-3 pt-3">
              <h5 class="mt-3 mb-1">${doctor.doctorProfile.firstName.concat(" ").concat(doctor.doctorProfile.lastName)}</h5>
              <p class="text-muted mb-0">${doctor.specialist.name}</p>
            </div>
          </div>

          <div class="row">
            <div class="col-12 mt-4">
              <div class="card border-0 rounded-0 p-4">
                <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light" id="pills-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" href="#pills-overview" role="tab" aria-controls="pills-overview" aria-selected="false">
                      <div class="text-center pt-1 pb-1">
                        <h4 class="title fw-normal mb-0">Overview</h4>
                      </div>
                    </a><!--end nav link-->
                  </li><!--end nav item-->

                  <li class="nav-item">
                    <a class="nav-link rounded-0" id="experience-tab" data-bs-toggle="pill" href="#pills-experience" role="tab" aria-controls="pills-experience" aria-selected="false">
                      <div class="text-center pt-1 pb-1">
                        <h4 class="title fw-normal mb-0">Experience</h4>
                      </div>
                    </a><!--end nav link-->
                  </li><!--end nav item-->

                  <li class="nav-item">
                    <a class="nav-link rounded-0" id="review-tab" data-bs-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false">
                      <div class="text-center pt-1 pb-1">
                        <h4 class="title fw-normal mb-0">Reviews</h4>
                      </div>
                    </a><!--end nav link-->
                  </li><!--end nav item-->

                  <li class="nav-item">
                    <a class="nav-link rounded-0" id="timetable-tab" data-bs-toggle="pill" href="#pills-timetable" role="tab" aria-controls="pills-timetable" aria-selected="false">
                      <div class="text-center pt-1 pb-1">
                        <h4 class="title fw-normal mb-0">Time Table</h4>
                      </div>
                    </a><!--end nav link-->
                  </li><!--end nav item-->

                  <li class="nav-item">
                    <a class="nav-link rounded-0" id="settings-tab" data-bs-toggle="pill" href="#pills-settings" role="tab" aria-controls="pills-settings" aria-selected="false">
                      <div class="text-center pt-1 pb-1">
                        <h4 class="title fw-normal mb-0">Settings</h4>
                      </div>
                    </a><!--end nav link-->
                  </li><!--end nav item-->
                </ul><!--end nav pills-->

                <div class="tab-content mt-2" id="pills-tabContent">
                  <div class="tab-pane fade show active" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                    <p class="text-muted">A gynecologist is a surgeon who specializes in the female reproductive system, which includes the cervix, fallopian tubes, ovaries, uterus, vagina and vulva. Menstrual problems, contraception, sexuality, menopause and infertility issues are diagnosed and treated by a gynecologist; most gynecologists also provide prenatal care, and some provide primary care.</p>

                    <h6 class="mb-0">Specialties: </h6>

                    <ul class="list-unstyled mt-4">
                      <li class="mt-1"><i class="uil uil-arrow-right text-primary"></i> Women's health services</li>
                      <li class="mt-1"><i class="uil uil-arrow-right text-primary"></i> Pregnancy care</li>
                      <li class="mt-1"><i class="uil uil-arrow-right text-primary"></i> Surgical procedures</li>
                      <li class="mt-1"><i class="uil uil-arrow-right text-primary"></i> Specialty care</li>
                      <li class="mt-1"><i class="uil uil-arrow-right text-primary"></i> Conclusion</li>
                    </ul>

                    <h6 class="mb-0">My Team: </h6>

                    <div class="row row-cols-md-2 row-cols-lg-5">
                      <c:forEach items="${anotherDoctorList}" var="anotherDoctor">
                        <div class="col mt-4">
                          <div class="card team border-0 rounded shadow overflow-hidden">
                            <div class="team-person position-relative overflow-hidden">
                              <img src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/${anotherDoctor.doctorProfile.avatar}" class="img-fluid" alt="">
                              <ul class="list-unstyled team-like">
                                <li><a href="#" class="btn btn-icon btn-pills btn-soft-danger"><i data-feather="heart" class="icons"></i></a></li>
                              </ul>
                            </div>
                            <div class="card-body">
                              <a href="${pageContext.request.contextPath}/doctorProfile?doctorId=${anotherDoctor.id}&doctorProfileId=${anotherDoctor.doctorProfile.id}" class="title text-dark h5 d-block mb-0">${anotherDoctor.doctorProfile.firstName.concat(" ").concat(anotherDoctor.doctorProfile.lastName)}</a>
                              <small class="text-muted speciality">${anotherDoctor.specialist.name}</small>
                              <div class="d-flex justify-content-between align-items-center mt-2">
                                <ul class="list-unstyled mb-0">
                                  <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                  <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                  <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                  <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                  <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                </ul>
                                <p class="text-muted mb-0">5 Star</p>
                              </div>
                              <ul class="list-unstyled mt-2 mb-0">
                                <li class="d-flex">
                                  <i class="ri-map-pin-line text-primary align-middle"></i>
                                  <small class="text-muted ms-2">${anotherDoctor.doctorProfile.addressHospital}</small>
                                </li>
                                <li class="d-flex mt-2">
                                  <i class="ri-time-line text-primary align-middle"></i>
                                  <small class="text-muted ms-2">Mon: 2:00PM - 6:00PM</small>
                                </li>
                                <li class="d-flex mt-2">
                                  <i class="ri-money-dollar-circle-line text-primary align-middle"></i>
                                  <small class="text-muted ms-2">$ 75 USD / Visit</small>
                                </li>
                              </ul>
                              <ul class="list-unstyled mt-2 mb-0">
                                <li class="list-inline-item"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                <li class="mt-2 list-inline-item"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                <li class="mt-2 list-inline-item"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                <li class="mt-2 list-inline-item"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                              </ul>
                            </div>
                          </div>
                        </div><!--end col-->
                      </c:forEach>

                    </div><!--end row-->
                  </div><!--end teb pane-->

                  <div class="tab-pane fade" id="pills-experience" role="tabpanel" aria-labelledby="experience-tab">
                    <h5 class="mb-1">Experience:</h5>

                    <p class="text-muted mt-4">The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century. Lorem Ipsum is composed in a pseudo-Latin language which more or less corresponds to 'proper' Latin. It contains a series of real Latin words. This ancient dummy text is also incomprehensible, but it imitates the rhythm of most European languages in Latin script. The advantage of its Latin origin and the relative meaninglessness of Lorum Ipsum is that the text does not attract attention to itself or distract the viewer's attention from the layout.</p>

                    <h6 class="mb-0">Professional Experience:</h6>

                    <div class="row">
                      <div class="col-12 mt-4">
                        <div class="col-md-12">
                          <div class="slider-range-four tiny-timeline">
                            <div class="tiny-slide text-center">
                              <div class="card border-0 p-4 item-box mb-2 shadow rounded">
                                <p class="text-muted mb-0">2010 - 2014</p>
                                <h6 class="mt-1">Master Of Science</h6>
                                <p class="text-muted mb-0">X.Y.Z Hospital (NZ)</p>
                              </div>
                            </div>

                            <div class="tiny-slide text-center">
                              <div class="card border-0 p-4 item-box mb-2 shadow rounded">
                                <p class="text-muted mb-0">2014 - 2016</p>
                                <h6 class="mt-1">Gynecology Test</h6>
                                <p class="text-muted mb-0">X.Y.Z Hospital (NZ)</p>
                              </div>
                            </div>

                            <div class="tiny-slide text-center">
                              <div class="card border-0 p-4 item-box mb-2 shadow rounded">
                                <p class="text-muted mb-0">2016 - 2019</p>
                                <h6 class="mt-1">Master Of Medicine</h6>
                                <p class="text-muted mb-0">X.Y.Z Hospital (NZ)</p>
                              </div>
                            </div>

                            <div class="tiny-slide text-center">
                              <div class="card border-0 p-4 item-box mb-2 shadow rounded">
                                <p class="text-muted mb-0">2019 - 2020</p>
                                <h6 class="mt-1">Orthopedics</h6>
                                <p class="text-muted mb-0">X.Y.Z Hospital (NZ)</p>
                              </div>
                            </div>

                            <div class="tiny-slide text-center">
                              <div class="card border-0 p-4 item-box mb-2 shadow rounded">
                                <p class="text-muted mb-0">2020 to continue..</p>
                                <h6 class="mt-1">Gynecologist (Final)</h6>
                                <p class="text-muted mb-0">X.Y.Z Hospital (NZ)</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div><!--end col-->
                    </div><!--end row-->
                  </div><!--end teb pane-->

                  <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row justify-content-center">
                      <div class="col-lg-8 text-center">
                        <div class="client-review-slider">
                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century. "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/01.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Thomas Israel <small class="text-muted">C.E.O</small></h6>
                          </div><!--end customer testi-->

                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" The advantage of its Latin origin and the relative meaninglessness of Lorum Ipsum is that the text does not attract attention to itself or distract the viewer's attention from the layout. "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/02.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Carl Oliver <small class="text-muted">P.A</small></h6>
                          </div><!--end customer testi-->

                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical stories. "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/03.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Barbara McIntosh <small class="text-muted">M.D</small></h6>
                          </div><!--end customer testi-->

                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" According to most sources, Lorum Ipsum can be traced back to a text composed by Cicero in 45 BC. Allegedly, a Latin scholar established the origin of the text by compiling all the instances of the unusual word 'consectetur' he could find "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/04.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Christa Smith <small class="text-muted">Manager</small></h6>
                          </div><!--end customer testi-->

                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. The most well-known dummy text is the 'Lorem Ipsum', which is said to have originated in the 16th century. "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/05.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Dean Tolle <small class="text-muted">Developer</small></h6>
                          </div><!--end customer testi-->

                          <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that over the course of time certain letters were added or deleted at various positions within the text. "</p>
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/06.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                              <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Jill Webb <small class="text-muted">Designer</small></h6>
                          </div><!--end customer testi-->
                        </div><!--end carousel-->
                      </div><!--end col-->
                    </div><!--end row-->

                    <div class="row justify-content-center">
                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/amazon.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->

                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/google.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->

                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/lenovo.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->

                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/paypal.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->

                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/shopify.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->

                      <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                        <img src="${pageContext.request.contextPath}/manager-role/assets/images/client/spotify.png" class="avatar avatar-client" alt="">
                      </div><!--end col-->
                    </div><!--end row-->
                  </div><!--end teb pane-->

                  <div class="tab-pane fade" id="pills-timetable" role="tabpanel" aria-labelledby="timetable-tab">
                    <div class="row">
                      <div class="col-lg-4 col-md-12">
                        <div class="card border-0 p-3 rounded shadow">
                          <ul class="list-unstyled mb-0">
                            <li class="d-flex justify-content-between">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Monday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Tuesday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Wednesday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Thursday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Friday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 20.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Saturday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 18.00</p>
                            </li>
                            <li class="d-flex justify-content-between mt-2">
                              <p class="text-muted mb-0"><i class="ri-time-fill text-primary align-middle h5 mb-0"></i> Sunday</p>
                              <p class="text-primary mb-0"><span class="text-dark">Time:</span> 8.00 - 14.00</p>
                            </li>
                          </ul>
                        </div>
                      </div><!--end col-->

                      <div class="col-lg-4 col-md-6 mt-4 mt-lg-0 pt-2 pt-lg-0">
                        <div class="card border-0 text-center features feature-primary">
                          <div class="icon text-center mx-auto rounded-md">
                            <i class="uil uil-phone h3 mb-0"></i>
                          </div>

                          <div class="card-body p-0 mt-4">
                            <h5 class="title fw-bold">Phone</h5>
                            <p class="text-muted">Great doctor if you need your family member to get effective immediate assistance</p>
                            <a href="tel:${doctor.doctorProfile.phone}" class="link">${doctor.doctorProfile.phone}</a>
                          </div>
                        </div>
                      </div><!--end col-->

                      <div class="col-lg-4 col-md-6 mt-4 mt-lg-0 pt-2 pt-lg-0">
                        <div class="card border-0 text-center features feature-primary">
                          <div class="icon text-center mx-auto rounded-md">
                            <i class="uil uil-envelope h3 mb-0"></i>
                          </div>

                          <div class="card-body p-0 mt-4">
                            <h5 class="title fw-bold">Email</h5>
                            <p class="text-muted">Great doctor if you need your family member to get effective immediate assistance</p>
                            <a href="mailto:${doctor.doctorProfile.email}" class="link">${doctor.doctorProfile.email}</a>
                          </div>
                        </div>
                      </div><!--end col-->
                    </div><!--end row-->
                  </div><!--end teb pane-->

                  <div class="tab-pane fade" id="pills-settings" role="tabpanel" aria-labelledby="settings-tab">
                    <h5 class="mb-1">Settings</h5>
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="rounded shadow mt-4">
                          <div class="p-4 border-bottom">
                            <h6 class="mb-0">Personal Information :</h6>
                          </div>

                          <div class="p-4">

                            <form class="mt-4" method="POST" action="${pageContext.request.contextPath}/doctors/update" enctype="multipart/form-data">
                              <div class="row align-items-center">
                                <div class="col-lg-2 col-md-4">
                                  <img id="doctorImage" src="${pageContext.request.contextPath}/manager-role/assets/images/doctors/${doctor.doctorProfile.avatar}" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                </div><!--end col-->

                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                  <h6 class="">Upload your picture</h6>
                                  <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                                </div><!--end col-->

                                <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                  <input type="file" name="image" onchange="viewUploadFile(event);" class="btn btn-primary" style="width: 44%">
                                  <a href="#" class="btn btn-soft-primary ms-2" onclick="removePreviewImage()">Remove</a>
                                </div><!--end col-->
                              </div><!--end row-->

                              <div class="row">
                                <div class="col-md-6">
                                  <div class="mb-3">
                                    <label class="form-label">First Name</label>
                                    <input name="firstName" id="name" type="text" class="form-control" placeholder="First Name :" value="${doctor.doctorProfile.firstName}">
                                  </div>
                                </div><!--end col-->

                                <div class="col-md-6">
                                  <div class="mb-3">
                                    <label class="form-label">Last Name</label>
                                    <input name="lastName" id="name2" type="text" class="form-control" placeholder="Last Name :" value="${doctor.doctorProfile.lastName}">
                                  </div>
                                </div><!--end col-->

                                <div class="col-md-6">
                                  <div class="mb-3">
                                    <label class="form-label">Your Email</label>
                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :" value="${doctor.doctorProfile.email}">
                                  </div>
                                </div><!--end col-->

                                <div class="col-md-6">
                                  <div class="mb-3">
                                    <label class="form-label">Phone no.</label>
                                    <input name="number" id="number" type="text" class="form-control" placeholder="Phone no. :" value="${doctor.doctorProfile.phone}">
                                  </div>
                                </div><!--end col-->

                                <div class="col-md-12">
                                  <div class="mb-3">
                                    <label class="form-label">Your Bio Here</label>
                                    <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Bio :">${doctor.doctorProfile.addressHospital}</textarea>
                                  </div>
                                </div>
                              </div><!--end row-->

                              <input type="hidden" name="doctorProfileId" value="${doctor.doctorProfile.id}">

                              <div class="row">
                                <div class="col-sm-12">
                                  <input type="submit" id="submit" name="send" class="btn btn-primary" value="Save changes">
                                </div><!--end col-->
                              </div><!--end row-->
                            </form><!--end form-->
                          </div>
                        </div>

<%--                        <div class="rounded shadow mt-4">--%>
<%--                          <div class="p-4 border-bottom">--%>
<%--                            <h6 class="mb-0">Account Notifications :</h6>--%>
<%--                          </div>--%>

<%--                          <div class="p-4">--%>
<%--                            <form>--%>
<%--                              <div class="row">--%>
<%--                                <div class="col-lg-12">--%>
<%--                                  <div class="mb-3">--%>
<%--                                    <label class="form-label">Old password :</label>--%>
<%--                                    <input type="password" class="form-control" placeholder="Old password" required="">--%>
<%--                                  </div>--%>
<%--                                </div><!--end col-->--%>

<%--                                <div class="col-lg-12">--%>
<%--                                  <div class="mb-3">--%>
<%--                                    <label class="form-label">New password :</label>--%>
<%--                                    <input type="password" class="form-control" placeholder="New password" required="">--%>
<%--                                  </div>--%>
<%--                                </div><!--end col-->--%>

<%--                                <div class="col-lg-12">--%>
<%--                                  <div class="mb-3">--%>
<%--                                    <label class="form-label">Re-type New password :</label>--%>
<%--                                    <input type="password" class="form-control" placeholder="Re-type New password" required="">--%>
<%--                                  </div>--%>
<%--                                </div><!--end col-->--%>

<%--                                <div class="col-lg-12 mt-2 mb-0">--%>
<%--                                  <button class="btn btn-primary">Save password</button>--%>
<%--                                </div><!--end col-->--%>
<%--                              </div><!--end row-->--%>
<%--                            </form>--%>
<%--                          </div>--%>
<%--                        </div>--%>
                      </div><!--end col-->

<%--                      <div class="col-lg-6">--%>
<%--                        <div class="rounded shadow mt-4">--%>
<%--                          <div class="p-4 border-bottom">--%>
<%--                            <h6 class="mb-0">General Notifications :</h6>--%>
<%--                          </div>--%>

<%--                          <div class="p-4">--%>
<%--                            <div class="d-flex justify-content-between pb-4">--%>
<%--                              <h6 class="mb-0 fw-normal">When someone mentions me</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" value="" id="customSwitch1">--%>
<%--                                <label class="form-check-label" for="customSwitch1"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">When someone follows me</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch2" checked>--%>
<%--                                <label class="form-check-label" for="customSwitch2"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">When shares my activity</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch3">--%>
<%--                                <label class="form-check-label" for="customSwitch3"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">When someone messages me</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch4" checked>--%>
<%--                                <label class="form-check-label" for="customSwitch4"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                        </div>--%>

<%--                        <div class="rounded shadow mt-4">--%>
<%--                          <div class="p-4 border-bottom">--%>
<%--                            <h6 class="mb-0">Marketing Notifications :</h6>--%>
<%--                          </div>--%>

<%--                          <div class="p-4">--%>
<%--                            <div class="d-flex justify-content-between pb-4">--%>
<%--                              <h6 class="mb-0 fw-normal">There is a sale or promotion</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch5" checked>--%>
<%--                                <label class="form-check-label" for="customSwitch5"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">Company news</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch6">--%>
<%--                                <label class="form-check-label" for="customSwitch6"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">Weekly jobs</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch7">--%>
<%--                                <label class="form-check-label" for="customSwitch7"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between py-4 border-top">--%>
<%--                              <h6 class="mb-0 fw-normal">Unsubscribe News</h6>--%>
<%--                              <div class="form-check">--%>
<%--                                <input type="checkbox" class="form-check-input" id="customSwitch8" checked>--%>
<%--                                <label class="form-check-label" for="customSwitch8"></label>--%>
<%--                              </div>--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                        </div>--%>

<%--                        <div class="rounded shadow mt-4">--%>
<%--                          <div class="p-4 border-bottom">--%>
<%--                            <h6 class="mb-0">General Notifications :</h6>--%>
<%--                          </div>--%>

<%--                          <div class="p-4">--%>
<%--                            <div class="p-4 border-bottom">--%>
<%--                              <h5 class="mb-0 text-danger">Delete Account :</h5>--%>
<%--                            </div>--%>

<%--                            <div class="p-4">--%>
<%--                              <h6 class="mb-0 fw-normal">Do you want to delete the account? Please press below "Delete" button</h6>--%>
<%--                              <div class="mt-4">--%>
<%--                                <button class="btn btn-danger">Delete Account</button>--%>
<%--                              </div><!--end col-->--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                        </div>--%>
<%--                      </div><!--end col-->--%>
                    </div><!--end row-->
                  </div><!--end teb pane-->
                </div><!--end tab content-->
              </div>
            </div><!--end col-->
          </div><!--end row-->
        </div>
      </div>
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
<!-- SLIDER -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/manager-role/assets/js/tiny-slider-init.js"></script>
<!-- Icons -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/manager-role/assets/js/upload_file_util.js"></script>
</body>

</html>

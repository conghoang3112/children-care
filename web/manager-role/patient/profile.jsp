<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Doctris - Doctor Appointment Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico.png">
    <!-- Bootstrap -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- simplebar -->
    <link href="../assets/css/simplebar.css" rel="stylesheet" type="text/css" />
    <!-- Icons -->
    <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
    <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
    <!-- Css -->
    <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

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
                    <h5 class="mb-0">Patient Profile</h5>

                    <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                        <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                            <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                            <li class="breadcrumb-item"><a href="patients.html">Patients</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Profile</li>
                        </ul>
                    </nav>
                </div>

                <div class="row">
                    <div class="col-lg-3 col-md-5 mt-4">
                        <div class="bg-white rounded shadow overflow-hidden">
                            <div class="card border-0">
                                <img src="../assets/images/bg/bg-profile.jpg" class="img-fluid" alt="">
                            </div>

                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <img src="../assets/images/client/09.jpg" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                <h5 class="mt-3 mb-1">Christopher Burrell</h5>
                                <p class="text-muted mb-0">25 Years old</p>
                            </div>

                            <div class="list-unstyled p-4">
                                <div class="progress-box mb-4">
                                    <h6 class="title">Complete your profile</h6>
                                    <div class="progress">
                                        <div class="progress-bar position-relative bg-primary" style="width:89%;">
                                            <div class="progress-value d-block text-muted h6">89%</div>
                                        </div>
                                    </div>
                                </div><!--end process box-->

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Gender</h6>
                                    <p class="text-muted mb-0 ms-2">Female</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-envelope align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Birthday</h6>
                                    <p class="text-muted mb-0 ms-2">19th January 1995</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Phone No.</h6>
                                    <p class="text-muted mb-0 ms-2">+(125) 458-8547</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-italic align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Address</h6>
                                    <p class="text-muted mb-0 ms-2">Sydney, Australia</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-medical-drip align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Blood Group</h6>
                                    <p class="text-muted mb-0 ms-2">B +</p>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-5 col-md-7 mt-4">
                        <div class="card border-0 shadow overflow-hidden">
                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded-0 shadow overflow-hidden bg-white mb-0" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill" href="#pills-overview" role="tab" aria-controls="pills-overview" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title fw-normal mb-0">Profile</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->

                                <li class="nav-item">
                                    <a class="nav-link rounded-0" id="experience-tab" data-bs-toggle="pill" href="#pills-experience" role="tab" aria-controls="pills-experience" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title fw-normal mb-0">Profile Settings</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->
                            </ul>

                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-overview" role="tabpanel" aria-labelledby="overview-tab">
                                    <h5 class="mb-0">Introduction:</h5>

                                    <p class="text-muted mt-4 mb-0">Web designers to occupy the space which will later be filled with 'real' content. This is required when, for example, the final text is not yet available. Dummy text is also known as 'fill text'. Dummy texts have been in use by typesetters since the 16th century.</p>

                                    <div class="row">
                                        <div class="col-lg-6 col-12 mt-4">
                                            <h5>Appointment List</h5>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-heart-pulse-line h3 fw-normal text-primary mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Cardiogram</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Calvin Carlo</p>
                                                </div>
                                                <span class="mb-0">10 Dec</span>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-stethoscope-line h3 fw-normal text-success mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Checkup</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Cristino Murphy</p>
                                                </div>
                                                <span class="mb-0">12 Dec</span>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-virus-line h3 fw-normal text-warning mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Covid Test</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Alia Reddy</p>
                                                </div>
                                                <span class="mb-0">13 Dec</span>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-dossier-line h3 fw-normal text-secondary mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Dentist</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Toni Kovar</p>
                                                </div>
                                                <span class="mb-0">15 Dec</span>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-eye-2-line h3 fw-normal text-info mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Eye Test</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Jessica McFarlane</p>
                                                </div>
                                                <span class="mb-0">17 Dec</span>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <i class="ri-microscope-line h3 fw-normal text-danger mb-0"></i>
                                                <div class="flex-1 overflow-hidden ms-2">
                                                    <h6 class="mb-0">Orthopedic</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Dr. Elsie Sherman</p>
                                                </div>
                                                <span class="mb-0">18 Dec</span>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-12 mt-4">
                                            <h5>Payment List</h5>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Cardiogram</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Checkup</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Covid Test</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Dentist</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Eye Test</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center rounded p-3 shadow mt-3">
                                                <div class="flex-1 overflow-hidden">
                                                    <h6 class="flex-1 mb-0">Orthopedic</h6>
                                                    <p class="text-muted mb-0 text-truncate small">Full bill paid</p>
                                                </div>
                                                <a href="#" class="btn btn-icon btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice"><i class="uil uil-clipboard-notes icons"></i></a>
                                            </div>
                                        </div>
                                    </div>

                                    <h5 class="mb-0 mt-4 pt-2">Contact us</h5>
                                    <div class="row">
                                        <div class="col-md-12 col-lg-6 mt-4">
                                            <div class="card features feature-primary text-center border-0 p-4 rounded shadow">
                                                <div class="icon text-center rounded-lg mx-auto">
                                                    <i class="uil uil-message align-middle h3"></i>
                                                </div>
                                                <div class="card-body p-0 mt-3">
                                                    <a href="#" class="title text-dark h6 d-block">New Messages</a>
                                                    <a href="#" class="link">Read more <i class="ri-arrow-right-line align-middle"></i></a>
                                                </div>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-12 col-lg-6 mt-4">
                                            <div class="card features feature-primary text-center border-0 p-4 rounded shadow">
                                                <div class="icon text-center rounded-lg mx-auto">
                                                    <i class="uil uil-envelope-star align-middle h3"></i>
                                                </div>
                                                <div class="card-body p-0 mt-3">
                                                    <a href="#" class="title text-dark h6 d-block">Latest Proposals</a>
                                                    <a href="#" class="link">View more <i class="ri-arrow-right-line align-middle"></i></a>
                                                </div>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div>

                                <div class="tab-pane fade" id="pills-experience" role="tabpanel" aria-labelledby="experience-tab">
                                    <h5 class="mb-0">Personal Information :</h5>
                                    <div class="row align-items-center mt-4">
                                        <div class="col-lg-2 col-md-4">
                                            <img src="../assets/images/client/09.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                        </div><!--end col-->

                                        <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                            <h6 class="">Upload your picture</h6>
                                            <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                                        </div><!--end col-->

                                        <div class="col-lg-5 col-md-12 text-lg-right text-center mt-4 mt-lg-0">
                                            <a href="#" class="btn btn-primary">Upload</a>
                                            <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                                        </div><!--end col-->
                                    </div><!--end row-->

                                    <form class="mt-4">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">First Name</label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="First Name :">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Last Name</label>
                                                    <input name="name" id="name2" type="text" class="form-control" placeholder="Last Name :">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email</label>
                                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-lg-6">
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

                                    <div class="mt-4 pt-2">
                                        <h5 class="mb-0">Change Password :</h5>

                                        <form class="mt-4">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Old password :</label>
                                                        <input type="password" class="form-control" placeholder="Old password" required="">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">New password :</label>
                                                        <input type="password" class="form-control" placeholder="New password" required="">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Re-type New password :</label>
                                                        <input type="password" class="form-control" placeholder="Re-type New password" required="">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12 mt-2 mb-0">
                                                    <button class="btn btn-primary">Save password</button>
                                                </div><!--end col-->
                                            </div><!--end row-->
                                        </form>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <h5 class="mb-0">Account Notifications :</h5>

                                        <div class="d-flex justify-content-between mt-4">
                                            <p class="mb-0">When someone mentions me</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                <label class="form-check-label" for="flexCheckDefault"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">When someone follows me</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1" checked>
                                                <label class="form-check-label" for="flexCheckChecked1"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">When shares my activity</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                                <label class="form-check-label" for="flexCheckDefault2"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">When someone messages me</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" checked>
                                                <label class="form-check-label" for="flexCheckChecked3"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <h5 class="mb-0">Marketing Notifications :</h5>

                                        <div class="d-flex justify-content-between mt-4">
                                            <p class="mb-0">There is a sale or promotion</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked4" checked>
                                                <label class="form-check-label" for="flexCheckChecked4"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">Company news</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault5">
                                                <label class="form-check-label" for="flexCheckDefault5"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">Weekly jobs</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault6">
                                                <label class="form-check-label" for="flexCheckDefault6"></label>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="mb-0">Unsubscribe News</p>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked7" checked>
                                                <label class="form-check-label" for="flexCheckChecked7"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <h5 class="mb-0 text-danger">Delete Account :</h5>

                                        <p class="mb-0 mt-4">Do you want to delete the account? Please press below "Delete" button</p>
                                        <div class="mt-4">
                                            <button class="btn btn-danger">Delete Account</button>
                                        </div><!--end col-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 mt-4">
                        <div class="card rounded border-0 shadow">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Doctors List</h5>
                            </div>

                            <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 664px;">
                                <li class="d-md-flex align-items-center text-center text-md-start">
                                    <img src="../assets/images/doctors/01.jpg" class="avatar avatar-medium rounded-md shadow" alt="">

                                    <div class="ms-md-3 mt-4 mt-sm-0">
                                        <a href="#" class="text-dark h6">Dr. Calvin Carlo</a>
                                        <p class="text-muted my-1">Cardiologist</p>
                                        <p class="text-muted mb-0">3 Years Experienced</p>
                                    </div>
                                </li>

                                <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                    <img src="../assets/images/doctors/02.jpg" class="avatar avatar-medium rounded-md shadow" alt="">

                                    <div class="ms-md-3 mt-4 mt-sm-0">
                                        <a href="#" class="text-dark h6">Dr. Alex Smith</a>
                                        <p class="text-muted my-1">Dentist</p>
                                        <p class="text-muted mb-0">1 Years Experienced</p>
                                    </div>
                                </li>

                                <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                    <img src="../assets/images/doctors/03.jpg" class="avatar avatar-medium rounded-md shadow" alt="">

                                    <div class="ms-md-3 mt-4 mt-sm-0">
                                        <a href="#" class="text-dark h6">Dr. Cristina Luly</a>
                                        <p class="text-muted my-1">Orthopedic</p>
                                        <p class="text-muted mb-0">5 Years Experienced</p>
                                    </div>
                                </li>

                                <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                    <img src="../assets/images/doctors/04.jpg" class="avatar avatar-medium rounded-md shadow" alt="">

                                    <div class="ms-md-3 mt-4 mt-sm-0">
                                        <a href="#" class="text-dark h6">Dr. Dwayen Maria</a>
                                        <p class="text-muted my-1">Gastrologist</p>
                                        <p class="text-muted mb-0">2 Years Experienced</p>
                                    </div>
                                </li>

                                <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                    <img src="../assets/images/doctors/05.jpg" class="avatar avatar-medium rounded-md shadow" alt="">

                                    <div class="ms-md-3 mt-4 mt-sm-0">
                                        <a href="#" class="text-dark h6">Dr. Jenelia Focia</a>
                                        <p class="text-muted my-1">Psychotherapist</p>
                                        <p class="text-muted mb-0">3 Years Experienced</p>
                                    </div>
                                </li>

                                <li class="mt-4">
                                    <a href="doctors.html" class="btn btn-primary">All Doctors</a>
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

<!-- View Invoice Start -->
<div class="modal fade" id="view-invoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Patient Invoice</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-3 pt-4">
                <div class="row mb-4">
                    <div class="col-lg-8 col-md-6">
                        <img src="../assets/images/logo-dark.png" height="22" alt="">
                        <h6 class="mt-4 pt-2">Address :</h6>
                        <small class="text-muted mb-0">1419 Riverwood Drive, <br>Redding, CA 96001</small>
                    </div><!--end col-->

                    <div class="col-lg-4 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <ul class="list-unstyled">
                            <li class="d-flex">
                                <small class="mb-0 text-muted">Invoice no. : </small>
                                <small class="mb-0 text-dark">&nbsp;&nbsp;#54638990jnn</small>
                            </li>
                            <li class="d-flex mt-2">
                                <small class="mb-0 text-muted">Email : </small>
                                <small class="mb-0">&nbsp;&nbsp;<a href="mailto:contact@example.com" class="text-dark">info@doctris.com</a></small>
                            </li>
                            <li class="d-flex mt-2">
                                <small class="mb-0 text-muted">Phone : </small>
                                <small class="mb-0">&nbsp;&nbsp;<a href="tel:+152534-468-854" class="text-dark">(+12) 1546-456-856</a></small>
                            </li>
                            <li class="d-flex mt-2">
                                <small class="mb-0 text-muted">Website : </small>
                                <small class="mb-0">&nbsp;&nbsp;<a href="#" class="text-dark">www.doctris.com</a></small>
                            </li>
                            <li class="d-flex mt-2">
                                <small class="mb-0 text-muted">Patient Name : </small>
                                <small class="mb-0">&nbsp;&nbsp;Mary Skeens</small>
                            </li>
                        </ul>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="pt-4 border-top">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h5 class="text-muted fw-bold">Invoice <span class="badge badge-pill badge-soft-success fw-normal ms-2">Paid</span></h5>
                            <h6>Surgery (Gynecology)</h6>
                        </div><!--end col-->

                        <div class="col-lg-4 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <ul class="list-unstyled">
                                <li class="d-flex mt-2">
                                    <small class="mb-0 text-muted">Issue Dt. : </small>
                                    <small class="mb-0 text-dark">&nbsp;&nbsp;25th Sep. 2020</small>
                                </li>

                                <li class="d-flex mt-2">
                                    <small class="mb-0 text-muted">Due Dt. : </small>
                                    <small class="mb-0 text-dark">&nbsp;&nbsp;11th Oct. 2020</small>
                                </li>

                                <li class="d-flex mt-2">
                                    <small class="mb-0 text-muted">Dr. Name : </small>
                                    <small class="mb-0 text-dark">&nbsp;&nbsp;Dr. Calvin Carlo</small>
                                </li>
                            </ul>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="invoice-table pb-4">
                        <div class="table-responsive shadow rounded mt-4">
                            <table class="table table-center invoice-tb mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-start border-bottom p-3" style="min-width: 60px;">No.</th>
                                    <th scope="col" class="text-start border-bottom p-3" style="min-width: 220px;">Item</th>
                                    <th scope="col" class="text-center border-bottom p-3" style="min-width: 60px;">Qty</th>
                                    <th scope="col" class="border-bottom p-3" style="min-width: 130px;">Rate</th>
                                    <th scope="col" class="border-bottom p-3" style="min-width: 130px;">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row" class="text-start p-3">1</th>
                                    <td class="text-start p-3">Hospital Charges</td>
                                    <td class="text-center p-3">1</td>
                                    <td class="p-3">$ 125</td>
                                    <td class="p-3">$ 125</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-start p-3">2</th>
                                    <td class="text-start p-3">Medicine</td>
                                    <td class="text-center p-3">1</td>
                                    <td class="p-3">$ 245</td>
                                    <td class="p-3">$ 245</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="text-start p-3">3</th>
                                    <td class="text-start p-3">Special Visit Fee(Doctor)</td>
                                    <td class="text-center p-3">1</td>
                                    <td class="p-3">$ 150</td>
                                    <td class="p-3">$ 150</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="row">
                            <div class="col-lg-4 col-md-5 ms-auto">
                                <ul class="list-unstyled h6 fw-normal mt-4 mb-0 ms-md-5 ms-lg-4">
                                    <li class="text-muted d-flex justify-content-between pe-3">Subtotal :<span>$ 520</span></li>
                                    <li class="text-muted d-flex justify-content-between pe-3">Taxes :<span> 0</span></li>
                                    <li class="d-flex justify-content-between pe-3">Total :<span>$ 520</span></li>
                                </ul>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>

                    <div class="border-top pt-4">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="text-sm-start text-muted text-center">
                                    <small class="mb-0">Customer Services : <a href="tel:+152534-468-854" class="text-warning">(+12) 1546-456-856</a></small>
                                </div>
                            </div><!--end col-->

                            <div class="col-sm-6">
                                <div class="text-sm-end text-muted text-center">
                                    <small class="mb-0"><a href="#" class="text-primary">Terms & Conditions</a></small>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div>

                <!-- <div class="text-end mt-4 pt-2">
                    <a href="javascript:window.print()" class="btn btn-soft-primary d-print-none"><i class="uil uil-print"></i> Print</a>
                </div> -->
            </div>
        </div>
    </div>
</div>
<!-- View Invoice End -->

<!-- javascript -->
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="../assets/js/simplebar.min.js"></script>
<!-- Icons -->
<script src="../assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="../assets/js/app.js"></script>

</body>

</html>

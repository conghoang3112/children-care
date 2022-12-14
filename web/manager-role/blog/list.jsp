<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <div>
                        <h5 class="mb-0">Blogs</h5>

                        <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                            <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">ChildrenCare</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                            </ul>
                        </nav>
                    </div>

                    <div class="mt-4 mt-sm-0">
                        <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newblogadd">Add Blog</a>
                    </div>
                </div>

                <div class="row">
                    <c:forEach items="${blogList}" var="blog">
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="${pageContext.request.contextPath}/manager-role/assets/images/blog/${blog.titleImage}" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i><fmt:formatDate pattern = "yyyy-MM-dd hh:MM:ss" value = "${blog.time}" /></li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">${blog.title}</a>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>${blog.heart}</a></li>
                                        <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>${blog.comment}</a></li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                    </c:forEach>
                </div><!--end row-->

                <c:if test="${totalPage > 1}">
                <div class="row text-center">
                    <!-- PAGINATION START -->
                    <div class="col-12 mt-4">
                        <div class="d-md-flex align-items-center text-center justify-content-between">
                            <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                <c:if test="${currentPage != 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/blogs?pageNumber=${currentPage - 1}" aria-label="Previous">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${totalPage}">
                                    <li class="page-item ${i == currentPage ? ' active' : ''}">
                                        <a class="page-link" href="${pageContext.request.contextPath}/blogs?pageNumber=${i}" href="#">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${currentPage < totalPage}">
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/blogs?pageNumber=${currentPage + 1}" aria-label="Next">Next</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div><!--end col-->
                    <!-- PAGINATION END -->
                </div>
                </c:if>
        </div><!--end container-->

        <jsp:include page="../common/footer.jsp"></jsp:include>
    </main>
    <!--End page-content" -->
</div>
<!-- page-wrapper -->

<!-- Start Modal -->
<div class="modal fade" id="newblogadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom p-3">
                <h5 class="modal-title" id="exampleModalLabel">Add Blog</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-3 pt-4">
                <div class="row">
                    <div class="col-md-4">
                        <div class="d-grid">
                            <p class="text-muted">Upload your blog image here, Please click "Upload Image" Button.</p>
                            <div class="preview-box d-block justify-content-center rounded shadow overflow-hidden bg-light p-1"></div>
                            <input type="file" id="input-file" name="input-file" accept="image/*" onchange={handleChange()} hidden />
                            <label class="btn-upload btn btn-primary mt-4" for="input-file">Upload Image</label>
                        </div>
                    </div><!--end col-->

                    <div class="col-md-8 mt-4 mt-sm-0">
                        <div class="ms-md-4">
                            <form>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Blog Title <span class="text-danger">*</span></label>
                                            <input name="name" id="name" type="text" class="form-control" placeholder="Title :">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"> Date : </label>
                                            <input name="date" type="text" class="form-control" id="date" value="09 January 2021">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label"> Time to read : </label>
                                            <input name="time" type="text" class="form-control" id="time" value="5 min read">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Tag</label>
                                            <select class="form-control">
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

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Description <span class="text-danger">*</span></label>
                                            <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Blog description :"></textarea>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-12 text-end">
                                        <button type="submit" class="btn btn-primary">Add Blog</button>
                                    </div><!--end col-->
                                </div>
                            </form>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </div>
    </div>
</div>
<!-- End modal -->

<!-- javascript -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/simplebar.min.js"></script>
<!-- Icons -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/manager-role/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/manager-role/assets/js/upload_file_util.js"></script>

<script>
    const handleChange = () => {
        const fileUploader = document.querySelector('#input-file');
        const getFile = fileUploader.files
        if (getFile.length !== 0) {
            const uploadedFile = getFile[0];
            readFile(uploadedFile);
        }
    }

    const readFile = (uploadedFile) => {
        if (uploadedFile) {
            const reader = new FileReader();
            reader.onload = () => {
                const parent = document.querySelector('.preview-box');
                parent.innerHTML = `<img class="preview-content" src=${reader.result} />`;
            };

            reader.readAsDataURL(uploadedFile);
        }
    };
</script>
</body>

</html>

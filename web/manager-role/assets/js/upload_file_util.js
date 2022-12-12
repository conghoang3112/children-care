function viewUploadFile(event) {
    if(event.target.files.length > 0){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("addDoctorImage");
        preview.src = src;
        // preview.style.display = "block";
    }
}

function removePreviewImage() {
    var preview = document.getElementById("addDoctorImage");
    preview.src = "";
}
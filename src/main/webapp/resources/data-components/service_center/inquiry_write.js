$(function() {
	CKEDITOR.replace("content",{
		filebrowserUploadUrl : "/guehamo/imgupload?_csrf=${_csrf.token}"
	})
})
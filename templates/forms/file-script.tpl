{* FileItem Class Script *}
<script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.3.2/uuidv4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.33/moment-timezone-with-data.min.js"></script>
<script>
    class Documents {
        constructor(data) {
            // If data is instance of File, then it's unuploaded file received from client
            // else if it's a JSON Object, then it's uploaded file data received from server
            this.id = uuidv4(); // Generate a unique id for this Documents item
            this.name = data?.name;
            this.size = data?.size;
            this.error = null;
            this.jqXHR = null;

            if (data instanceof File) {
                this.file = data;
                this.url = null;
                this.createdAt = data?.lastModified;
                this.createdBy = null;
                this.uploaded = false;
            } else {
                this.file = null;
                this.url = data?.url;
                this.createdAt = data?.createdAt;
                this.createdBy = data?.createdBy;
                this.uploaded = true;
            }
        }

        setUploadProgress(progress) {
            var progressBar = document.getElementById('progress-bar-' + this.id);
            // Change progress bar width
            progressBar.style.width = progress + '%';

        }

        setUploaded(data) {
            this.createdAt = data.createdAt;
            this.createdBy = data.createdBy;
            this.url = data.fileUrl;
            this.uploaded = true;
            this.updateDom();
        }

        setUploadError(error) {
            this.uploaded = true;
            this.error = error;
            console.log("Error: ", error);
            alert("An error occurred while uploading the file. Please try again.")
            this.updateDom();
        }

        getSizeInMB() {
            let fileSizeInMb = (this.size / 1024 / 1024).toFixed(2);
            return fileSizeInMb;
        }

        getSizeInKB() {
            let fileSizeInKB = (this.size / 1024).toFixed(2);
            return fileSizeInKB;
        }

        getTimestamp() {
            // Guess the user's timezone
            let currentTimezone = moment.tz.guess();

            // Convert timestamp to YYYY-MM-DD HH:MM:SS format
            let date = moment.utc(this.createdAt).tz(currentTimezone);

            let datePart = date.format('YYYY-MM-DD');
            let timePart = date.format('hh:mm:ss A');

            return datePart + " " + timePart;
        }

        upload() {
            let formData = new FormData();
            formData.append('files', this.file);
            let thisObj = this;
            let jqXHR = $.ajax({
                url: 'upload.php',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                xhr: function() {
                    var xhr = new window.XMLHttpRequest();
                    xhr.upload.addEventListener("progress", function(evt) {
                        if (evt.lengthComputable) {
                            var percentComplete = evt.loaded / evt.total;
                            percentComplete = parseInt(percentComplete * 100);
                            console.log(percentComplete);
                            thisObj.setUploadProgress(percentComplete);
                        }
                    }, false);
                    return xhr;
                },
                success: function(data) {
                    console.log(data);
                    thisObj.setUploaded(data);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (textStatus === 'abort') return;
                    let response = JSON.parse(jqXHR.responseText);
                    let errorMessage = response?.error ? response.error : errorThrown;
                    thisObj.setUploadError(errorMessage);
                }
            });
            this.jqXHR = jqXHR;
        }

        updateDom() {
            $("#" + this.id).html(this.getDom().html());
        }

        {literal}
            getDom() {
                let thisObj = this;
                let fileSizeInKb = this.getSizeInKB();
                let fileSizeInMb = this.getSizeInMB();
                let timestamp = this.getTimestamp();
                let createdBy = this.createdBy;

                let fileSizeInfo = fileSizeInMb < 1 ? fileSizeInKb + " KB" : fileSizeInMb +
                    " MB";

                let dom = $(
                    `
<div class="item" id="${this.id}">
<div class="progress ${this.uploaded ? 'hidden' : ''}">
<div id="progress-bar-${this.id}" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="file">
                            <div class="file-icon">
                                <svg width="48" height="48" version="1.1" viewBox="0 0 100 100" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M82.4,25.6l-20-20C62,5.2,61.5,5,61,5H23c-3.3,0-6,2.7-6,6v78c0,3.3,2.7,6,6,6h54c3.3,0,6-2.7,6-6V27  C83,26.5,82.8,26,82.4,25.6z M63,11.8L76.2,25H65c-1.1,0-2-0.9-2-2V11.8z M77,91H23c-1.1,0-2-0.9-2-2V11c0-1.1,0.9-2,2-2h36v14  c0,3.3,2.7,6,6,6h14v60C79,90.1,78.1,91,77,91z"></path></svg>
                            </div>
                            <div class="file-info">
<span class="mb-0"><a href="${this.url ? this.url : '#'}" target="_blank" class="text-link">${this.name}</a></span>
<span class="mb-0">${fileSizeInfo} ${this.uploaded ? `| ${timestamp} | ${createdBy}` : ''} </span>
<span class="mb-0 text-danger ${this.error ? '' : 'hidden'}">${this.error}</span>
                            </div>
<button class="btn-remove cancel_upload ${this.uploaded ? 'hidden' : ''}" type="button">&times;</button>
                        </div>
                    </div>
            `
                );

                dom.find('.cancel_upload').on('click', function(e) {
                    e.preventDefault();
                    thisObj.jqXHR.abort();
                    dom.remove();
                });

                return dom;
            }
        {/literal}

    }

    class DocumentManager {
        constructor(uploadedFiles) {
            this.uploaded = [];
            this.documents = [];

            uploadedFiles.forEach(file => {
                let doc = new Documents(file);
                this.documents.push(doc);
            })
        }

        setGallery(gallery) {
            this.gallery = gallery;
        }

        setUploadedGallery(gallery) {
            this.uploadedGallery = gallery;
        }

        render() {
            this.uploadedGallery.empty();
            this.documents.forEach(document => {
                this.uploadedGallery.append(document.getDom());
            })
        }

        onChange(files) {
            console.log("On Change", files);

            this.gallery.empty();

            for (let i = 0; i < files.length; i++) {
                let doc = new Documents(files[i]);
                this.gallery.append(doc.getDom());
                doc.upload();
            }
        }
    }
</script>
{* /FileItem class Script *}

{* File Upload Script *}
<script>
    {assign var="files" value=($files|default:'[]')}
    var uploadedFiles = {$files};
    let fileInput, uploadDropZone, gallery, uploadedGallery;

    function handleFileDrop(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).removeClass('highlight');
        if (e.originalEvent.dataTransfer) {
            let newFiles = e.originalEvent.dataTransfer.files;
            let files = fileInput.prop('files');

            if (newFiles.length) {
                let dt = new DataTransfer();

                for (let i = 0; i < newFiles.length; i++) {
                    let file = newFiles[i];
                    if (file.type === "application/pdf" || file.type === "image/jpeg" || file
                        .type === "image/png" || file.type === "image/jpg") {
                        dt.items.add(file);
                    } else {
                        alert("Invalid file type. Only PDF, JPEG, JPG, PNG files are allowed.");
                        continue;
                    }
                }

                if (dt.items.length > 0) {
                    for (let i = 0; i < files.length; i++) {
                        dt.items.add(files[i]);
                    }

                    fileInput.prop('files', dt.files);
                    fileInput.trigger('change');
                }

            }
        }
    }

    $(document).ready(function() {
        // Initialize components
        fileInput = $('.file-input');
        uploadDropZone = $('.upload_dropZone');
        gallery = fileInput.siblings('.uploading.files');
        uploadedGallery = fileInput.siblings('.uploaded.files');

        // Attach Event Listeners
        uploadDropZone.on('dragenter', function(e) {
            $(this).addClass('highlight');
        });

        uploadDropZone.on('dragleave', function(e) {
            e.preventDefault();
            e.stopPropagation();
            $(this).removeClass('highlight');
        });

        uploadDropZone.on('dragover', function(e) {
            e.preventDefault();
            e.stopPropagation();
        });

        uploadDropZone.on("drop", handleFileDrop);

        uploadDropZone.on('dragover', '*', function(e) {
            e.preventDefault();
            e.stopPropagation();
            uploadDropZone.addClass("highlight");
        });

        // Create DocumentManager

        let manager = new DocumentManager(uploadedFiles);
        manager.setGallery(gallery);
        manager.setUploadedGallery(uploadedGallery);
        manager.render();

        fileInput.on('change', function(e) {
            let files = this.files;
            manager.onChange(files);
        });
    });
</script>
{* /File Upload Script *}
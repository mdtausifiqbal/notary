{extends file="widgets/base-input.tpl"}

{assign var="id" value=($id|default:"file_upload")}
{assign var="accept" value=($accept|default:"*/*")}
{assign var="multiple" value=($multiple|default:"")}

{block name="input"}
    <div class="upload_dropZone text-center mb-3 p-4">
        <img srcset="https://img.icons8.com/?size=100&amp;id=4716&amp;format=png 1x, https://img.icons8.com/?size=200&amp;id=4716&amp;format=png 2x,"
            src="https://img.icons8.com/?size=200&amp;id=4716&amp;format=png" alt="Upload to Cloud" loading="lazy"
            width="100" height="100" style="width: 100px; height: 100px;" lazy="loaded">

        <p class="my-2">Drag files here to upload<br><i>or</i></p>

        <input id="{$id}" class="position-absolute invisible" name="{$name}" type="file"
            {if $multiple == "true"}multiple{/if} accept="{$accept}"
            {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach} />

        <label class="btn btn-primary mb-3" for="{$id}">Choose file(s)</label>

        <div class="files"></div>
    </div>
{/block}

<script>
    $(document).ready(function() {
        let fileInput = $('#{$id}');
        let uploadDropZone = $('.upload_dropZone');

        let gallery = fileInput.siblings('.files');

        uploadDropZone.on('dragenter', function(e) {
            $(this).addClass('highlight');
        });

        uploadDropZone.on('dragleave', function(e) {
            $(this).removeClass('highlight');
        });

        uploadDropZone.on('dragover', function(e) {
            e.preventDefault();
            e.stopPropagation();
        });

        uploadDropZone.on("drop", function(e) {
            e.preventDefault();
            $(this).removeClass('highlight');
            if (e.originalEvent.dataTransfer) {
                if (e.originalEvent.dataTransfer.files.length) {
                    fileInput.prop('files', e.originalEvent.dataTransfer.files);
                    fileInput.trigger('change');
                }
            }

        })

        fileInput.on('change', function() {
            var files = this.files;
            var fileCount = files.length;

            gallery.empty();

            console.log(files);

            for (var i = 0; i < fileCount; i++) {
                let file = files[i];
                let filename = file.name;
                let filesize = file.size; // convert this into kb or mb
                let filetype = file.type;

                let fileSizeInKb = (filesize / 1024).toFixed(2);
                let fileSizeInMb = (filesize / 1024 / 1024).toFixed(2);
                let fileSizeInfo = fileSizeInMb < 1 ? fileSizeInKb + " KB" : fileSizeInMb + " MB";
                let fileNameEl = $('<span class="mb-0">' + filename + '</span>');
                let fileSizeEl = $('<span class="mb-0">' + fileSizeInfo + '</span>');

                let fileEl = $(
                    '<div class="d-flex justify-content-between align-items-center item"></div>'
                );
                fileEl.append(fileNameEl);
                fileEl.append(fileSizeEl);
                gallery.append(fileEl);
            }
        });
    });
</script>
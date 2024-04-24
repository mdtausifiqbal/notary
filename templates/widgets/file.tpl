{extends file="widgets/base-input.tpl"}

{assign var="id" value=($id|default:"file_upload")}
{assign var="accept" value=($accept|default:"application/pdf,image/png,image/jpeg")}
{assign var="multiple" value=($multiple|default:"true")}
{assign var="fileSizeLimitMB" value=($fileSizeLimit|default:"5")}
{assign var="maxFiles" value=($maxFiles|default:"10")}

{block name="input"}
    <div class="upload_dropZone text-center mb-3 p-4">
        <img srcset="https://img.icons8.com/?size=100&amp;id=4716&amp;format=png 1x, https://img.icons8.com/?size=200&amp;id=4716&amp;format=png 2x,"
            src="https://img.icons8.com/?size=200&amp;id=4716&amp;format=png" alt="Upload to Cloud" loading="lazy"
            width="100" height="100" style="width: 100px; height: 100px;" lazy="loaded">

        <p class="my-2">Drag files here to upload<br><i>or</i></p>

        <input id="{$id}" class="position-absolute invisible file-input" name="{$name}" type="file"
            data-max-files="{$maxFiles}" data-file-size-limit="{$fileSizeLimitMB}" {if $multiple == "true"}multiple{/if}
            accept="{$accept}" {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach} />

        <label class="btn btn-primary mb-3" for="{$id}">Choose file(s)</label>

        <p>Accepted file types: PDF, JPG, PNG, max. file size: {$fileSizeLimitMB} MB, max. files: {$maxFiles}.
        </p>

        <div class="files uploaded"></div>
        <div class="files uploading" style="margin-top: 1rem;"></div>
    </div>
{/block}
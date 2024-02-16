{extends file="base.tpl"}



{block "content"}
    <div class="container">
        <div class="row">
            {foreach from=$forms item=form}
                {include file="form-item.tpl" title=$form.title image=$form.image link=$form.url}
            {/foreach}
        </div>
    </div>
{/block}
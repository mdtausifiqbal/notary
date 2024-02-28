{assign var="drafts" value=($drafts|default:"")}

{if $drafts ne ""}
    {section name=draft loop=$drafts}
        {assign var="name" value=$drafts[draft].name}
        {foreach from=$drafts[draft].list item=item}
            <div class="form-group col-12 col-sm-3" data-group="{$name}s" data-index="{$item}">
                <label class="fw-medium">Draft to {$name} {$item}</label>
                {include file="widgets/checkbox.tpl" label="per Email" name="with-draft-{$name}-email{$item}" value="Email"}
                {include file="widgets/checkbox.tpl" label="per Post" name="with-draft-{$name}-post{$item}" value="Post"}
            </div>
        {/foreach}
    {/section}
{/if}
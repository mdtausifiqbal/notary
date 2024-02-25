{assign var="buyers" value=($buyers_list)}
{assign var="sellers" value=($sellers_list)}

{foreach from=$sellers item=seller}
    <fieldset class="col-sm-12 col-md-3" data-group="sellers" data-index="{$seller}">
        <legend>Draft to seller {$seller}</legend>
        {include file="widgets/checkbox.tpl" label="per Email" name="with-draft-seller-email{$seller}" value="Email"}
        {include file="widgets/checkbox.tpl" label="per Post" name="with-draft-seller-post{$seller}" value="Post"}
    </fieldset>
{/foreach}

{foreach from=$buyers item=buyer}
    <fieldset class="col-sm-12 col-md-3" data-group="buyers" data-index="{$buyer}">
        <legend>Draft to buyer {$buyer}</legend>
        {include file="widgets/checkbox.tpl" label="per Email" name="with-draft-buyer-email{$buyer}" value="Email"}
        {include file="widgets/checkbox.tpl" label="per Post" name="with-draft-buyer-post{$buyer}" value="Post"}
    </fieldset>
{/foreach}
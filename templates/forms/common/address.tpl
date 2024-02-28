{extends file="widgets/base.tpl"}

{assign var="prefix" value=($prefix|default:"")}

{if $prefix neq ""}
    {assign var="prefix" value=$prefix|cat:"-"}
{/if}

{block name="base"}
    <div {include file="widgets/attrs.tpl" attribs=$parentProps}>
        <label class="fw-medium">{$label}</label>
        <div class="row">
            {include file="widgets/input.tpl" label="Street and house number" name="{$prefix}address-street"
            class="col-12"}

            {include file="widgets/input.tpl" label="Zip Code" name="{$prefix}address-zipcode" class="col-12
        col-sm-6"}

            {include file="widgets/input.tpl" label="Location" name="{$prefix}address-location" class="col-12 col-sm-6"}
        </div>
    </div>
{/block}
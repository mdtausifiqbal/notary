{extends file="widgets/base.tpl"}

{assign var="checked" value=($checked|default:"false")}
{assign var="direction" value=($direction|default:"vertical")}
{assign var="inputType" value=($inputType|default:"text")}
{assign var="label" value=($label|default:$value)}

{block name="base"}
    <div class="form-check{if $direction == 'horizontal'} form-check-inline{/if}">
        <input type="{$inputType}" class="form-check-input" id="input-{$name}-{$value|lower}" name="{$name}"
            value="{$value}" {if $checked == "true"}checked{/if} {include file="widgets/attrs.tpl" attribs=$inputProps}>
        <label class="form-check-label" for="input-{$name}-{$value|lower}">{$value}</label>
    </div>
{/block}
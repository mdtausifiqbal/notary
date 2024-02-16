{extends file="widgets/base-input.tpl"}

{assign var="placeholder" value=($placeholder|default:"")}
{assign var="inputType" value=($type|default:"text")}

{block name="input"}
    <input type="{$inputType}" class="form-control" id="input-{$name}" name="{$name}" placeholder="{$placeholder}"
        {if value != ""}value="{$value}" {/if}{include file="widgets/attrs.tpl" attribs=$inputProps}>
{/block}
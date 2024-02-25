{extends file="widgets/base-input.tpl"}

{assign var="cardLabel" value=false}
{assign var="items" value=($items|default:[])}
{assign var="values" value=($values|default:$items)}
{assign var="multiple" value=($multiple|default:"false")}

{block name="input"}
    <br />
    <ul data-name="{$name}" data-multiple="{$multiple}" id="input-{$name}" class="tags mt-2"
        {include file="widgets/attrs.tpl" attribs=$inputProps}>
        {for $i=0 to count($values)-1}
            {assign var="itemLabel" value=$items[$i]}
            {assign var="itemValue" value=$values[$i]}
            <input type="hidden" {if $multiple == "true"}name="{$name}[]" {else}name="{$name}" {/if}
                id="input-{$name}-{$itemValue|lower}" value="{$itemValue}" disabled />
            <li role="button" class="tag tag-selector" data-value="{$itemValue}">
                {$itemLabel}
            </li>
        {/for}
    </ul>
{/block}
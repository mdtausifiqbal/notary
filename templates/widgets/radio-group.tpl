{extends file="widgets/base-input.tpl"}

{assign var="items" value=($items|default:[])}
{assign var="values" value=($values|default:$items)}
{assign var="cardLabel" value=false}

{block name="input"}
    <br>
    {for $i=0 to (count($items)-1)}
        {assign var="item" value=$items[$i]}
        {assign var="val" value=$values[$i]}
        {include file="widgets/radio.tpl" label=$item value=$val checked=(($value == $val) ? "true" : "false")}
    {/for}
{/block}
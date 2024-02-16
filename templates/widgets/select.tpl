{extends file="widgets/base-input.tpl"}

{assign var="items" value=($items|default:[])}

{block name="input"}
    <select name="{$name}" id="input-{$name}" class="custom-select"
        {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
        {foreach from=$items item=selectItem}
            <option value="{$selectItem}" {($selectItem == $value) ? "selected" : ""}>{$selectItem}</option>
        {/foreach}
    </select>
{/block}
{assign var="className" value=($class|default:"")}
{assign var="label" value=($label|default:"")}
{assign var="value" value=($value|default:"")}
{assign var="name" value=($name|default:"")}
{assign var="items" value=($items|default:[])}
{assign var="parentProps" value=($parentProps|default:[])}
{assign var="inputProps" value=($inputProps|default:[])}

<div class="form-group card-label {$className}" {foreach $parentProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
    <label for="input-{$name}">{$label}</label>
    <select name="{$name}" id="input-{$name}" class="custom-select"
        {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
        {foreach from=$items item=selectItem}
            <option value="{$selectItem}" {($selectItem == $value) ? "selected" : ""}>{$selectItem}</option>
        {/foreach}
    </select>
</div>
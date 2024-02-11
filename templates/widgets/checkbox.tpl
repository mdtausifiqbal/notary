{assign var="className" value=($class|default: "")}
{assign var="label" value=($label|default: "")}
{assign var="name" value=($name|default:"")}
{assign var="value" value=($value|default: $label)}
{assign var="parentProps" value=($parentProps|default:[])}
{assign var="inputProps" value=($inputProps|default:[])}
{assign var="direction" value=($direction|default:"horizontal")}
{assign var="isChecked" value=($checked|default: "false")}

<div class="form-group {$className}">
    <div class="form-check {($direction == 'horizontal') ? 'form-check-inline' : ''}"
        {foreach $parentProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
        <input type="checkbox" name="{$name}" id="input-{$name}" class="form-check-input" value="{$value}"
            {if $isChecked == "true"}checked{/if} {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
        <label for="input-{$name}" class="form-check-label">{$label}</label>
    </div>
</div>
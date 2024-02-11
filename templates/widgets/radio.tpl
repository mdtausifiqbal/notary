{assign var="className" value=($class|default: "")}
{assign var="label" value=($label|default: "")}
{assign var="name" value=($name|default:"")}
{assign var="value" value=($value|default: "")}
{assign var="items" value=($items|default:[])}
{assign var="values" value=($values|default:$items)}
{assign var="parentProps" value=($parentProps|default:[])}
{assign var="inputProps" value=($inputProps|default:[])}
{assign var="direction" value=($direction|default:"vertical")}

<div class="form-group {$className}" {foreach $parentProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
    <label for="">{$label}</label><br>
    {for $i=0 to (count($items)-1)}
        {assign var="item" value=$items[$i]}
        {assign var="val" value=$values[$i]}
        <div class="form-check {($direction == 'horizontal') ? 'form-check-inline' : ''}">
            <input type="radio" name="{$name}" id="input-{$name}-{$val|lower}" class="form-check-input" value="{$val}"
                {($value == $val) ? "checked" : ""} {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
            <label for="input-{$name}-{$val|lower}" class="form-check-label">{$item}</label>
        </div>
    {/for}
</div>
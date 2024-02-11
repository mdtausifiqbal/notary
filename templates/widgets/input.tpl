{assign var="className" value=($class|default:"")}
{assign var="label" value=($label|default:"")}
{assign var="name" value=($name|default:"")}
{assign var="placeholder" value=($placeholder|default:"")}
{assign var="parentProps" value=($parentProps|default:[])}
{assign var="inputProps" value=($inputProps|default:[])}
{assign var="inputType" value=($type|default:"text")}

<div class="form-group card-label {$className}" {foreach $parentProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
    <label for="input-{$name}">{$label}</label>
    <input type="{$inputType}" class="form-control" id="input-{$name}" name="{$name}" placeholder="{$placeholder}"
        {foreach $inputProps as $attrib}{$attrib@key}="{$attrib}" {/foreach}>
</div>
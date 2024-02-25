{extends file="widgets/base.tpl"}

{assign var="cardLabel" value=($cardLabel|default:true)}

{block name="base"}
    <div class="form-group {if $cardLabel}card-label{/if} {$class}" {include file="widgets/attrs.tpl" attribs=$parentProps}
        id="group-{$name}">
        <label for="input-{$name}" class="fw-medium">{$label}</label>
        {block name="input"}{/block}
    </div>
{/block}
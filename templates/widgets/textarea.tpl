{extends file="widgets/base-input.tpl"}

{block name="input"}
    <textarea class="form-control" id="input-{$name}" name="{$name}"
        {include file="widgets/attrs.tpl" attribs=$inputProps}>{$value}</textarea>
{/block}
{extends file="widgets/radio-group.tpl"}

{assign var="items" value=["Yes", "No"]}
{assign var="direction" value="horizontal"}
{assign var="value" value=($value|default:"No")}
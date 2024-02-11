{assign var="items" value=["Yes", "No"]}
{assign var="direction" value="horizontal"}
{assign var="value" value=($value|default:"No")}

{extends file="widgets/radio.tpl"}
{assign var="attribs" value=($attribs|default:[])}
{foreach $attribs as $attrib}{$attrib@key}="{$attrib}" {/foreach}
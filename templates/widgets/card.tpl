{assign var="cardIndex" value=($cardIndex|default:"")}
{assign var="cardTitle" value=($cardTitle|default:"")}

{if $cardIndex ne ""}
    {assign var="cardIndex" value=$cardIndex|cat:". "}
{/if}

<div class="card contact-card">
    <div class="card-header">
        <h4 class="card-title">{$cardIndex}{$cardTitle}</h4>
    </div>
    <div class="card-body">
        {block name="card_body"}{/block}
    </div>
</div>
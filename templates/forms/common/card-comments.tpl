{extends file="widgets/card.tpl"}

{assign var="cardTitle" value="Additional Information"}

{block name="card_body"}
    <div class="row">
        {include file="widgets/textarea.tpl" label="Comments" name="additional_information" class="col-sm-12" inputProps=['rows' => "3"]}
    </div>
{/block}
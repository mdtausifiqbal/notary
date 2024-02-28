{extends file="widgets/card.tpl"}
{assign var="cardTitle" value="Files"}

{block name="card_body"}
    {include file="widgets/file.tpl" label="Upload document(s) (optional)" name="documents" class="col-sm-12" inputProps=['multiple' => true]}
{/block}
{extends file="widgets/card.tpl"}

{assign var="cardTitle" value="Client Details"}

{block name="card_body"}
    <div class="row">
        {include file="widgets/input.tpl" label="Client Name" name="client_name" class="col-sm-12"}
        {include file="widgets/tags.tpl" label="Contact <small class='text-danger'><em>*</em></small>" items=["Email", "Telephone", "Post"] name="contact" class="col-sm-12" inputProps=["data-target" => "[data-group=applicant_contact]", "data-toggle" => "form-select"] multiple="true"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Client Email" name="client_email" class="col-12 col-sm-6 hidden" parentProps=["data-visible" => "Email", "data-group" => "applicant_contact"]}
        {include file="widgets/input.tpl" label="Client Phone" name="client_phone" class="col-12 col-sm-6 hidden" parentProps=["data-visible" => "Telephone", "data-group" => "applicant_contact"]}
    </div>
    {include file="forms/common/address.tpl" label="Client Address" parentProps=["data-visible" => "Post", "data-group" => "applicant_contact"] prefix="client" class="col-sm-12"}
{/block}
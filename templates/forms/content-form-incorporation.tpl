{extends file="forms/base-form.tpl"}

{block name="form_content"}
    <!-- Company Details -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">I. Company Details</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/input.tpl" label="Company Name" name="company_name" class="col-sm-12"}
                {include file="widgets/input.tpl" label="Seat" name="seat" class="col-sm-12" inputProps=["placeholder" => "Place"]}
            </div>
            {include file="forms/common/address.tpl" label="Domestic Business Address" prefix="domestic"}
            <div class="row">
                {include file="widgets/input.tpl" label="Purpose of the Company" name="purpose" class="col-sm-12"}

                {assign var="legal_form_items" value=["Ltd", "UG (limited liability)"]}
                {assign var="legal_form_values" value=["ltd", "ug"]}
                {include file="widgets/tags.tpl" label="Legal form" name="legal_form" class="col-12 col-sm-6" items=$legal_form_items values=$legal_form_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=legal_form]", "data-default" => "ltd"]}

                {include file="widgets/tags.tpl" label="Amount of share capital" name="share_capital" class="col-12 col-sm-6" items=["25,000 EUR", "Other Amount"] values=["25000 EUR", "other_amount"] inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=share_capital]", "data-default" => "25000 EUR"]}
            </div>
            <div class="row" data-group="share_capital" data-visible="other_amount">
                {include file="widgets/input.tpl" label="Other amount of share capital" name="other_share_capital" class="col-12"}
            </div>
            <div class="row" data-group="legal_form" data-visible="ltd">
                {include file="widgets/tags.tpl" label="Provision of share capital" name="provision_of_share_capital" class="col-12 col-sm-6" items=["In full", "In the amount of 50%"]}

                {assign var="incorporation_type_items" value=["The share capital is provided by payment (as a rule)", "The share capital is provided by tangible assets"]}
                {assign var="incorporation_type_values" value=["payment", "tangible_assets"]}
                {include file="widgets/tags.tpl" label="Type of incorporation" name="type_of_incorporation" class="col-12 col-sm-6" items=$incorporation_type_items values=$incorporation_type_values}

            </div>
            <div class="row">
                {assign var="social_contract_items" value=["Individual articles of association (as a rule)", "Statutory Model Protocol"]}
                {assign var="social_contract_values" value=["individual_articles_of_association", "statutory_model_protocol"]}
                {include file="widgets/tags.tpl" label="Social contract" name="social_contract" class="col-12" items=$social_contract_items values=$social_contract_values}
            </div>
        </div>
    </div>
    <!-- /Company Details -->

    <!-- Founders Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the founders</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="founders_list" value=["1", "2", "3", "4", "5+"]}

                {include file="widgets/tags.tpl" label="Number of founders" name="number_of_founders" class="col-12" items=$founders_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=founders]", "data-max-items" => "4"]}
            </div>
            {for $i=1 to count($founders_list)}
                {include file="forms/incorporation/founders.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Founders Information -->

    <!-- External Managers -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">III. External Managing Directors</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="managers_list" value=["0", "1", "2"]}
                {include file="widgets/tags.tpl" label="Number of external managing directors" name="total_external_managers" class="col-12" items=$managers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=managers]", "data-max-items" => "2", "data-default" => "0"]}
            </div>
            {for $i=1 to count($managers_list)}
                {include file="forms/incorporation/managers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /External Managers -->

    <!-- More Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">IV. More Information</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Do all founders take part in the certification?" name="founders_certification_participated" class="col-12 col-sm-6" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=founders_certification]", "data-default" => "Yes"]}
                {include file="widgets/input.tpl" label="Who does not take part in the certification?" name="founders_certification_not_participated" class="col-12 col-sm-6" parentProps=["data-group" => "founders_certification", "data-visible" => "No"]}

                {include file="widgets/yes-no.tpl" label="Can all founders speak sufficient German?" name="founders_speak_sufficient_german" class="col-12 col-sm-6" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=founders_interpreter_required]", "data-default" => "Yes"]}
                {include file="widgets/input.tpl" label="For whom and in which language is an interpreter required?" name="founders_interpreter_required" class="col-12 col-sm-6" parentProps=["data-group" => "founders_interpreter_required", "data-visible" => "No"]}
            </div>
        </div>
    </div>
    <!-- /More Information -->

    <!-- Additional Information -->
    {include file="forms/common/card-comments.tpl" cardIndex="V"}
    <!-- /Additional Information -->

    <!-- Files -->
    {include file="forms/common/card-files.tpl" cardIndex="VI"}
    <!-- /Files -->

    <!-- Client Details -->
    {include file="forms/common/card-client.tpl" cardIndex="VII"}
    <!-- /Client Details -->

    <!-- Confirm and Send -->
    {assign var="draft_list" value=[array("name" => "founder", "list" => $founders_list)]}
    {include file="forms/common/card-commissioning.tpl" cardIndex="VIII" formType="incorporation" drafts=$draft_list}
    <!-- /Confirm and Send -->

{/block}
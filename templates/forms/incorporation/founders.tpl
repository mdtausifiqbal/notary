<div data-group="founders" data-index={$i}>
    <hr>
    <h3>Founder {$i}</h3>
    <div class="row">
        {assign var="founderTypes" value=["Person", "Company"]}
        {include file="widgets/tags.tpl" label="Type of shareholder" name="founder_type{$i}" class="col-12 col-sm-6"
        items=$founderTypes inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=founder_type{$i}]",
        "data-default" => "Person"]}

        {include file="widgets/input.tpl" label="Amount of participation in percent" name="founder_participation{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row" data-group="founder_type{$i}" data-visible="Person">
        {include file="widgets/input.tpl" label="Salutation* /Title" name="founder_title{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="First name" name="founder_first_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Last name" name="founder_last_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Maiden name" name="founder_maiden_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Date of birth" name="founder_date_of_birth{$i}" class="col-12
        col-sm-4" type="date"}

        {include file="widgets/input.tpl" label="Nationality" name="founder_nationality{$i}" class="col-12 col-sm-4"}

        {assign var="marital_items" value=["Single", "Married", "Widowed", "Divorced", "Living in a registered civil partnership"]}

        {include file="widgets/tags.tpl" label="Marital status" name="founder_marital_status{$i}" class="col-12"
        items=$marital_items inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=founder_marital{$i}]"]}

        <div class="row col-12" data-group="founder_marital{$i}" data-visible="Married">
            {include file="widgets/yes-no.tpl" label="Marriage settlement" name="founder_marriage_settlement{$i}"
            class="col-12 col-sm-6"}

            {include file="widgets/yes-no.tpl" label="Foreign reference" name="founder_foreign_reference{$i}"
            class="col-12 col-sm-6"}
        </div>

        {include file="forms/common/address.tpl" label="Address" name="founder_address{$i}" class="col-12"
        prefix="founders"}
    </div>
    <div class="row" data-group="founder_type{$i}" data-visible="Company">
        {include file="widgets/input.tpl" label="Name of the company" name="founder_company_name{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Headquarters of the company" name="founder_company_headquarters{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Registry Court" name="founder_registry_court{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Registry Number" name="founder_registry_number{$i}" class="col-12
        col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Telephone" name="founder_telephone{$i}" class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="E-mail" name="founder_email{$i}" class="col-12 col-sm-6"}
    </div>
    <div class="row" data-group="founder_type{$i}" data-visible="Person">
        {include file="widgets/yes-no.tpl" label="Appointment as managing director" name="founder_appointed_as_md{$i}"
        class="col-12 col-sm-4" inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=founder_md{$i}]", "data-default" => "No"]}

        <div class="row col-12 col-sm-8" data-group="founder_md{$i}" data-visible="Yes">
            {include file="widgets/yes-no.tpl" label="Individual power of representation" name="founder_individual_power_of_representation{$i}"
            class="col-12 col-sm-6" inputProps=["data-default" => "Yes"]}

            {include file="widgets/yes-no.tpl" label="Exemption from § 181 BGB" name="founder_exemption_from_181_bgb{$i}"
            class="col-12 col-sm-6"
            inputProps=["data-default" => "Yes"]}
        </div>
    </div>
</div>
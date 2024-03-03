<div data-group="buyers" data-index={$i}>
    <hr>
    <h3>Buyer {$i}</h3>
    <div class="row">
        {assign var="buyerTypes" value=["Person", "Company"]}
        {include file="widgets/tags.tpl" label="Type of shareholder" name="buyer_type{$i}" class="col-12 col-sm-6"
        items=$buyerTypes inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=buyer_type{$i}]",
        "data-default" => "Person"]}
    </div>
    <div class="row" data-group="buyer_type{$i}" data-visible="Person">
        {include file="widgets/input.tpl" label="Salutation* /Title" name="buyer_title{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="First name" name="buyer_first_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Last name" name="buyer_last_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Maiden name" name="buyer_maiden_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Date of birth" name="buyer_date_of_birth{$i}" class="col-12
        col-sm-4" type="date"}

        {include file="widgets/input.tpl" label="Nationality" name="buyer_nationality{$i}" class="col-12 col-sm-4"}

        {assign var="marital_items" value=["Single", "Married", "Widowed", "Divorced", "Living in a registered civil partnership"]}

        {include file="widgets/tags.tpl" label="Marital status" name="buyer_marital_status{$i}" class="col-12"
        items=$marital_items inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=buyer_marital{$i}]"]}

        <div class="row col-12" data-group="buyer_marital{$i}"
            data-visible="Married|Living in a registered civil partnership">
            {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Spouse buys too" name="buyer-spouse_buys{$i}"}

            {include file="widgets/yes-no.tpl" label="Marriage settlement" name="buyer_marriage_settlement{$i}"
            class="col-12 col-sm-4"}

            {include file="widgets/yes-no.tpl" label="Foreign reference" name="buyer_foreign_reference{$i}"
            class="col-12 col-sm-4"}
        </div>

        {include file="forms/common/address.tpl" label="Address" name="buyer_address{$i}" class="col-12"
        prefix="buyers"}
    </div>
    <div class="row" data-group="buyer_type{$i}" data-visible="Company">
        {include file="widgets/input.tpl" label="Name of the company" name="buyer_company_name{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Headquarters of the company" name="buyer_company_headquarters{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Registry Court" name="buyer_registry_court{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Registry Number" name="buyer_registry_number{$i}" class="col-12
        col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Telephone" name="buyer_telephone{$i}" class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="E-mail" name="buyer_email{$i}" class="col-12 col-sm-6"}
    </div>
    <div class="row" data-group="buyer_type{$i}" data-visible="Person">
        <h4>Further information about buyer {$i}</h4>

        {include file="widgets/yes-no.tpl" label="Appointment as managing director" name="buyer_appointed_as_md{$i}"
        class="col-12 col-sm-4" inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=buyer_md{$i}]", "data-default" => "No"]}

        <div class="row col-12 col-sm-8" data-group="buyer_md{$i}" data-visible="Yes">
            {include file="widgets/yes-no.tpl" label="Individual power of representation" name="buyer_individual_power_of_representation{$i}"
            class="col-12 col-sm-6" inputProps=["data-default" => "Yes"]}

            {include file="widgets/yes-no.tpl" label="Exemption from § 181 BGB" name="buyer_exemption_from_181_bgb{$i}"
            class="col-12 col-sm-6"
            inputProps=["data-default" => "Yes"]}
        </div>

        <div class="row col-12">
            {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-12 col-sm-6" name="buyer-interpreter{$i}"
            inputProps=['data-target' => "[data-group=interpreter]", "data-toggle" => "form-select", "data-default" =>
            "No"]}

            {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-12 col-sm-6" name="buyer-physically_limited{$i}"
            inputProps=['data-target' => "[data-group='physically_limited']", "data-toggle" => "form-select",
            "data-default"
            => "No"]}
        </div>

        <div class="row col-12">
            {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-sm-6" name="buyer-interpreter_language{$i}"
            parentProps=["data-visible" => "Yes", "data-group" => "interpreter"]}

            {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-sm-6" name="buyer-physical_limitation{$i}"
            parentProps=["data-visible" => "Yes", "data-group" => "physically_limited"]}
        </div>

        {include file="widgets/yes-no.tpl" label="Acting on behalf of others" class="col-sm-6" name="buyer-acting_others{$i}"}

        {include file="widgets/yes-no.tpl" label="Politically exposed person" class="col-sm-6" name="buyer-politically_exposed{$i}"}

        {include file="widgets/textarea.tpl" label="Other comments about buyer {$i}" class="col-sm-12"
        name="buyer-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
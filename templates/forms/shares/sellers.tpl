<div data-group="sellers" data-index={$i}>
    <hr>
    <h3>Seller {$i}</h3>
    <div class="row">
        {assign var="sellerTypes" value=["Person", "Company"]}
        {include file="widgets/tags.tpl" label="Type of shareholder" name="seller_type{$i}" class="col-12 col-sm-6"
        items=$sellerTypes inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=seller_type{$i}]",
        "data-default" => "Person"]}
    </div>
    <div class="row" data-group="seller_type{$i}" data-visible="Person">
        {include file="widgets/input.tpl" label="Salutation* /Title" name="seller_title{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="First name" name="seller_first_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Last name" name="seller_last_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Maiden name" name="seller_maiden_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Date of birth" name="seller_date_of_birth{$i}" class="col-12
        col-sm-4" type="date"}

        {include file="widgets/input.tpl" label="Nationality" name="seller_nationality{$i}" class="col-12 col-sm-4"}

        {assign var="marital_items" value=["Single", "Married", "Widowed", "Divorced", "Living in a registered civil partnership"]}

        {include file="widgets/tags.tpl" label="Marital status" name="seller_marital_status{$i}" class="col-12"
        items=$marital_items inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=seller_marital{$i}]"]}

        <div class="row col-12" data-group="seller_marital{$i}"
            data-visible="Married|Living in a registered civil partnership">
            {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Spouse also sells" name="seller-spouse_sells{$i}"}

            {include file="widgets/yes-no.tpl" label="Marriage settlement" name="seller_marriage_settlement{$i}"
            class="col-12 col-sm-4"}

            {include file="widgets/yes-no.tpl" label="Foreign reference" name="seller_foreign_reference{$i}"
            class="col-12 col-sm-4"}
        </div>

        {include file="forms/common/address.tpl" label="Address" name="seller_address{$i}" class="col-12"
        prefix="sellers"}
    </div>
    <div class="row" data-group="seller_type{$i}" data-visible="Company">
        {include file="widgets/input.tpl" label="Name of the company" name="seller_company_name{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Headquarters of the company" name="seller_company_headquarters{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Registry Court" name="seller_registry_court{$i}" class="col-12
        col-sm-6"}
        {include file="widgets/input.tpl" label="Registry Number" name="seller_registry_number{$i}" class="col-12
        col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Telephone" name="seller_telephone{$i}" class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="E-mail" name="seller_email{$i}" class="col-12 col-sm-6"}

        {include file="widgets/yes-no.tpl" label="Open loans between Seller {$i} and the target company"
        name="seller_open_loans{$i}" class="col-sm-6" inputProps=["data-toggle"=>"form-select",
        "data-target"=>"[data-group=seller_open_loans{$i}]"]}

        {include file="widgets/input.tpl" label="Amount of the open shareholder loan" name="open_shareholder_loan_amount" class="col-sm-6" parentProps=["data-group"=>"seller_open_loans{$i}",
        "data-visible"=>"Yes"]}
    </div>
    <div class="row" data-group="seller_type{$i}" data-visible="Person">
        <h4>Further information about seller {$i}</h4>

        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-12 col-sm-6" name="seller-interpreter{$i}"
        inputProps=['data-target' => "[data-group=interpreter]", "data-toggle" => "form-select", "data-default" =>
        "No"]}

        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-12 col-sm-6" name="seller-physically_limited{$i}"
        inputProps=['data-target' => "[data-group='physically_limited']", "data-toggle" => "form-select",
        "data-default"
        => "No"]}

        <div class="row col-12">
            {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-sm-6" name="seller-interpreter_language{$i}"
            parentProps=["data-visible" => "Yes", "data-group" => "interpreter"]}

            {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-sm-6" name="seller-physical_limitation{$i}"
            parentProps=["data-visible" => "Yes", "data-group" => "physically_limited"]}
        </div>

        {include file="widgets/yes-no.tpl" label="Acting on behalf of others" class="col-sm-6" name="seller-acting_others{$i}"}

        {include file="widgets/yes-no.tpl" label="Politically exposed person" class="col-sm-6" name="seller-politically_exposed{$i}"}

        {include file="widgets/textarea.tpl" label="Other comments about seller {$i}" class="col-sm-12"
        name="seller-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
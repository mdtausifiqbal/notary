<div data-index="{$i}" class="sellers hidden">
    <hr>
    <h3>Seller {$i}</h3><br>
    <div class="row">
        {include file="widgets/radio.tpl" class="col-sm-12" direction="horizontal" label="Type of seller" name="seller-type{$i}"
        value="Person"
        items=["Person", "Company"] inputProps=["data-toggle" => "form-toggle", "data-target" =>
        "[data-group=seller]", "data-default" => "Person"]}
    </div>
    <div class="row" data-visible="Company" data-group="seller">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Name of the company" name="seller-company-name{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Headquarters of the company" name="seller-company-headquarters{$i}"
        placeholder="Location"}
    </div>
    <div class="row" data-visible="Company" data-group="seller">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Registry court" name="seller-registry_court{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Registry number" name="seller-registry_number{$i}"
        }
    </div>
    <div class="row" data-visible="Company" data-group="seller">
        {include file="widgets/input.tpl" label="Street and house number" name="seller-company-address-street{$i}"
        class="col-sm-12"}
    </div>
    <div class="row" data-visible="Company" data-group="seller">
        {include file="widgets/input.tpl" label="Postal Code" name="seller-company-address-postalcode{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Location" name="seller-company-address-location{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <h4 data-visible="Company" data-group="seller">Is represented at the notarization by:</h4>
    <div class="row">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Salutation/Title" name="seller-salutation{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="First Name" name="seller-first_name{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Last Name" name="seller-last_name{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Maiden Name" name="seller-maiden_name{$i}"}
        {include file="widgets/input.tpl" type="date" class="col-sm-12 col-md-4" label="Date Of Birth" name="seller-dob{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Role" name="seller-role{$i}"
        parentProps=["data-visible" => "Company", "data-group" => "seller"] placeholder="e.g. managing director,
        authorized signatory"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Street and house number" name="seller-address-street{$i}"
        class="col-sm-12"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Postal Code" name="seller-address-postalcode{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Location" name="seller-address-location{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Email Id" name="seller-email_id{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Telephone" name="seller-telephone{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Tax Id" name="seller-tax_id{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Nationality" name="seller-nationality{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    {assign var="marital_status" value=["Available", "Married", "Windowed", "Occur", "Living in a registered civil partnership"]}
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/select.tpl" label="Marital status" name="seller-marital_status{$i}"
        class="col-sm-12 col-md-6" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=marital]"]}
    </div>
    <div class="row" data-group="marital" data-visible="Married|Living in a registered civil partnership">
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="Spouse also sells" name="seller-spouse_sells{$i}"}
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="This is a marriage contract" name="seller-marriage_contract{$i}"}
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="Reference to foreign countries" name="seller-foreign_countries{$i}"}
    </div>
    <h4>Further information about seller {$i}</h4>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-sm-12 col-md-4" name="seller-interpreter{$i}"
        inputProps=['data-target' => "[data-group=interpreter]", "data-toggle" => "form-toggle", "data-default" =>
        "No"]}
        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-sm-12 col-md-4" name="seller-physically_limited{$i}"
        inputProps=['data-target' => "[data-group='physically_limited']", "data-toggle" => "form-toggle", "data-default"
        => "No"]}
        {include file="widgets/yes-no.tpl" label="Politically exposed person" class="col-sm-12 col-md-4" name="seller-politically_exposed{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-sm-12 col-md-6" name="seller-interpreter_language{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "interpreter"]}
        {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-sm-12 col-md-6" name="seller-physical_limitation{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "physically_limited"]}
        {include file="widgets/yes-no.tpl" label="Acting on behalf of others" class="col-sm-12 col-md-4" name="seller-acting_others{$i}"
        parentProps=["data-group" => "seller", "data-visible" => "Person"]}
        {include file="widgets/yes-no.tpl" label="Acting as an entrepreneur" class="col-sm-12 col-md-4" name="seller-acting_entrepreneur{$i}"
        parentProps=["data-group" => "seller", "data-visible" => "Person"]}
        {include file="widgets/textarea.tpl" label="Other comments about seller {$i}" class="col-sm-12 col-md-4"
        name="seller-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
<div data-index="{$i}" class="buyers hidden">
    <hr>
    <h3>Buyer {$i}</h3><br>
    <div class="row">
        {include file="widgets/radio-group.tpl" class="col-sm-12" direction="horizontal" label="Type of buyer" name="buyer-type{$i}"
        value="Person"
        items=["Person", "Company"] inputProps=["data-toggle" => "form-toggle", "data-target" =>
        "[data-group=buyer]", "data-default" => "Person"]}
    </div>
    <div class="row" data-visible="Company" data-group="buyer">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Name of the company" name="buyer-company-name{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Headquarters of the company" name="buyer-company-headquarters{$i}"
        placeholder="Location"}
    </div>
    <div class="row" data-visible="Company" data-group="buyer">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Registry court" name="buyer-registry_court{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-6" label="Registry number" name="buyer-registry_number{$i}"
        }
    </div>
    <div class="row" data-visible="Company" data-group="buyer">
        {include file="widgets/input.tpl" label="Street and house number" name="buyer-company-address-street{$i}"
        class="col-sm-12"}
    </div>
    <div class="row" data-visible="Company" data-group="buyer">
        {include file="widgets/input.tpl" label="Postal Code" name="buyer-company-address-postalcode{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Location" name="buyer-company-address-location{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <h4 data-visible="Company" data-group="buyer">Is represented at the notarization by:</h4>
    <div class="row">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Salutation/Title" name="buyer-salutation{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="First Name" name="buyer-first_name{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Last Name" name="buyer-last_name{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Maiden Name" name="buyer-maiden_name{$i}"}
        {include file="widgets/input.tpl" type="date" class="col-sm-12 col-md-4" label="Date Of Birth" name="buyer-dob{$i}"}
        {include file="widgets/input.tpl" class="col-sm-12 col-md-4" label="Role" name="buyer-role{$i}"
        parentProps=["data-visible" => "Company", "data-group" => "buyer"] placeholder="e.g. managing director,
        authorized signatory"}
    </div>
    <div class="row" data-visible="Person" data-group="buyer">
        {include file="widgets/input.tpl" label="Street and house number" name="buyer-address-street{$i}"
        class="col-sm-12"}
    </div>
    <div class="row" data-visible="Person" data-group="buyer">
        {include file="widgets/input.tpl" label="Postal Code" name="buyer-address-postalcode{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Location" name="buyer-address-location{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Email Id" name="buyer-email_id{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Telephone" name="buyer-telephone{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    <div class="row" data-visible="Person" data-group="buyer">
        {include file="widgets/input.tpl" label="Tax Id" name="buyer-tax_id{$i}"
        class="col-sm-12 col-md-6"}
        {include file="widgets/input.tpl" label="Nationality" name="buyer-nationality{$i}"
        class="col-sm-12 col-md-6"}
    </div>
    {assign var="marital_status" value=["Available", "Married", "Windowed", "Occur", "Living in a registered civil partnership"]}
    <div class="row" data-visible="Person" data-group="buyer">
        {include file="widgets/tags.tpl" label="Marital status" name="buyer-marital_status{$i}"
        class="col-sm-12 col-md-6" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=marital]"]}
    </div>
    <div class="row" data-group="marital" data-visible="Married|Living in a registered civil partnership">
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="Spouse also sells" name="buyer-spouse_sells{$i}"}
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="This is a marriage contract" name="buyer-marriage_contract{$i}"}
        {include file="widgets/yes-no.tpl" class="col-sm-12 col-md-4" label="Reference to foreign countries" name="buyer-foreign_countries{$i}"}
    </div>
    <h4>Further information about buyer {$i}</h4>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Politically exposed person" class="col-sm-12 col-md-4" name="buyer-politically_exposed{$i}"}
        {include file="widgets/yes-no.tpl" label="Acting on behalf of others" class="col-sm-12 col-md-4" name="buyer-acting_others{$i}"
        parentProps=["data-group" => "buyer", "data-visible" => "Person"]}
        {include file="widgets/yes-no.tpl" label="Acting as an entrepreneur" class="col-sm-12 col-md-4" name="buyer-acting_entrepreneur{$i}"
        parentProps=["data-group" => "buyer", "data-visible" => "Person"]}
    </div>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-sm-12 col-md-4" name="buyer-interpreter{$i}"
        inputProps=['data-target' => "[data-group=interpreter]", "data-toggle" => "form-toggle", "data-default" =>
        "No"]}
        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-sm-12 col-md-4" name="buyer-physically_limited{$i}"
        inputProps=['data-target' => "[data-group='physically_limited']", "data-toggle" => "form-toggle", "data-default"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-sm-12" name="buyer-interpreter_language{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "interpreter"]}
        {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-sm-12" name="buyer-physical_limitation{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "physically_limited"]}
    </div>
    <div class="row">
        {include file="widgets/textarea.tpl" label="Other comments about buyer {$i}" class="col-sm-12"
        name="buyer-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
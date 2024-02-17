<div data-index="{$i}" class="hidden" data-group="sellers">
    <hr>
    <h3>Seller {$i}</h3><br>
    <div class="row">
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Salutation/Title" name="seller-salutation{$i}"}
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="First Name" name="seller-first_name{$i}"}
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Last Name" name="seller-last_name{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Maiden Name" name="seller-maiden_name{$i}"}
        {include file="widgets/input.tpl" type="date" class="col-12 col-sm-4" label="Date Of Birth" name="seller-dob{$i}"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Street and house number" name="seller-address-street{$i}"
        class="col-12"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Postal Code" name="seller-address-postalcode{$i}"
        class="col-12 col-sm-6"}
        {include file="widgets/input.tpl" label="Location" name="seller-address-location{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Email Id" name="seller-email_id{$i}"
        class="col-12 col-sm-6"}
        {include file="widgets/input.tpl" label="Telephone" name="seller-telephone{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {include file="widgets/input.tpl" label="Tax Id" name="seller-tax_id{$i}"
        class="col-12 col-sm-6"}
        {include file="widgets/input.tpl" label="Nationality" name="seller-nationality{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row" data-visible="Person" data-group="seller">
        {assign var="marital_status" value=["Available", "Married", "Windowed", "Occur", "Living in a registered civil partnership"]}
        {include file="widgets/tags.tpl" label="Marital status" name="seller-marital_status{$i}"
        class="col-12" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=marital]"]}
    </div>
    <div class="row" data-group="marital" data-visible="Married|Living in a registered civil partnership">
        {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Marriage with seller 2" name="seller-marriage_with_seller2{$i}"
        parentProps=["data-index" => "2", "data-group" => "sellers"]}
        {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="This is a marriage contract" name="seller-marriage_contract{$i}"
        inputProps=["data-target" => "[data-group=marriage_contract]", "data-toggle" => "form-toggle", "data-default" =>
        "No"]}
        {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Reference to foreign countries" name="seller-foreign_countries{$i}"}
    </div>
    <h4>Further information about seller {$i}</h4>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Has seller {$i} Children?" class="col-12 col-sm-4"
        name="seller-has_children{$i}" inputProps=["data-target" => "[data-group=children]", "data-toggle" =>
        "form-toggle", "data-default" => "No"]}
        {include file="widgets/tags.tpl" label="Number of children" class="col-12 col-sm-8" name="seller-number_of_children{$i}"
        parentProps=["data-group" => "children", "data-visible" => "Yes"] items=["1", "2", "3", "4", "5", "6", "7", "8",
        "9"]}
        {include file="widgets/yes-no.tpl" label="Is father of seller {$i} alive?" class="col-12 col-sm-4"
        name="seller-father_alive{$i}" parentProps=["data-group" => "children", "data-visible" => "No"]}
        {include file="widgets/yes-no.tpl" label="Is mother of seller {$i} alive?"
        class="col-12 col-sm-4" name="seller-mother_alive{$i}" parentProps=["data-group" => "children", "data-visible"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Will/inheritance contract available?"
        class="col-12 col-sm-4" name="seller-is_will_inheritance_contract_available{$i}" inputProps=["data-target" =>
        "[data-group=will_contract]", "data-toggle" => "form-toggle"]}
    </div>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-12 col-sm-4" name="seller-interpreter{$i}"
        inputProps=['data-target' => "[data-group=interpreter]", "data-toggle" => "form-toggle", "data-default" =>
        "No"]}
        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-12 col-sm-4" name="seller-physically_limited{$i}"
        inputProps=['data-target' => "[data-group='physically_limited']", "data-toggle" => "form-toggle", "data-default"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-12" name="seller-interpreter_language{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "interpreter"]}
        {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-12" name="seller-physical_limitation{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "physically_limited"]}
    </div>
    <div class="row">
        {include file="widgets/textarea.tpl" label="Other comments about seller {$i}" class="col-12"
        name="seller-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
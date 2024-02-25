<div data-index="{$i}" class="hidden" data-group="buyers">
    <hr>
    <h3>Buyer {$i}</h3><br>
    <div class="row">
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Salutation/Title" name="buyer-salutation{$i}"}

        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="First Name" name="buyer-first_name{$i}"}

        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Last Name" name="buyer-last_name{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" class="col-12 col-sm-4" label="Maiden Name" name="buyer-maiden_name{$i}"}

        {include file="widgets/input.tpl" type="date" class="col-12 col-sm-4" label="Date Of Birth" name="buyer-dob{$i}"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Street and house number" name="buyer-address-street{$i}"
        class="col-12"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Postal Code" name="buyer-address-postalcode{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Location" name="buyer-address-location{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Email Id" name="buyer-email_id{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Telephone" name="buyer-telephone{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Tax Id" name="buyer-tax_id{$i}"
        class="col-12 col-sm-6"}

        {include file="widgets/input.tpl" label="Nationality" name="buyer-nationality{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row">
        {assign var="marital_status" value=["Available", "Married", "Windowed", "Occur", "Living in a registered civil partnership"]}
        {include file="widgets/tags.tpl" label="Marital status" name="buyer-marital_status{$i}"
        class="col-12" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=buyer-marital{$i}]" ]}
    </div>
    <div class="row hidden" data-group="buyer-marital{$i}"
        data-visible="Married|Living in a registered civil partnership">
        {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="This is a marriage contract" name="buyer-marriage_contract{$i}"
        inputProps=["data-target" => "[data-group=buyer-marriage_contract{$i}]", "data-toggle" => "form-select",
        "data-default" =>
        "No"]}

        {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Reference to foreign countries" name="buyer-foreign_countries{$i}"}
    </div>
    <h4>Further information about buyer {$i}</h4>

    {for $j=1 to count($sellers_list)}
        <div class="row" data-index="{$j}" data-group="sellers">
            {include file="widgets/yes-no.tpl" label="Is Buyer {$i} with Seller {$j} related or related by marriage?"
            class="col-12 col-sm-4" name="buyer{$j}-related_to_seller{$i}" inputProps=["data-target" =>
            "[data-group=buyer{$j}-related_to_seller{$i}]", "data-toggle" => "form-select", "data-default" => "No"]}

            {assign var="relationship_to_seller" value=["Husband", "Wife", "Son", "Daughter", "Single", "Grand Daughter", "Great-Grand Children", "Great-Grand Daughter", "Brother", "Sister", "Father", "Mother", "Grand Father", "Grand Mother", "Great-Grand Mother", "Great-Grand Father", "Nephew", "Niece", "Uncle", "Aunt", "Great Uncle", "Great Aunt", "Cousin", "Unknown", "Other"]}

            {include file="widgets/select.tpl" label="Buyer {$i} is the_____of Seller {$j}" class="col-12 col-sm-4"
            name="buyer{$j}-relationship_to_seller{$i}" items=$relationship_to_seller parentProps=["data-visible" => "Yes",
            "data-group" => "buyer{$j}-related_to_seller{$i}"] inputProps=["data-toggle" => "form-select", "data-target" =>
            "[data-group=buyer{$j}-related_to_seller-other{$i}]"]}

            {include file="widgets/input.tpl" label="Other family relationship" class="col-12 col-sm-4" name="buyer{$j}-relationship_to_seller-other{$i}"
            parentProps=["data-visible" => "Other", "data-group" => "buyer{$j}-related_to_seller-other{$i}"]}
        </div>
    {/for}
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-12 col-sm-4" name="buyer-interpreter{$i}"
        inputProps=['data-target' => "[data-group=buyer-interpreter{$i}]", "data-toggle" => "form-select",
        "data-default" =>
        "No"]}

        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-12 col-sm-4" name="buyer-physically_limited{$i}"
        inputProps=['data-target' => "[data-group=buyer-physically_limited{$i}]", "data-toggle" => "form-select",
        "data-default"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-12" name="buyer-interpreter_language{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "buyer-interpreter{$i}"]}

        {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-12" name="buyer-physical_limitation{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "buyer-physically_limited{$i}"]}
    </div>
    <div class="row">
        {include file="widgets/textarea.tpl" label="Other comments about buyer {$i}" class="col-12"
        name="buyer-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>
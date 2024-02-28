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
    <div class="row">
        {include file="widgets/input.tpl" label="Street and house number" name="seller-address-street{$i}"
        class="col-12"}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Zip Code" name="seller-address-zipcode{$i}"
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
    <div class="row">
        {include file="widgets/input.tpl" label="Tax Id" name="seller-tax_id{$i}"
        class="col-12 col-sm-6"}
        {include file="widgets/input.tpl" label="Nationality" name="seller-nationality{$i}"
        class="col-12 col-sm-6"}
    </div>
    <div class="row">
        {assign var="marital_status" value=["Available", "Married", "Windowed", "Occur", "Living in a registered civil partnership"]}
        {if $i == 1}
            {include file="widgets/tags.tpl" label="Marital status" name="seller-marital_status{$i}"
            class="col-12" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=seller-marital{$i}]"]}{/if}

        {if $i == 2}
            {include file="widgets/tags.tpl" label="Marital status" name="seller-marital_status{$i}"
            class="col-12" items=$marital_status inputProps=["data-toggle" => "form-select", "data-target" =>
            "[data-group=seller-marital{$i}]"] parentProps=["data-group" => "seller-marriage_with_seller2",
        "data-visible" => "No"]}{/if}
    </div>

    {if $i == 2}<div data-group="seller-marriage_with_seller2" data-visible="No">{/if}
        <div class="row" data-group="seller-marital{$i}"
            data-visible="Married|Living in a registered civil partnership">
            {if $i == 1 }{include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Marriage with seller 2" name="seller-marriage_with_seller2{$i}"
                parentProps=["data-index" => "2", "data-group" => "sellers"] inputProps=["data-toggle" => "form-select",
            "data-target" => "[data-group=seller-marriage_with_seller2]", "data-default" => "No"]}{/if}

            {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="This is a marriage contract" name="seller-marriage_contract{$i}"
            inputProps=["data-target" => "[data-group=seller-marriage_contract{$i}]", "data-toggle" => "form-select",
            "data-default" =>
            "No"]}

            {include file="widgets/yes-no.tpl" class="col-12 col-sm-4" label="Reference to foreign countries" name="seller-foreign_countries{$i}"}
        </div>
        {if $i == 2}
    </div>{/if}

    <h4>Further information about seller {$i}</h4>
    <div class="row">
        {assign var="numbers_of_children" value=["1", "2", "3", "4", "5", "6", "7", "8", "9"]}

        {include file="widgets/yes-no.tpl" label="Has seller {$i} Children?" class="col-12 col-sm-4"
        name="seller-has_children{$i}" inputProps=["data-target" => "[data-group=seller-children{$i}]", "data-toggle"
        =>"form-select", "data-default" => "No"]}

        {include file="widgets/tags.tpl" label="Number of children" class="col-12 col-sm-4" name="seller-number_of_children{$i}"
        items=$numbers_of_children}

        {if $i == 1}{include file="widgets/tags.tpl" label="Number of children from current marriage/registered civil partnership" class="col-12 col-sm-4" name="seller-number_of_children-current{$i}"
        items=$numbers_of_children}{/if}

        {include file="widgets/tags.tpl" label="Number of children from previous relationships" class="col-12 col-sm-4" name="seller-number_of_children-prev{$i}"
        items=$numbers_of_children}

        {include file="widgets/yes-no.tpl" label="Is father of seller {$i} alive?" class="col-12 col-sm-4"
        name="seller-father_alive{$i}" parentProps=["data-group" => "seller-children{$i}", "data-visible" => "No"]}

        {include file="widgets/yes-no.tpl" label="Is mother of seller {$i} alive?"
        class="col-12 col-sm-4" name="seller-mother_alive{$i}" parentProps=["data-group" => "seller-children{$i}",
        "data-visible"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/yes-no.tpl" label="Will/inheritance contract available?"
        class="col-12 col-sm-4" name="seller-is_will_inheritance_contract_available{$i}" inputProps=["data-target" =>
        "[data-group=seller-will_inheritance{$i}]", "data-toggle" => "form-select"]}

        {include file="widgets/yes-no.tpl" label="Interpreter required" class="col-12 col-sm-4" name="seller-interpreter{$i}"
        inputProps=['data-target' => "[data-group=seller-interpreter{$i}]", "data-toggle" => "form-select",
        "data-default" =>
        "No"]}

        {include file="widgets/yes-no.tpl" label="Pysically limited" class="col-12 col-sm-4" name="seller-physically_limited{$i}"
        inputProps=['data-target' => "[data-group=seller-physically_limited{$i}]", "data-toggle" => "form-select",
        "data-default"
        => "No"]}
    </div>
    <div class="row">
        {include file="widgets/input.tpl" label="Interpreter required for which language?" class="col-12" name="seller-interpreter_language{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "seller-interpreter{$i}"]}
        {include file="widgets/input.tpl" label="What physical limitations do you have?" class="col-12" name="seller-physical_limitation{$i}"
        parentProps=["data-visible" => "Yes", "data-group" => "seller-physically_limited{$i}"]}
    </div>
    <div class="row">
        {include file="widgets/textarea.tpl" label="Other comments about seller {$i}" class="col-12"
        name="seller-comments{$i}" inputProps=['rows' => "3"]}
    </div>
</div>

<script>
    function handleMarital() {
        let marital = $("#input-seller-marital_status{$i}").val()[0];
        let hasChildren = $("#input-seller-has_children{$i}").val()[0];

        // Hide number of children input
        $("#group-seller-number_of_children{$i}").addClass("hidden");
        $("#group-seller-number_of_children-current{$i}").addClass("hidden");
        $("#group-seller-number_of_children-prev{$i}").addClass("hidden");

        if (hasChildren === "Yes") {
            if (marital === "Married" || marital === "Living in a registered civil partnership") {
                $("#group-seller-number_of_children-current{$i}").removeClass("hidden");
                $("#group-seller-number_of_children-prev{$i}").removeClass("hidden");
            } else {
                $("#group-seller-number_of_children{$i}").removeClass("hidden");
            }
        }
    }
    $("#input-seller-marital_status{$i}").change(handleMarital);
    $("#input-seller-has_children{$i}").change(handleMarital);
</script>
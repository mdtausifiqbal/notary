<div data-index="{$i}" class="hidden" data-group="properties">
    <hr />
    <h3>Information about property {$i}</h3><br />
    <!-- Address -->
    <fieldset>
        <legend>Address</legend>
        <div class="row">
            {include file="widgets/input.tpl" label="Street and house number" name="property-address-street{$i}"
            class="col-sm-12"}
        </div>
        <div class="row">
            {include file="widgets/input.tpl" label="Postal Code" name="property-address-postalcode{$i}"
            class="col-sm-12 col-md-6"}

            {include file="widgets/input.tpl" label="Location" name="property-address-location{$i}" class="col-sm-12
            col-md-6"}
        </div>
    </fieldset>
    <!-- /Address -->


    <!-- Land Register Data -->

    {include file="widgets/yes-no.tpl" label="Are the land register data known?" name="property-address-landregister{$i}"
    inputProps=['data-target' => "#landregister-info", "data-toggle" => "form-select", "data-default" => "No"]}

    <div id="landregister-info" class="hidden" data-visible="Yes">
        <div class="row">
            {include file="widgets/input.tpl" label="District court" name="property-landregister-districtcourt{$i}"
            class="col-sm-12 col-md-4"}

            {include file="widgets/input.tpl" label="Land Register Of" name="property-landregister-of{$i}"
            class="col-sm-12 col-md-4"}

            {include file="widgets/input.tpl" label="District" name="property-landregister-district{$i}"
            class="col-sm-12 col-md-4"}
        </div>
        <div class="row">
            {include file="widgets/input.tpl" label="Sheet" name="property-landregister-sheet{$i}" class="col-sm-12
            col-md-4"}

            {include file="widgets/input.tpl" label="Hallway" name="property-landregister-hallway{$i}" class="col-sm-12
            col-md-4"}

            {include file="widgets/input.tpl" label="Parcel" name="property-landregister-parcel{$i}" class="col-sm-12
            col-md-4"}
        </div>
    </div>
    <!-- /Land Register Data -->

    <!-- Construction Type -->
    <div class="row">
        {assign var="construction_types" value=["Detached House", "Semi-detached House", "Apartment Building", "Condominium", "Farm Buildings", "Undeveloped", "Miscellaneous"]}
        {assign var="use_types" value=["Vacant", "Used by Seller", "Currently Rented", "Agriculture"]}
        {assign var="rented_to" value=["Rented to buyers", "Rented to third parties"]}
        {assign var="tenancies" value=["Leased to third parties", "Leased to buyer", "Unleased"]}

        {include file="widgets/tags.tpl" label="Type of construction" name="property-construction_type{$i}"
        class="col-sm-12 col-md-4" items=$construction_types}

        {include file="widgets/tags.tpl" label="Type of use" name="property-use_type{$i}" class="col-sm-12 col-md-4"
        items=$use_types inputProps=['data-target' => "[data-group=property-construction{$i}]", "data-toggle" =>
        "form-select",
        "data-default" => "Vacant"]}

        {include file="widgets/input.tpl" label="Estimated market value" name="property-estimated_market_value{$i}"
        class="col-sm-12 col-md-4" inputProps=["placeholder" => "EUR"]}

        <div class="col-sm-12 col-md-4">
            {include file="widgets/tags.tpl" label="Rented to" name="property-rented_to{$i}" class="hidden"
            items=$rented_to parentProps=["data-visible" => "Currently Rented", "data-group" =>
            "property-construction{$i}"]}
        </div>
    </div>
    <!-- /Construction Type -->

    <div class="row">
        {include file="widgets/yes-no.tpl" label="Will a parking space be transferred?" name="property-will_a_parking_space_be_transferred{$i}"
        class="col-sm-12 col-md-4" inputProps=["data-toggle" => "form-select", "data-target" =>
        "[data-group=property-parking{$i}]",
        "data-default" => "No"]}

        {include file="widgets/input.tpl" label="Separate land register sheet" name="property-separate_land_register_sheet{$i}"
        class="col-sm-12 col-md-4" inputProps=["placeholder" => "Land register sheet number"] parentProps=["data-group"
        => "property-parking{$i}", "data-visible" => "Yes"]}

        {include file="widgets/input.tpl" label="Special right of use" name="property-special_right_of_use{$i}"
        class="col-sm-12 col-md-4" inputProps=["placeholder" => "Designation of parking"] parentProps=["data-group" =>
        "property-parking{$i}", "data-visible" => "Yes"]}
    </div>

</div>
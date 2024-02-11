<form action="{$formaction}" method="get" class="needs-validation" novalidate>
    <input type="hidden" id="action" name="action" value="send">
    {if $inquirytype}<input type="hidden" id="inquirytype" name="inquirytype" value="{$inquirytype}">{/if}
    {if $slocation}<input type="hidden" id="slocation" name="slocation" value="{$slocation}">{/if}
    {if $sdetail}<input type="hidden" id="sdetail" name="sdetail" value="{$sdetail}">{/if}
    {if $contractor_surl}<input type="hidden" id="contractor-surl" name="contractor-surl"
        value="{$contractor_surl}">{/if}

    <!-- Property Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">{t}I. Property Information{/t}</h4>
        </div>
        <div class="card-body">

            <!-- Address -->
            <fieldset>
                <legend>Address</legend>
                <div class="row">
                    {include file="widgets/input.tpl" label="Street and house number" name="address-street" class="col-sm-12"}
                </div>
                <div class="row">
                    {include file="widgets/input.tpl" label="Postal Code" name="address-postalcode" class="col-sm-12 col-md-6"}
                    {include file="widgets/input.tpl" label="Location" name="address-location" class="col-sm-12 col-md-6"}
                </div>
            </fieldset>
            <!-- /Address -->


            <!-- Land Register Data -->

            {include file="widgets/yes-no.tpl" label="Are the land register data known?" name="address-landregister" inputProps=['data-target' => "#landregister-info", "data-toggle" => "form-toggle", "data-default" => "No"]}

            <div id="landregister-info" class="hidden" data-visible="Yes">
                <div class="row">
                    {include file="widgets/input.tpl" label="District court" name="landregister-districtcourt" class="col-sm-12 col-md-4"}
                    {include file="widgets/input.tpl" label="Land Register Of" name="landregister-of" class="col-sm-12 col-md-4"}
                    {include file="widgets/input.tpl" label="District" name="landregister-district" class="col-sm-12 col-md-4"}
                </div>
                <div class="row">
                    {include file="widgets/input.tpl" label="Sheet" name="landregister-sheet" class="col-sm-12 col-md-4"}
                    {include file="widgets/input.tpl" label="Hallway" name="landregister-hallway" class="col-sm-12 col-md-4"}
                    {include file="widgets/input.tpl" label="Parcel" name="landregister-parcel" class="col-sm-12 col-md-4"}

                </div>
            </div>
            <!-- /Land Register Data -->

            <!-- Construction Type -->
            <div class="row">
                {assign var="construction_types" value=["Detached House", "Semi-detached House", "Apartment Building", "Condominium", "Farm Buildings", "Undeveloped", "Miscellaneous"]}
                {assign var="use_types" value=["Vacant", "Used by Seller", "Currently Rented", "Agriculture"]}
                {assign var="rented_to" value=["Rented to buyers", "Rented to third parties"]}
                {assign var="tenancies" value=["Leased to third parties", "Leased to buyer", "Unleased"]}

                {include file="widgets/select.tpl" label="Type of construction" name="construction_type" class="col-sm-12 col-md-4" items=$construction_types}
                {include file="widgets/select.tpl" label="Type of use" name="use_type" class="col-sm-12 col-md-4" items=$use_types inputProps=['data-target' => "[data-group=construction]", "data-toggle" => "form-select", "data-default" => "Vacant"]}

                <div class="col-sm-12 col-md-4">
                    {include file="widgets/input.tpl" type="date" label="Eviction Until" name="eviction_until" class="hidden" parentProps=["data-visible" => "Used by Seller", "data-group" => "construction"]}
                    {include file="widgets/radio.tpl" label="Rented to" name="rented_to" class="hidden" items=$rented_to parentProps=["data-visible" => "Currently Rented", "data-group" => "construction"]}
                    {include file="widgets/radio.tpl" label="Tenancy Management" name="tenancy" class="hidden" items=$tenancies parentProps=["data-visible" => "Agriculture", "data-group" => "construction"]}
                </div>
            </div>
            <!-- /Construction Type -->

            <!-- Parking -->
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Is a parking space included in the sale?" class="col-sm-12 col-md-4" name="parking" inputProps=['data-target' => "[data-group=parking]", "data-toggle" => "form-toggle", "data-default" => "No"]}
                {include file="widgets/input.tpl" label="Seperate land register sheet" name="parking-register_sheet" class="col-sm-12 col-md-4 hidden parking" parentProps=["data-visible" => "Yes", "data-group" => "parking"] inputProps=["placeholder" => "Land register sheet number (If known)"]}
                {include file="widgets/input.tpl" label="Special right of use" name="parking-special_use" class="col-sm-12 col-md-4 hidden parking" parentProps=["data-visible" => "Yes", "data-group" => "parking"] inputProps=["placeholder" => "Designation of parking space"]}
            </div>
            <!-- /Parking -->

            <!-- Movable Items -->
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Are movable items included in the sale?" class="col-sm-12" name="movable_items" inputProps=['data-target' => "[data-group=movable]", "data-toggle" => "form-toggle", "data-default" => "No"]}
                {include file="widgets/textarea.tpl" label="Items included in the sale" class="col-sm-12 hidden" name="movable_items-list" parentProps=['data-group' => "movable", "data-visible" => "Yes"] inputProps=['rows' => "3"]}
            </div>
            <!-- /Movable Items -->
        </div>
    </div>
    <!-- /Property Information -->

    <!-- Seller Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the seller's side</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="sellers_list" value=["1", "2", "3", "4"]}
                {include file="widgets/select.tpl" label="Numbers of sellers" name="numbers_of_sellers" class="col-sm-12" items=$sellers_list inputProps=["data-toggle" => "form-repeat", "data-target" => ".sellers"]}
            </div>
            {for $i=1 to count($sellers_list)}
            {include file="forms/realestate/sellers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Seller Information -->

    <!-- Buyer Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">III. Information about the buyer's side</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="buyers_list" value=["1", "2", "3", "4"]}
                {include file="widgets/select.tpl" label="Numbers of buyers" name="numbers_of_buyers" class="col-sm-12" items=$buyers_list inputProps=["data-toggle" => "form-repeat", "data-target" => ".buyers"]}
            </div>
            {for $i=1 to count($buyers_list)}
                {include file="forms/realestate/buyers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Buyer Information -->

    <!-- Purchase Contract Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">IV. Further information about the purchase contract</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/input.tpl" label="Total purchase price" name="total_purchase_price" class="col-sm-12 col-md-6"}
                {include file="widgets/yes-no.tpl" label="Have payments already been made?" name="contract_payments" class="col-sm-12 col-md-4" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=payments]", "data-default" => "No"]}
                {include file="widgets/input.tpl" label="Amount of payments already made" name="payments_amount" class="col-sm-12 col-md-6" inputProps=["placeholder" => "Amount"] parentProps=["data-group" => "payments", "data-visible" => "Yes"]}
                {include file="widgets/input.tpl" label="Account holder seller account" name="seller_account_holder" class="col-sm-12 col-md-4" inputProps=["placeholder" => "Name"]}
                {include file="widgets/input.tpl" label="IBAN seller account" name="seller_iban" class="col-sm-12 col-md-4"}
                {include file="widgets/input.tpl" label="Bank of the seller account" name="seller_bank" class="col-sm-12 col-md-4"}
                {include file="widgets/yes-no.tpl" label="Financing the purchase price" name="financing_price" class="col-sm-12 col-md-4"}
                {include file="widgets/radio.tpl" label="Time of purchase price payment" name="purchase_price_payment" class="col-sm-12 col-md-4" items=["As soon as possible", "After a certain date"] inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=payment_date]"]}
                {include file="widgets/input.tpl" type="date" label="Payment after the following date" name="payment_after_date" class="col-sm-12 col-md-4 hidden" parentProps=["data-visible" => "After a certain date", "data-group" => "payment_date"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Are the mortgages on the property?" name="mortgages" class="col-sm-12 col-md-6" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=mortgages]", "data-default" => "No"]}
                {assign var="mortgage_list" value=["Loans have been paid, Deletion documents are available", "Loans have been paid, Notary should obtain deletion documents", "Loans are still open and should be paid off from the purchase price", "Loans are still open and should be taken over by the buyer (exceptional case)"]}
                {include file="widgets/radio.tpl" label="Select the mortgages type" name="mortgages_type" class="col-sm-12 col-md-6" items=$mortgage_list parentProps=["data-group" => "mortgages", "data-visible"=> "Yes"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Are the buyer and seller related or related by marriage?" name="buyer_seller_related" class="col-sm-12 col-md-4"}
            </div>
            <div class="row">
                {include file="widgets/textarea.tpl" label="Special features (e.g. known damage, special charges, etc.)" name="special_features" class="col-sm-12" inputProps=['rows' => "3"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Mediation by brokers" name="mediation_by_brokers" class="col-sm-12 col-md-6" inputProps=["data-target" => "[data-group=broker_details]", "data-toggle" => "form-toggle", "data-default" => "No"]}
                {include file="widgets/input.tpl" label="Name of the broker" name="broker_name" class="col-sm-12 col-md-6" parentProps=["data-visible" => "Yes", "data-group" => "broker_details"]}
            </div>
            <!-- Broker Address -->
            <fieldset data-group="broker_detail" data-visible="Yes">
                <legend>Address of the broker</legend>
                <div class="row">
                    {include file="widgets/input.tpl" label="Street and house number" name="broker-address-street" class="col-sm-12"}
                </div>
                <div class="row">
                    {include file="widgets/input.tpl" label="Postal Code" name="broker-address-postalcode" class="col-sm-12 col-md-6"}
                    {include file="widgets/input.tpl" label="Location" name="broker-address-location" class="col-sm-12 col-md-6"}
                </div>
            </fieldset>
            <!-- /Broker Address -->
        </div>
    </div>
    <!-- /Purchase Contract Information -->

    <!-- Additional Information -->

    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">V. Additional information</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/textarea.tpl" label="Additional information" name="additional_information" class="col-sm-12" inputProps=['rows' => "3"]}
            </div>
            <div class="row">
                {include file="widgets/file.tpl" label="Upload document(s) (optional)" name="documents" class="col-sm-12" inputProps=['multiple' => true]}
            </div>
            <div class="row">
                {include file="widgets/input.tpl" label="Name of the person fillig out the form" name="filling_person" class="col-sm-12"}
            </div>
            <fieldset>
                <legend>Contact <em class="text-danger"><small>*</small></em></legend>
                <div class="row">
                    <div class="col-sm-12 col-md-4">
                        {include file="widgets/checkbox.tpl" type="checkbox" label="E-mail" name="email" value="Email" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_email]", "data-default" => "Email"]}
                        {include file="widgets/checkbox.tpl" type="checkbox" label="Telephone" name="phone" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_phone]"]}
                        {include file="widgets/checkbox.tpl" type="checkbox" label="Post" name="post_address" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_address]"]}
                    </div>
                    {include file="widgets/input.tpl" label="Email from the person filling out the form" name="filling_person_email" class="col-sm-12 col-md-4 hidden" parentProps=["data-visible" => "Email", "data-group" => "applicant_email"]}
                    {include file="widgets/input.tpl" label="Phone from the person filling out the form" name="filling_person_phone" class="col-sm-12 col-md-4 hidden" parentProps=["data-visible" => "Telephone", "data-group" => "applicant_phone"]}
                </div>
            </fieldset>
            <fieldset data-group="applicant_address" data-visible="Post">
                <legend>Postal address of the person completing the form</legend>
                <div class="row">
                    {include file="widgets/input.tpl" label="Street and house number" name="applicant-address-street" class="col-sm-12"}
                </div>
                <div class="row">
                    {include file="widgets/input.tpl" label="Postal Code" name="applicant-address-postalcode" class="col-sm-12 col-md-6"}
                    {include file="widgets/input.tpl" label="Location" name="applicant-address-location" class="col-sm-12 col-md-6"}
                </div>
            </fieldset>
            <div class="row">
                {assign var="commission_label_list" value=["I instruct the notary to prepare the certification of the property purchase. I am aware that costs arise from creating the draft, even if it is not notarized.", "A draft is not yet to be created. The above information only serves to provide advance information and preparation for a meeting."]}
                {assign var="commission_value_list" value=["with-draft", "without-draft"]}
                {include file="widgets/radio.tpl" label="Commissioning" items=$commission_label_list values=$commission_value_list name="commission" class="col-sm-12" value="without-draft" inputProps=["data-default" => "without-draft", "data-toggle" => "form-toggle", "data-target" => "[data-group=draft]"]}
            </div>
            <div class="row" data-group="draft" data-visible="with-draft">
                <fieldset class="col-sm-12 col-md-6">
                    <legend>Draft to seller</legend>
                    {include file="widgets/checkbox.tpl" label="per Email" name="with-draft-seller-email" value="Email"}
                    {include file="widgets/checkbox.tpl" label="per Post" name="with-draft-seller-post" value="Post"}
                </fieldset>
                <fieldset class="col-sm-12 col-md-6">
                    <legend>Draft to buyer</legend>
                    {include file="widgets/checkbox.tpl" label="per Email" name="with-draft-buyer-email" value="Email"}
                    {include file="widgets/checkbox.tpl" label="per Post" name="with-draft-buyer-post" value="Post"}
                </fieldset>
            </div>
        </div>
    </div>
    <!-- /Additional Information -->

    <!-- Confirm and Send -->
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">{t}Confirm and Send{/t}</h4>
        </div>
        <div class="card-body">
            <!-- Terms Accept -->
            <div class="terms-accept">
                <div class="custom-checkbox">
                    <input type="checkbox" id="checkbox-terms-accepted" name="terms-accepted" value="yes" required>
                    <label for="checkbox-terms-accepted"> {t}I have read and I accept the Terms & Conditions{/t}
                    </label>
                    <div class="invalid-feedback">
                        {t}You must agree before submitting.{/t}
                    </div>
                </div>
            </div>
            <!-- /Terms Accept -->
            <!-- Submit Section -->
            <div class="submit-section mt-4">
                <button type="button" class="btn btn-outline-primary submit-btn">Save draft</button>
                <button type="submit" class="btn btn-primary submit-btn">{t}Submit{/t}</button>
            </div>
            <!-- /Submit Section -->
        </div>

    </div>
    <!-- /Confirm and Send -->

</form>

<script>
    $(document).ready(function() {

        $("[data-toggle=form-toggle]").change(function() {
            let target = $(this).data('target');
            let value = $(this).val();
            let type = $(this).attr("type");
            $(target).addClass("hidden");

            if (type === "checkbox") {
                if ($(this).prop("checked")) {
                    $(target).filter("[data-visible='" + value + "']").removeClass("hidden");
                }
            } else if (type === "radio") {
                $(target).filter("[data-visible='" + value + "']").removeClass("hidden");
            }
        }).each(function() {
            // Hide all targets
            $($(this).data("target")).addClass("hidden");
        });

        $("[data-toggle=form-toggle]").each(function() {
            let type = $(this).attr("type");
            let currentValue = $(this).val();
            let target = $(this).data('target');

            if (type === "checkbox") {
                if ($(this).prop("checked")) {
                    $(target).filter("[data-visible=" + currentValue + "]").removeClass("hidden");
                }
            } else if (type === "radio") {
                let defaultValue = $(this).data("default");
                // Show the target if the default value and current value is equal
                if (defaultValue === currentValue) {
                    $(target).filter("[data-visible=" + currentValue + "]").removeClass("hidden");
                }
            }
        });

        $("[data-toggle=form-select]").change(function() {
            let target = $(this).data("target");
            let value = $(this).val();
            $(target).addClass("hidden");
            $(target).filter(function() {
                let visible = $(this).data("visible");
                return visible.split("|").includes(value);
            }).removeClass("hidden");
        }).each(function() {
            // Hide all targets
            $($(this).data("target")).addClass("hidden");
        });

        $("[data-toggle=form-select]").each(function() {
            let defaultValue = $(this).data("default");
            $(this).val(defaultValue).change();
        });

        $("[data-toggle=form-repeat]").change(function() {
            let target = $(this).data("target");
            let value = Number($(this).val());
            console.log(value)
            $(target).addClass("hidden");
            $(target).each(function() {
                let index = Number($(this).data("index"));
                if (index <= value) {
                    $(this).removeClass("hidden");
                }
            })
        }).each(function() {
            $($(this).data("target")).addClass("hidden");
        }).val("1").change();

    })
</script>
{extends file="forms/base-form.tpl"}

{block name="form_content"}

    <!-- Deceased Person Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">I. Information about the deceased person</h4>
        </div>
        <div class="card-body">
            {assign var="will_items" value=["1", "2", "3", "4"]}
            <div class="row">
                {include file="widgets/input.tpl" label="Salutation* /Title" name="deceased_title" class="col-sm-4"}

                {include file="widgets/input.tpl" label="First name" name="deceased_first_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Last name" name="deceased_last_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Maiden name" name="deceased_maiden_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Date of birth" name="deceased_date_of_birth" class="col-sm-4" type="date"}

                {include file="widgets/input.tpl" label="Place of Birth" name="deceased_place_of_birth" class="col-sm-4"}

                {include file="forms/common/address.tpl" label="Address" name="deceased_address" class="col-12" prefix="deceased"}

                {include file="widgets/input.tpl" label="Nationality" name="deceased_nationality" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Date of death" name="deceased_date_of_death" class="col-sm-4" type="date"}

                {include file="widgets/input.tpl" label="Place of death" name="deceased_place_of_death" class="col-sm-4"}

                {include file="widgets/yes-no.tpl" label="Did the deceased person a will/contract of inheritance?" name="will_of_inheritance" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=will_inheritance]"]}

                {include file="widgets/tags.tpl" label="Number of wills/inheritance contracts" name="will_of_inheritance_numbers" class="col-sm-6" items=$will_items parentProps=["data-group"=>"will_inheritance", "data-visible"=>"Yes"] inputProps=["data-toggle"=>"form-repeat", "data-target"=>"[data-group=wills]"]}

                <div class="col-12 row" data-group="will_inheritance" data-visible="Yes">
                    <p>
                        <strong>Important note:</strong>
                        Please send us a copy or a scan of all wills and inheritance contracts of
                        the deceased person in advance. You can use the upload function at the end of this form.
                        Alternatively, you
                        can also send us the documents by email.
                    </p>
                    <div class="col-12">
                        {for $i=1 to count($will_items)}
                            {include file="forms/inheritance/wills.tpl" i=$i}
                        {/for}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Deceased Person Information -->

    <!-- Deceased Person Martial Status -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the marital status of the deceased person</h4>
        </div>
        <div class="card-body">
            {assign var="marital_status_items" value=["Never married", "Married", "Occur", "Widowed"]}
            {assign var="marital_status_values" value=["never_married", "married", "occur", "widowed"]}
            {assign var="marital_count_items" value=["1", "2", "3", "4"]}

            <div class="row">
                {include file="widgets/tags.tpl" label="Marital status of the deceased person at the time of death" name="marital_status" class="col-sm-6" items=$marital_status_items values=$marital_status_values inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=marital_status]"]}

                {include file="widgets/tags.tpl" label="How many times was the deceased married in their life?" name="deceased_marital_times" class="col-sm-6" items=$marital_count_items parentProps=["data-group"=>"marital_status", "data-visible"=>"married|occur|widowed"] inputProps=["data-toggle"=>"form-repeat", "data-target"=>"[data-group=previous_marriages]"]}
            </div>

            <div data-group="marital_status" data-visible="married">
                <hr>
                <h4>Spouse details</h4>
                <div class="row">
                    {include file="widgets/input.tpl" label="Salutation* /Title" name="spouse_title" class="col-sm-4"}

                    {include file="widgets/input.tpl" label="First name" name="spouse_first_name" class="col-sm-4"}

                    {include file="widgets/input.tpl" label="Last name" name="spouse_last_name" class="col-sm-4"}

                    {include file="widgets/input.tpl" label="Maiden name" name="spouse_maiden_name" class="col-sm-4"}

                    {include file="widgets/input.tpl" label="Date of birth" name="spouse_date_of_birth" class="col-sm-4" type="date"}

                    {include file="forms/common/address.tpl" label="Address" name="spouse_address" class="col-12" prefix="spouse"}

                    {include file="widgets/yes-no.tpl" class="col-12 col-sm-6" label="This is a marriage contract" name="spouse_marriage_contract"}

                    {assign var="divorce_petition_items" value=["No divorce petition", "Divorce petition pending"]}
                    {assign var="divorce_petition_values" value=["no_divorce_petition", "divorce_petition_pending"]}
                    {include file="widgets/tags.tpl" label="Divorce petition" name="spouse_divorce_petition" class="col-sm-6" items=$divorce_petition_items values=$divorce_petition_values}
                </div>
            </div>

            <div data-group="marital_status" data-visible="occur">
                <hr>
                <h4>Name of the divorced spouse</h4>
                <div class="row">
                    {include file="widgets/input.tpl" label="Name of the divorced spouse" name="divorced_spouse_name" class="col-sm-6"}

                    {include file="widgets/input.tpl" type="date" label="Date of divorce" name="divorced_spouse_divorce_date" class="col-sm-6"}
                </div>
            </div>

            <div data-group="marital_status" data-visible="widowed">
                <hr>
                <h4>Name of the deceased spouse</h4>
                <div class="row">
                    {include file="widgets/input.tpl" label="Name of the deceased spouse" name="deceased_spouse_name" class="col-sm-6"}

                    {include file="widgets/input.tpl" type="date" label="Date of death" name="deceased_spouse_divorce_date" class="col-sm-6"}
                </div>
            </div>

            {for $i=1 to 3}
                {include file="forms/inheritance/previous_marriage.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Deceased Person Marital Status -->

    <!-- Deceased Person Relatives Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">III. Information about relatives of the deceased person</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Did the deceased person have children?" name="deceased_person_have_children" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=deceased_relative]"]}

                {assign var="children_count_items" value=["1", "2", "3", "4", "5", "6", "7", "8", "9"]}
                {include file="widgets/tags.tpl" label="Number of children of the deceased person" name="deceased_person_children_count" class="col-sm-6" items=$children_count_items parentProps=["data-group"=>"deceased_relative", "data-visible"=>"Yes"] inputProps=["data-toggle"=>"form-repeat", "data-target"=>"[data-group=childrens]"]}
            </div>

            <div data-group="deceased_relative" data-visible="Yes">
                {for $i=1 to count($children_count_items)}
                    {include file="forms/inheritance/children.tpl" i=$i}
                {/for}
            </div>

            <div data-group="deceased_relative" data-visible="No" class="row">
                <hr>
                <h5>Information about the father of the deceased person</h5>
                {include file="widgets/input.tpl" label="Salutation* /Title of father" name="father_title" class="col-12
            col-sm-4"}

                {include file="widgets/input.tpl" label="Father's First name" name="father_first_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Father's Last name" name="father_last_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Father's Maiden name" name="father_maiden_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Father's Date of birth" name="father_date_of_birth" class="col-sm-4" type="date"}

                {include file="forms/common/address.tpl" label="Father's Address" name="father_address" class="col-12" prefix="children"}

                {include file="widgets/yes-no.tpl" label="Father alive at the time of inheritance" name="father_alive" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=father_alive]"]}

                <h5>Information about the mother of the deceased person</h5>
                {include file="widgets/input.tpl" label="Salutation* /Title of father" name="mother_title" class="col-12
            col-sm-4"}

                {include file="widgets/input.tpl" label="Mother's First name" name="mother_first_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Mother's Last name" name="mother_last_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Mother's Maiden name" name="mother_maiden_name" class="col-sm-4"}

                {include file="widgets/input.tpl" label="Mother's Date of birth" name="mother_date_of_birth" class="col-sm-4" type="date"}

                {include file="forms/common/address.tpl" label="Mother's Address" name="mother_address" class="col-12" prefix="children"}

                {include file="widgets/yes-no.tpl" label="Mother alive at the time of inheritance" name="mother_alive" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=mother_alive]"]}
            </div>
        </div>
    </div>
    <!-- /Deceased Person Relatives Information -->

    <!-- Estate Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">IV. Information about the estate</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="estate_composition_items" value=["Property", "Corporate investments", "Cash and bank assets", "Foreign assets", "Courtyard according to farm rules", "Miscellaneous", "Debts"]}
                {assign var="estate_composition_values" value=["property", "corporate_investments", "cash_and_bank_assets", "foreign_assets", "courtyard_according_to_farm_rules", "miscellaneous", "debts"]}

                {include file="widgets/tags.tpl" label="Composition of the estate" name="estate_composition" class="col-sm-12" items=$estate_composition_items values=$estate_composition_values multiple="true" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=estate]"]}

                <div class="row" data-group="estate" data-visible="property">
                    <h5>Property</h5>
                    {include file="widgets/textarea.tpl" label="Information on property ownership (address, land register sheet)" name="property_ownership_info" class="col-sm-12"}

                    {include file="widgets/yes-no.tpl" label="Should the notary make the necessary land register correction(s)" name="land_register_correction_required" class="col-sm-6"}

                    {include file="widgets/input.tpl" label="Estimated value in euros" name="property_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="corporate_investments">
                    <h5>Corporate Investments</h5>
                    {include file="widgets/textarea.tpl" label="Information on investment (address, commerical register number)" name="investment_info" class="col-sm-12"}

                    {include file="widgets/yes-no.tpl" label="Should the notary make the necessary corrections in the commercial register?" name="land_register_correction_required" class="col-sm-6"}

                    {include file="widgets/input.tpl" label="Estimated value in euros" name="investment_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="cash_and_bank_assets">
                    <h5>Cash and Bank assets</h5>
                    {include file="widgets/input.tpl" label="Estimated value in euros" name="cash_and_bank_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="foreign_assets">
                    <h5>Foreign assets</h5>
                    {include file="widgets/textarea.tpl" label="Information on the type of foreign assets" name="foreign_assets_info" class="col-sm-12"}

                    {include file="widgets/input.tpl" label="Estimated value in euros" name="foreign_assets_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="courtyard_according_to_farm_rules">
                    <h5>Courtyard according to farm rules</h5>
                    {include file="widgets/textarea.tpl" label="Information on property ownership (address, land register sheet)" name="courtyard_ownership_info" class="col-sm-12"}

                    {include file="widgets/yes-no.tpl" label="Should the notary make the necessary land register correction(s)" name="courtyard_land_register_correction_required" class="col-sm-6"}

                    {include file="widgets/input.tpl" label="Estimated value in euros" name="courtyard_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="miscellaneous">
                    <h5>Miscellaneous</h5>
                    {include file="widgets/textarea.tpl" label="e.g. card, furniture, jewelry" name="miscellaneous_info" class="col-sm-12"}

                    {include file="widgets/input.tpl" label="Estimated value in euros" name="miscellaneous_estimated_value" class="col-sm-6"}
                </div>

                <div class="row" data-group="estate" data-visible="debts">
                    <h5>Debts</h5>
                    {include file="widgets/input.tpl" label="Amount of debt in euros" name="debt_amount" class="col-sm-6"}
                </div>
            </div>
        </div>
    </div>
    <!-- /Estate Information -->

    <!-- More Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">V. More Information</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Have heir declined the inheritance?" name="heirs_declined_inheritance" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=heirs_declined]"]}

                {include file="widgets/textarea.tpl" label="Name of the rejecting party" name="rejecting_party_name" class="col-sm-6" parentProps=["data-group"=>"heirs_declined", "data-visible"=>"Yes"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Is there a legal dispute over the estate?" name="has_legal_dispute_over_estate" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=legal_dispute]"]}

                {include file="widgets/input.tpl" label="Court docket number" name="court_docket_number" class="col-sm-6" parentProps=["data-group"=>"legal_dispute", "data-visible"=>"Yes"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Do all heirs take part in the certification?" name="does_all_heirs_participated" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=heirs_participation]"]}

                {include file="widgets/yes-no.tpl" label="Should the notary obtain the consent of the other heirs to the inheritance certificate application?" name="other_heirs_consent_required" class="col-sm-6" parentProps=["data-group"=>"heirs_participation", "data-visible"=>"No"] inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=heirs_consent]"]}

                <div class="row col-12" data-group="heirs_participation" data-visible="No">
                    {include file="widgets/textarea.tpl" label="Contact options for every heir who does not take part in certification" name="contact_of_absent_heirs" class="col-sm-12" parentProps=["data-group"=>"heirs_consent", "data-visible"=>"Yes"]}
                </div>
            </div>
        </div>
    </div>
    <!-- /More Information -->

    <!-- Additional information -->
    {include file="forms/common/card-comments.tpl" cardIndex="VI"}
    <!-- /Additional information -->

    <!-- Files -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VII. Files</h4>
        </div>
        <div class="card-body">
            <p>To apply for a certificate of inheritance, various documents must be presented to the court. Please make
                these available to us in advance for review. You are welcome to use the upload function (permitted file
                formats: PDF, JPG, PNG). Alternatively, you can also send us the documents by email. Please bring the
                originals with you to the certification appointment. If the required documents are stored in our office, you
                do not need to send them to us again.</p>
            <p>The following documents are required:</p>
            <ul style="margin-left: 1rem;">
                <li data-group="will_inheritance" data-visible="Yes">Copy of all wills or inheritance contracts.
                    <span id="handwritten_text" class="hidden">(<strong>Note:</strong> The law requires that the original of
                        handwritten
                        will be delivered
                        immediately didrectly to the probate court. Please make a copy/scan beforehand that you can provide
                        to us.)</span>
                </li>
                <li>Death certificate of the deceased person</li>

                {* Marital Status == "Married" *}
                <li data-group="marital_status" data-visible="married">Marriage certificate with the spouse</li>

                {* Marrital Status == "Occur" *}
                <li data-group="marital_status" data-visible="occur">Marriage certificate with the divorced spouse</li>
                <li data-group="marital_status" data-visible="occur">Divorce decree with the divorced spouse</li>

                {* Marrital Status == "Widowed" *}
                <li data-group="marital_status" data-visible="widowed">Marriage certificate with the deceased spouse</li>
                <li data-group="marital_status" data-visible="widowed">Death certificate from the deceased spouse</li>

                {for $i=1 to 3}
                    <li data-group="marriage_end{$i}" data-visible="divorce">
                        Marriage certificate with the previous divorced spouse {$i}
                    </li>
                    <li data-group="marriage_end{$i}" data-visible="divorce">
                        Divorce decree with the previous divorced spouse {$i}
                    </li>
                {/for}
            </ul>
            <div class="row">
                {include file="widgets/file.tpl" label="Upload document(s)"}
            </div>
        </div>
    </div>
    <!-- /Files -->

    <!-- Contact -->
    {include file="forms/common/card-client.tpl" cardIndex="IX"}
    <!-- /Contact -->

    <!-- Submit -->
    {assign var="drafts" value=[array("name" => "seller", "list" => $sellers_list), array("name" => "buyer", "list" => $buyers_list)]}
    {include file="forms/common/card-commissioning.tpl" cardIndex="X" formType="share purchase" drafts=$drafts}
    <!-- /Submit -->
{/block}

{block name="scripts"}
    {$smarty.block.parent}
    <script>
        function updateDocumentsFields() {

            $("#handwritten_text").addClass("hidden");
            $('[data-name^="will_form"]').each(function() {
                let value = $(this).val();
                if (value.includes("Handwritten")) {
                    $("#handwritten_text").removeClass("hidden");
                }
            });
        }

        $(document).ready(function() {
            $('[data-name^="will_form"]').change(updateDocumentsFields);
        });
    </script>
{/block}
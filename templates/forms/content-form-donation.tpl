{extends file="forms/base-form.tpl"}

{block name="form_content"}
    <!-- Seller Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the seller (= person giving the gift)</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="sellers_list" value=["1", "2"]}
                {include file="widgets/tags.tpl" label="Numbers of sellers" name="numbers_of_sellers" class="col-12 col-sm-6" items=$sellers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=sellers]", "data-default" => "1", "data-max-items" => "2"]}
                {include file="widgets/input.tpl" label="Relationship between the selling persons" name="relationship_between_selling_persons" class="col-12 col-sm-6" inputProps=["placeholder" => "e.g. spouse"] parentProps=["data-index" => "2", "data-group" => "sellers"]}
            </div>
            {for $i=1 to count($sellers_list)}
                {include file="forms/donation/sellers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Seller Information -->

    <!-- Buyer Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the buyer (= person receiving the gift)</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="buyers_list" value=["1", "2", "3", "4"]}
                {include file="widgets/tags.tpl" label="Numbers of buyers" name="numbers_of_buyers" class="col-sm-12" items=$buyers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=buyers]", "data-default" => "1", "data-max-items" => "2"]}
            </div>

            {for $i=1 to count($buyers_list)}
                {include file="forms/donation/buyers.tpl" i=$i sellers_list=$sellers_list}
            {/for}

            <div class="row hidden" data-group="buyers" data-index="2">
                <hr />
                <h4>Employment relationship between the purchaser</h4>
                {assign var="employment_relationship_items" value=["Equal Parts", "In Unequal Parts", "as GbR"]}
                {assign var="employment_relationship_values" value=["equal_parts", "in_unequal_parts", "as_gbr"]}

                {include file="widgets/tags.tpl" label="Employment relationship" name="employment_relationship_between_the_purchaser" class="col-sm-12" items=$employment_relationship_items values=$employment_relationship_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=employment-relationship]"]}

                {include file="widgets/textarea.tpl" label="Name/Quote of each acquirer" name="name_quote_of_each_acquirer" class="col-sm-12" parentProps=["data-visible" => "in_unequal_parts", "data-group" => "employment-relationship"]}
            </div>
        </div>
    </div>
    <!-- /Buyer Information -->

    <!-- Information on the subject matter of the transfer -->

    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">III. Information on the subject matter of the transfer</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="object_labels" value=["Property", "Corporate participation", "Amount of money", "Miscellaneous"]}
                {assign var="object_values" value=["property", "corporate-participation", "amount-of-money", "miscellaneous"]}
                {include file="widgets/tags.tpl" multiple="true" label="Object" name="object" class="col-sm-12" items=$object_labels values=$object_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=object]"]}
            </div>
            <div class="row">
                {assign var="number_of_properties" value=["1", "2", "3", "4", "5"]}
                {include file="widgets/tags.tpl" label="Number of properties" name="number_of_properties" class="col-sm-6" items=$number_of_properties parentProps=["data-group" => "object", "data-visible" => "property"] inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=properties]", "data-default" => "1"]}

                {include file="widgets/input.tpl" label="Amount of money (EUR)" name="amount_of_money" class="col-sm-6" parentProps=["data-group" => "object", "data-visible" => "amount-of-money"]}
            </div>
            <div class="row" data-group="object" data-visible="miscellaneous">
                {include file="widgets/textarea.tpl" label="Other Item" name="other_item" class="col-sm-12"}
                {include file="widgets/input.tpl" label="Estimated value of the other item" inputProps=["placeholder" => "EUR"] class="col-sm-12" name="estimate_of_other_item"}
            </div>

            <!-- Information on property -->
            <div data-group="object" data-visible="property">
                {for $i=1 to count($number_of_properties)}
                    {include file="forms/donation/property.tpl" i=$i}
                {/for}
            </div>

            <!-- /Information on property -->

            <!-- Information on company participation -->
            <div class="row" data-group="object" data-visible="corporate-participation">
                <hr />
                {include file="widgets/textarea.tpl" label="Information on company participation" name="information_on_company_participation" class="col-sm-12" inputProps=["placeholder" => "Name of the company, commercial registration number, registration court, amount of the transferred shareholding"]}

                {include file="widgets/textarea.tpl" label="Estimated market value of the company's Investment" name="estimated_value_company_investment" class="col-sm-12"}

                {assign var="restriction_items" value=["Right to keep the income (usufruct)", "No reservation of use"]}
                {assign var="restriction_values" value=["right_to_keep_the_income", "no_reservation_of_use"]}
                {include file="widgets/tags.tpl" label="Restricted use of the company shareholding for the seller" name="restricted_use_of_the_company_shareholding_for_the_seller" class="col-sm-12" items=$restriction_items values=$restriction_values}
            </div>
            <!-- /Information on company participation -->
        </div>
    </div>
    <!-- Information on the subject matter of the transfer -->

    <!-- Further Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">IV. Further Information</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="motive_items" value=["Anticipated succession", "Tax motive", "Avoidance of social assistance recourse", "Avoidance of compulsory portion claims", "In return of services already provided", "Miscellaneous"]}
                {assign var="motive_values" value=["anticipated_succession", "tax_motive", "avoidance_of_social_assistance_recourse", "avoidance_of_compulsory_portioin_claims", "in_return_for_services_already_provided", "miscellaneous"]}

                {include file="widgets/tags.tpl" multiple="true" label="Motive(s) for transmission" name="motive_for_transmission" class="col-sm-12" items=$motive_items values=$motive_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=motive]"]}
                {include file="widgets/textarea.tpl" label="Type and value of the service provided" name="type_and_value_of_the_service_provided" class="col-sm-12" parentProps=["data-visible" => "in_return_for_services_already_provided", "data-group" => "motive"]}
                {include file="widgets/textarea.tpl" label="Other motive for the transfer" name="other_motive_for_the_transfer" class="col-sm-12" parentProps=["data-visible" => "miscellaneous", "data-group" => "motive"]}
            </div>
            <div class="row">
                {assign var="consideration_items" value=["No consideration", "One time payment", "Payment of an ongoing amount", "Assumption of a debt of the seller", "Nursing service", "Miscellaneous"]}
                {assign var="consideration_values" value=["no_consideration", "one_time_payment", "payment_of_an_ongoing_amount", "assumption_of_a_debt_of_the_seller", "nursing_service", "miscellaneous"]}

                {include file="widgets/tags.tpl" multiple="true" label="Consideration(s) from the buyer" name="consideration_from_the_buyer" class="col-sm-12" items=$consideration_items values=$consideration_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=consideration]"]}
                {include file="widgets/input.tpl" label="Amount of the one-off payment (EUR)" name="amount_of_the_one_off_payment" class="col-sm-12" parentProps=["data-visible" => "one_time_payment", "data-group" => "consideration"]}
                {include file="widgets/textarea.tpl" label="Current amount details" name="current_amount_details" class="col-sm-12" parentProps=["data-visible" => "payment_of_an_ongoing_amount", "data-group" => "consideration"]}
                {include file="widgets/textarea.tpl" label="Description and amount of debt" name="description_and_amount_of_debt" class="col-sm-12" parentProps=["data-visible" => "assumption_of_a_debt_of_the_seller", "data-group" => "consideration"]}
                {include file="widgets/textarea.tpl" label="Other consideration" name="other_consideration" class="col-sm-12" parentProps=["data-visible" => "miscellaneous", "data-group" => "consideration"]}
            </div>
            <div class="row" data-group="object" data-visible="property">
                {assign var="restriction_items" value=["Right to live or rent (usufruct)", "Right to live (housing law)", "Right of shared use together with the purchaser", "No reservation of use"]}
                {assign var="restriction_values" value=["right_to_live_or_rent", "right_to_live", "right_of_shared_use_together_with_the_purchaser", "no_reservation_of_use"]}

                {include file="widgets/tags.tpl" label="Reserved use of the property for the seller" name="reserved_use_of_the_property_for_the_seller" class="col-sm-12 col-md-6" items=$restriction_items values=$restriction_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=reservation_of_use]"]}

                <div class="row col-12" data-group="reservation_of_use" data-visible="right_to_live">
                    {assign var="housing_items" value=["Entire property", "Part of the property"]}
                    {assign var="housing_values" value=["entire_property", "part_of_the_property"]}

                    {include file="widgets/tags.tpl" label="Housing Law" name="housing_law" class="col-sm-12 col-md-6" items=$housing_items values=$housing_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=housing_law]"]}

                    {include file="widgets/input.tpl" label="Description of the real estate part with housing rights" name="description_of_the_real_estate_part_with_housing_rights" class="col-sm-12 col-md-6" parentProps=["data-visible" => "part_of_the_property", "data-group" => "housing_law"]}
                </div>

                <div class="row col-12" data-group="reservation_of_use"
                    data-visible="right_to_live_or_rent|right_to_live|right_of_shared_use_together_with_the_purchaser">
                    {include file="widgets/yes-no.tpl" label="In the event of the death of the seller 1 is this reservation of use transferred to a third person (e.g. spouse)?" name="reservation_of_use_transferred_to_a_third_person" class="col-sm-12 col-md-6" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=seller-reservation_of_use]", "data-default" => "No"]}

                    {include file="widgets/input.tpl" label="To whom should this reservation of use be transferred in the event of death?" name="nominee_for_reservation" class="col-sm-12 col-md-6" parentProps=["data-group" => "seller-reservation_of_use", "data-visible" => "Yes"]}
                </div>

                {assign var="possiblity_retransfer_items" value=["Free right of reclaim", "Right to reclaim under certain conditions (normal case)", "No right to reclaim"]}

                {assign var="possiblity_retransfer_values" value=["free_right_of_reclaim", "right_to_reclaim_under_certain_conditions", "no_right_to_reclaim"]}

                {include file="widgets/tags.tpl" label="Possibility of retransfer" name="possibility_of_retransfer" class="col-sm-12" items=$possiblity_retransfer_items values=$possiblity_retransfer_values inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=possibility_of_retransfer]"]}

                <div class="row col-12" data-group="possibility_of_retransfer"
                    data-visible="free_right_of_reclaim|right_to_reclaim_under_certain_conditions">

                    {include file="widgets/yes-no.tpl" label="In the event of the death of the seller 1 is this right of reclaim transferred to a third person (e.g. spouse)?" name="seller1_right_of_reclaim" class="col-sm-12 col-md-6" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=seller-right_of_reclaim]", "data-default" => "No"]}

                    <div class="row col-12" data-group="sellers" data-visible="1">
                        {include file="widgets/input.tpl" label="To whom should this right of reclaim transfer in the event of death?" name="nominee_for_right_of_reclaim" class="col-sm-12" parentProps=["data-group" => "seller-right_of_reclaim", "data-visible" => "Yes"]}

                        {include file="widgets/input.tpl" type="date" label="Birth Date" name="nominee_birth_date" class="col-sm-12 col-md-6" parentProps=["data-group" => "seller-right_of_reclaim", "data-visible" => "Yes"]}

                        {include file="widgets/input.tpl" label="Relationship with Seller 1" name="relationship_with_seller1" class="col-sm-12 col-md-6" parentProps=["data-group" => "seller-right_of_reclaim", "data-visible" => "Yes"]}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Further Information -->

    <!-- Special Features -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">V. Special Features</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Does everyone take part in the certification?" name="everyone_takes_part_in_the_certification" class="col-sm-12 col-md-6" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=certification]", "data-default" => "Yes"]}

                {include file="widgets/input.tpl" label="Who does NOT take part in the certification?" name="not_take_part_in_the_certification" class="col-sm-12 col-md-6" inputProps=["placeholder" => "Name"] parentProps=["data-visible" => "No", "data-group" => "certification"]}
            </div>
        </div>
    </div>
    <!-- /Special Features -->


    <!-- Files -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VI. Files</h4>
        </div>
        <div class="card-body">
            <div class="row" id="required_files_details">
                <p>In order to create the deed of gift, we need a copy or a scan of some documents. You are welcome to use
                    the upload function below. Alternatively, you can also send us the documents by email. Please bring the
                    originals with you to the certification appointment. If the required documents are stored in our office,
                    you do not need to send them to us again.
                </p>
                <p>The following documents are required:</p>
                <ul style="margin-left: 1rem;">
                    <li data-group="seller-marriage_with_seller2" data-visible="Yes">Copy of the marriage contract from
                        seller
                        1 and seller 2</li>
                    <div data-group="seller-marriage_with_seller2" data-visible="No">
                        <li data-group="seller-marriage_contract1" data-visible="Yes">Copy of the marriage contract from
                            seller
                            1</li>
                        <li data-group="seller-marriage_contract2" data-visible="Yes">Copy of the marriage contract from
                            seller
                            2</li>
                    </div>
                    <li data-group="buyer-marriage_contract1" data-visible="Yes">Copy of Buyer 1</li>
                    <li data-group="buyer-marriage_contract2" data-visible="Yes">Copy of Buyer 2</li>
                    <li data-group="buyer-marriage_contract3" data-visible="Yes">Copy of Buyer 3</li>
                    <li data-group="buyer-marriage_contract4" data-visible="Yes">Copy of Acquirer 4</li>
                    <li data-group="seller-will_inheritance1" data-visible="Yes">Copy of the will/inheritance contract from
                        the
                        seller 1</li>
                    <li data-group="seller-will_inheritance2" data-visible="Yes">Copy of the will/inheritance contract from
                        the
                        seller 2</li>
                </ul>
            </div>
            <div class="row">
                {include file="widgets/file.tpl" label="Upload document(s) (optional)" name="documents" class="col-sm-12" inputProps=['multiple' => true]}
            </div>
        </div>
    </div>
    <!-- /Files -->

    <!-- Comments -->
    {include file="forms/common/card-comments.tpl" cardIndex="VII"}
    <!-- /Comments -->

    <!-- Client Details -->
    {include file="forms/common/card-client.tpl" cardIndex="VIII"}
    <!-- /Client Details -->

    <!-- Commissioning -->
    {assign var="drafts" value=[array("name" => "seller", "list" => $sellers_list), array("name" => "buyer", "list" => $buyers_list)]}
    {include file="forms/common/card-commissioning.tpl" cardIndex="IX" formType="donation" drafts=$drafts}
    <!-- /Commissioning -->

{/block}
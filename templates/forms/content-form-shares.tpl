{extends file="forms/base-form.tpl"}

{block name="form_content"}
    <!-- Target company information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">I. Information on the object of purchase (target company)</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/input.tpl" label="Name of the company" name="company_name" class="col-12 col-sm-4"}

                {include file="widgets/input.tpl" label="Seat" name="company_seat" class="col-12 col-sm-4"}

                {include file="widgets/input.tpl" label="Registry court" name="company_registry_court" class="col-12 col-sm-4"}
            </div>
            <div class="row">
                {include file="widgets/input.tpl" label="Registry number" name="company_registry_number" class="col-12 col-sm-4"}

                {include file="widgets/input.tpl" label="Local tax office" name="company_local_tax_office" class="col-12 col-sm-4"}

                {include file="widgets/input.tpl" label="Tax number" name="company_tax_number" class="col-12 col-sm-4"}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Share capital fully paid up?" name="company_share_capital_fully_paid_up" class="col-12 col-sm-4" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=company_share_percentage]"]}

                {include file="widgets/input.tpl" label="Share capital paid in amount (%)" name="company_share_capital" class="col-12 col-sm-4" parentProps=["data-group" => "company_share_percentage", "data-visible" => "No"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Does the company have interests in other companies?" name="company_has_interests" class="col-12" inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=company_interests]"]}

                {include file="widgets/textarea.tpl" label="Name, registered office, registration court and registration number of the companies" name="other_company_details" parentProps=["data-group" => "company_interests", "data-visible" => "Yes"]}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Does the company have a strike - directly or indirectly - in real estate?" name="company_have_strike" class="col-12"}

                {include file="widgets/yes-no.tpl" label="Will society be reactivated?" name="society_reactivate" class="col-12"}
            </div>
        </div>
    </div>
    <!-- /Target company information -->

    <!-- Seller Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">II. Information about the seller</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="sellers_list" value=["1", "2", "3", "4"]}
                {include file="widgets/tags.tpl" label="Number of sellers" name="number_of_sellers" class="col-12" items=$sellers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=sellers]", "data-default" => "1"]}
            </div>
            {for $i=1 to count($sellers_list)}
                {include file="forms/shares/sellers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Seller Information -->

    <!-- Seller Information -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">III. Information about the buyer</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="buyers_list" value=["1", "2", "3", "4"]}
                {include file="widgets/tags.tpl" label="Number of buyers" name="number_of_buyers" class="col-12" items=$buyers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=buyers]", "data-default" => "1"]}
            </div>
            {for $i=1 to count($buyers_list)}
                {include file="forms/shares/buyers.tpl" i=$i}
            {/for}
        </div>
    </div>
    <!-- /Seller Information -->

    <!-- Purchase price and payment -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">IV. Further information about the purchase contract</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/textarea.tpl" label="Whose shares will be sold to which buyer for which purchase price?" name="shares_sell_information" class="col-12"}
            </div>
            <h4>Purchase price payment</h4>
            {for $i=1 to count($sellers_list)}
                <div class="row" data-group="sellers" data-index="{$i}">
                    {include file="widgets/input.tpl" label="Account holder seller account {$i}"
                    name="seller_account_holder{$i}" class="col-12 col-sm-4" inputProps=["placeholder" => "Name"]}

                    {include file="widgets/input.tpl" label="IBAN seller account {$i}" name="seller_iban{$i}" class="col-12
            col-sm-4"}

                    {include file="widgets/input.tpl" label="Bank of the seller account {$i}" name="seller_bank{$i}"
                    class="col-12 col-sm-4"}
                </div>
            {/for}
            <div class="row">
                {include file="widgets/tags.tpl" label="Time of purchase price payment" name="purchase_price_payment" class="col-12 col-sm-6" items=["As soon as possible", "After a certain date"] inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=payment_date]"]}

                {include file="widgets/input.tpl" type="date" label="Payment after the following date" name="payment_after_date" class="col-12 col-sm-6" parentProps=["data-visible" => "After a certain date", "data-group" => "payment_date"]}
            </div>

            <div class="row">
                {include file="widgets/tags.tpl" label="Transfer of participation to buyer" name="transfer_participation_to_buyer" class="col-12" items=["Immediately", "After full payment of the purchase price"]}

                {include file="widgets/yes-no.tpl" label="Are undistributed winnings sold?" name="undistributed_winnings_sold" class="col-12"}

                {include file="widgets/yes-no.tpl" label="Are the buyer and seller related or related by marriage?" name="buyer_seller_related" class="col-12"}
            </div>
        </div>
    </div>

    <!-- /Purchase price and payment -->

    <!-- Change in management -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">V. Change in management</h4>
        </div>
        <div class="card-body">
            {assign var="managing_directors_removal_list" value=["1", "2", "3"]}
            {assign var="managing_directors_appointment_list" value=["1", "2", "3"]}

            <div class="row">
                {include file="widgets/yes-no.tpl" label="Should one or more managing directors be removed?" name="managing_directors_removed" class="col-12 col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=md_removed]"]}

                {include file="widgets/tags.tpl" label="Number of managing directors to be removed" name="number_of_md_removed" class="col-12 col-sm-6" items=$managing_directors_removal_list parentProps=["data-group"=>"md_removed", "data-visible"=>"Yes"] inputProps=["data-toggle"=>"form-repeat", "data-target"=>"[data-group=md_remove]"]}
            </div>
            <div data-group="md_removed" data-visible="Yes">
                {for $i=1 to count($managing_directors_removal_list)}
                    <div class="row" data-group="md_remove" data-index="{$i}">
                        {include file="widgets/input.tpl" label="First name(s) of managing director to removed {$i}"
                        name="first_name_md_removed{$i}" class="col-sm-6"}

                        {include file="widgets/input.tpl" label="Last name(s) of managing director to removed {$i}"
                        name="last_name_md_removed{$i}" class="col-sm-6"}
                    </div>
                {/for}
            </div>
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Should one or more external managing directors be appointed?" name="managing_directors_appointed" class="col-12 col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=md_appointed]"]}

                {include file="widgets/tags.tpl" label="Number of new external managing director" name="number_of_new_md" class="col-12 col-sm-6" items=$managing_directors_appointment_list parentProps=["data-group"=>"md_appointed", "data-visible"=>"Yes"] inputProps=["data-toggle"=>"form-repeat", "data-target"=>"[data-group=md_appoint]"]}
            </div>
            <div data-group="md_appointed" data-visible="Yes">
                {for $i=1 to count($managing_directors_appointment_list)}
                    {include file="forms/shares/managers.tpl" i=$i}
                {/for}
            </div>
        </div>
    </div>
    <!-- /Change in management -->

    <!-- Other regulations -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VI. Other regulations</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/yes-no.tpl" label="Should the statutes be changed?" name="statutes_change" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=statute]"]}

                {include file="widgets/tags.tpl" label="Type of statute change" name="type_statute_change" class="col-sm-6" items=["Complete rewrite", "Adjustment of the existing statute"] values=["complete_rewrite", "adjustment_of_the_existing_statute"] inputProps=["data-toggle" => "form-select", "data-target" => "[data-group=statute_adjustment]"] parentProps=["data-group"=>"statute", "data-visible"=>"Yes"]}
            </div>

            <div class="row" data-group="statute" data-visible="Yes">
                {include file="widgets/textarea.tpl" label="Which regulations should be revised?" name="statute_change_info" class="col-12" parentProps=["data-group"=>"statute_adjustment", "data-visible"=>"adjustment_of_the_existing_statute"]}
            </div>

            <div class="row">
                {include file="widgets/yes-no.tpl" label="Will the name of the company change?" name="will_company_name_change" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=new_company_name]"]}

                {include file="widgets/input.tpl" label="New name of the company" name="new_company_name" class="col-sm-6" parentProps=["data-group"=>"new_company_name", "data-visible"=>"Yes"]}
            </div>

            <div class="row">
                {include file="widgets/yes-no.tpl" label="Will the business address change" name="will_company_address_change" class="col-sm-12" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=new_company_address]"]}

                {include file="forms/common/address.tpl" label="New business address" name="new_company_address" parentProps=["data-group"=>"new_company_address", "data-visible"=>"Yes"]}
            </div>

            <div class="row">
                {include file="widgets/yes-no.tpl" label="Will the location of the company change?" name="will_company_location_change" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=new_company_location]"]}

                {include file="widgets/input.tpl" label="New headquarters of the company" name="new_company_location" class="col-sm-6" parentProps=["data-group"=>"new_company_location", "data-visible"=>"Yes"]}
            </div>
        </div>
    </div>
    <!-- /Other regulations -->

    <!-- Additional information -->
    {include file="forms/common/card-comments.tpl" cardIndex="VII"}
    <!-- /Additional information -->

    <!-- Files -->
    {include file="forms/common/card-files.tpl" cardIndex="VIII"}
    <!-- /Files -->

    <!-- Contact -->
    {include file="forms/common/card-client.tpl" cardIndex="IX"}
    <!-- /Contact -->

    <!-- Submit -->
    {assign var="drafts" value=[array("name" => "seller", "list" => $sellers_list), array("name" => "buyer", "list" => $buyers_list)]}
    {include file="forms/common/card-commissioning.tpl" cardIndex="X" formType="share purchase" drafts=$drafts}
    <!-- /Submit -->
{/block}
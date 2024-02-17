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
                {include file="widgets/tags.tpl" label="Numbers of sellers" name="numbers_of_sellers" class="col-12 col-sm-6" items=$sellers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=sellers]", "data-default" => "1", "data-max-list" => "2"]}
                {include file="widgets/input.tpl" label="Relationship between the selling persons" name="relationship_between_selling_persons" class="col-12 col-sm-6" inputProps=["placeholder" => "e.g. spouse"] parentProps=["data-index" => "2", "data-group" => "sellers"]}
            </div>
            {for $i=1 to count($sellers_list)}
                {include file="forms/online-transfer/sellers.tpl" i=$i}
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
                {assign var="buyers_list" value=["1", "2"]}
                {include file="widgets/tags.tpl" label="Numbers of buyers" name="numbers_of_buyers" class="col-sm-12" items=$buyers_list inputProps=["data-toggle" => "form-repeat", "data-target" => "[data-group=buyers]", "data-default" => "1", "data-max-list" => "2"]}
            </div>
            {for $i=1 to count($buyers_list)}
                {include file="forms/online-transfer/buyers.tpl" i=$i}
            {/for}
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
                <fieldset class="col-sm-12">
                    <legend>Object</legend>
                    {include file="widgets/checkbox.tpl" label="Property" name="property" value="Property"}
                    {include file="widgets/checkbox.tpl" label="Corporate participation" name="corporate-participation" value="Corporate participation"}
                    {include file="widgets/checkbox.tpl" label="Amount of money" name="amount-of-money" value="Amount of money"}
                    {include file="widgets/checkbox.tpl" label="Miscellaneous" name="miscellaneous" value="Miscellaneous"}
                </fieldset>
            </div>
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
                <fieldset class="col-sm-12">
                    <legend>Motive(s) for transmission</legend>
                    {include file="widgets/checkbox.tpl" label="Anticipated succession" name="anticipated_succession" value="Anticipated succession"}
                    {include file="widgets/checkbox.tpl" label="Tax motive" name="tax_motive" value="Tax motive"}
                    {include file="widgets/checkbox.tpl" label="Avoidance of social assistance recourse" name="avoidance_of_social_assistance_recourse" value="Avoidance of social assistance recourse"}
                    {include file="widgets/checkbox.tpl" label="Avoidance of compulsory portion claims" name="avoidance_of_compulsory_portioin_claims" value="Avoidance of compulsory portion claims"}
                    {include file="widgets/checkbox.tpl" label="In return of services already provided" name="in_return_for_services_already_provided" value="In return of services already provided"}
                    {include file="widgets/checkbox.tpl" label="Miscellaneous" name="miscellaneous" value="Miscellaneous"}
                </fieldset>
                <fieldset class="col-sm-12">
                    <legend>Consideration(s) from the buyer</legend>
                    {include file="widgets/checkbox.tpl" label="No consideration" name="no_consideration" value="No consideration"}
                    {include file="widgets/checkbox.tpl" label="One time payment" name="one_time_payment" value="One time payment"}
                    {include file="widgets/checkbox.tpl" label="Payment of an ongoing amount" name="payment_of_an_ongoing_amount" value="Payment of an ongoing amount"}
                    {include file="widgets/checkbox.tpl" label="Assumption of a debt of the seller" name="assumption_of_a_debt_of_the_seller" value="Assumption of a debt of the seller"}
                    {include file="widgets/checkbox.tpl" label="Nursing service" name="nursing_service" value="Nursing service"}
                    {include file="widgets/checkbox.tpl" label="Miscellaneous" name="miscellaneous" value="Miscellaneous"}
                </fieldset>
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
                {include file="widgets/yes-no.tpl" label="Does everyone take part in the certification?" name="everyone_takes_part_in_the_certification" class="col-sm-12"}
            </div>
        </div>
    </div>
    <!-- /Special Features -->

    <!-- Comments -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VI. Comments</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {include file="widgets/textarea.tpl" label="Comments/Other Information" name="comments" class="col-sm-12"}
            </div>
        </div>
    </div>
    <!-- /Comments -->

    <!-- Files -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VII. Files</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <p>In order to create the deed of gift, we need a copy or a scan of some documents. You are welcome to use
                    the upload function below. Alternatively, you can also send us the documents by email. Please bring the
                    originals with you to the certification appointment. If the required documents are stored in our office,
                    you do not need to send them to us again.
                </p>
                <p>The following documents are required:</p>
                <ul style="margin-left: 1rem;">
                    <li data-group="marriage_contract" data-visible="Yes">Copy of the marriage contract from seller 1</li>
                    <li data-group="will_inheritance" data-visible="Yes">Copy of the will/inheritance contract from the seller
                        1</li>
                </ul>
            </div>
            <div class="row">
                {include file="widgets/file.tpl" label="Upload document(s) (optional)" name="documents" class="col-sm-12" inputProps=['multiple' => true]}
            </div>
        </div>
    </div>
    <!-- /Files -->

    <!-- Contact Details -->
    <div class="card contact-card">
        <div class="card-header">
            <h4 class="card-title">VIII. Contact Details</h4>
        </div>
        <div class="card-body">
            <fieldset>
                <legend>Contact <em class="text-danger"><small>*</small></em></legend>
                <div class="row">
                    <div class="col-sm-12 col-md-4">
                        {include file="widgets/checkbox.tpl" type="checkbox" value="Email" name="email" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_email]", "data-default" => "Email"]}
                        {include file="widgets/checkbox.tpl" type="checkbox" value="Telephone" name="phone" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_phone]"]}
                        {include file="widgets/checkbox.tpl" type="checkbox" value="Post" name="post_address" inputProps=["data-toggle" => "form-toggle", "data-target" => "[data-group=applicant_address]"]}
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
        </div>
    </div>
    <!-- /Contact Details -->

    <!-- Confirm and Send -->
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">{t}IX. Commissioning{/t}</h4>
        </div>
        <div class="card-body">
            <div class="row">
                {assign var="commission_label_list" value=["I instruct the notary to prepare the certification of the property purchase. I am aware that costs arise from creating the draft, even if it is not notarized.", "A draft is not yet to be created. The above information only serves to provide advance information and preparation for a meeting."]}
                {assign var="commission_value_list" value=["with-draft", "without-draft"]}
                {include file="widgets/radio-group.tpl" label="Commissioning" items=$commission_label_list values=$commission_value_list name="commission" class="col-sm-12" value="without-draft" inputProps=["data-default" => "without-draft", "data-toggle" => "form-toggle", "data-target" => "[data-group=draft]"]}
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

{/block}
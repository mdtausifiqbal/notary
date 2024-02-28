{extends file="widgets/card.tpl"}

{assign var="cardTitle" value="Commissioning"}

{block name="card_body"}
    <div class="row">
        {assign var="commission_label_list" value=["I instruct the notary to prepare the certification of the {$formType}. I
    am aware that costs arise from creating the draft, even if it is not notarized.", "A draft is not yet to be created.
    The above information only serves to provide advance information and preparation for a meeting."]}
        {assign var="commission_value_list" value=["with-draft", "without-draft"]}
        {include file="widgets/radio-group.tpl" label="Commissioning" items=$commission_label_list values=$commission_value_list name="commission" class="col-sm-12" value="without-draft" inputProps=["data-default" => "without-draft", "data-toggle" => "form-toggle", "data-target" => "[data-group=draft]"]}
    </div>

    <div class="row" data-group="draft" data-visible="with-draft">
        {include file="forms/common/drafts.tpl" drafts=$drafts}
    </div>

    <div class="row" data-group="draft" data-visible="without-draft">
        {assign var="meeting_label_list" value=["I have already arranged meeting date.", "Please contact me to arrange a meeting"]}
        {assign var="meeting_value_list" value=["meeting_arranged", "meeting_by_contact"]}
        {include file="widgets/radio-group.tpl" label="Meeting" items=$meeting_label_list values=$meeting_value_list name="meeting" class="col-sm-12" value="meeting_arranged"}
    </div>

    <div class="row">
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
{/block}
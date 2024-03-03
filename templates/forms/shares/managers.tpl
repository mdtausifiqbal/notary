<div class="hidden" data-group="md_appoint" data-index="{$i}">
    <hr>
    <h4>New External Managing Director {$i}</h4>
    <div class="row">
        {include file="widgets/input.tpl" label="Salutation* /Title" name="manager_title{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="First name" name="manager_first_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Last name" name="manager_last_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Maiden name" name="manager_maiden_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Date of birth" name="manager_date_of_birth{$i}" class="col-12
        col-sm-4" type="date"}

        {include file="widgets/input.tpl" label="Nationality" name="manager_nationality{$i}" class="col-12 col-sm-4"}

        {include file="forms/common/address.tpl" label="Address" name="manager_address{$i}" class="col-12"
        prefix="managers"}

        {include file="widgets/yes-no.tpl" label="Individual power of representation" name="manager_individual_power_of_representation{$i}"
        class="col-12 col-sm-6" inputProps=["data-default" => "Yes"]}

        {include file="widgets/yes-no.tpl" label="Exemption from § 181 BGB" name="manager_exemption_from_181_bgb{$i}"
        class="col-12 col-sm-6"
        inputProps=["data-default" => "Yes"]}
    </div>
</div>
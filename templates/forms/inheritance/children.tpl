<div data-group="childrens" data-index="{$i}">
    <hr>
    <h4>Information about child {$i}. of the deceased person</h4>
    <div class="row">
        {include file="widgets/input.tpl" label="Salutation* /Title" name="children_title{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="First name" name="children_first_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Last name" name="children_last_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Birth name" name="children_birth_name{$i}" class="col-12 col-sm-4"}

        {include file="widgets/input.tpl" label="Date of birth" name="children_date_of_birth{$i}" class="col-12
        col-sm-4" type="date"}

        {include file="forms/common/address.tpl" label="Address" name="children_address{$i}" class="col-12"
        prefix="children"}

        {include file="widgets/yes-no.tpl" label="{$i}. Child alive at the time of inheritance"
        name="children_alive{$i}" class="col-sm-6" inputProps=["data-toggle"=>"form-select",
        "data-target"=>"[data-group=children_alive{$i}]"]}

        {include file="widgets/textarea.tpl" label="Please all children from child {$i}. Enter including date of birth
        and address (if known)." name="children_of_child{$i}" class="col-sm-6"
        parentProps=["data-group"=>"children_alive{$i}", "data-visible"=>"No"]}
    </div>
</div>
<div data-group="wills" data-index="{$i}">
    <hr>
    <h4>Will/inheritance contract {$i}</h4>
    {assign var="art_items" value=["Testament", "Inheritance contract"]}
    {assign var="art_values" value=["testament", "inheritance_contract"]}

    {assign var="custody_items" value=["Not yet filed with district court", "Already filed with district court"]}
    {assign var="custody_values" value=["not_yet_filed", "already_filed"]}

    {assign var="probate_items" value=["Not yet opened", "Already opened by the district"]}
    {assign var="probate_values" value=["not_yet_opened", "already_opened"]}

    <div class="row">

        {include file="widgets/tags.tpl" label="Art" name="will_art{$i}" class="col-sm-6" items=$art_items
        values=$art_values}

        {include file="widgets/tags.tpl" label="Form" name="will_form{$i}" class="col-sm-6" items=["Handwritten",
        "Notarized"]}

        {include file="widgets/tags.tpl" label="Custody" name="will_custody{$i}" class="col-sm-6" items=$custody_items
        values=$custody_values}

        {include file="widgets/tags.tpl" label="Opening by the probate court" name="will_opening_by_the_probate_court{$i}"
        class="col-sm-6" items=$probate_items values=$probate_values}

        {include file="widgets/yes-no.tpl" label="Were all heirs named in the will still alive at the time of the inheritance?" name="will_heirs_alive" class="col-sm-6" inputProps=["data-toggle"=>"form-select", "data-target"=>"[data-group=heirs{$i}]"]}

        {include file="widgets/textarea.tpl" label="Name and date of death of the deceased testamentary heirs" name="will_deceased_testamentary_heirs_info{$i}"
        class="col-sm-6" parentProps=["data-group"=>"heirs{$i}", "data-visible"=>"No"]}
    </div>
</div>
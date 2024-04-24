<div data-group="previous_marriages" data-index="{($i + 1)}">
    <hr>
    <h4>Previous marriage {$i}.</h4>
    <div class="row">
        {assign var="end_items" value=["Divorce", "Death of the spouse"]}
        {assign var="end_values" value=["divorce", "death_of_the_spouse"]}

        {include file="widgets/tags.tpl" label="Previous marriage {$i}. ended by" name="prev_marriage_ended_by{$i}"
        class="col-12" items=$end_items values=$end_values inputProps=["data-toggle"=>"form-select",
        "data-target"=>"[data-group=marriage_end{$i}]"]}
    </div>

    <div class="row" data-group="marriage_end{$i}" data-visible="divorce">
        {include file="widgets/input.tpl" label="Name of the divorced spouse" name="prev_divorced_spouse_name{$i}"
        class="col-sm-6"}

        {include file="widgets/input.tpl" type="date" label="Date of divorce" name="prev_divorced_spouse_divorce_date{$i}"
        class="col-sm-6"}
    </div>

    <div class="row" data-group="marriage_end{$i}" data-visible="death_of_the_spouse">
        {include file="widgets/input.tpl" label="Name of deceased spouse" name="prev_deceased_spouse_name{$i}"
        class="col-sm-6"}

        {include file="widgets/input.tpl" type="date" label="Date of death" name="prev_deceased_spouse_death" class="col-sm-6"}
    </div>
</div>
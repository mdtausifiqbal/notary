{extends file="base.tpl"}

{block name="content"}
    <!-- Search Result -->
    {include file="search-result.tpl"}
    <!-- /Search Result -->

    <form action="{$formaction}" method="get" class="needs-validation" novalidate>
        <input type="hidden" id="action" name="action" value="send">
        {if $inquirytype}<input type="hidden" id="inquirytype" name="inquirytype" value="{$inquirytype}">{/if}
        {if $slocation}<input type="hidden" id="slocation" name="slocation" value="{$slocation}">{/if}
        {if $sdetail}<input type="hidden" id="sdetail" name="sdetail" value="{$sdetail}">{/if}
        {if $contractor_surl}<input type="hidden" id="contractor-surl" name="contractor-surl"
            value="{$contractor_surl}">{/if}
        {block name="form_content"}{/block}
    </form>
{/block}

{block "scripts"}
    <script>
        //  Extend jQuery val function of custom element i.e tags

        var originalValue = $.fn.val;

        $.fn.val = function(newValue) {
            // Handling setter and getter of the custom element i.e ".tags"
            if ($(this).hasClass('tags')) {
                let radio = false; // Should behave like a radio when multiple is false
                let isMultiple = $(this).data("multiple");
                let name = $(this).data("name");
                let prevValue = $(this).data("value");
                prevValue = prevValue ? prevValue : [];

                if (typeof newValue !== 'undefined') {

                    let prevValues = $(this).val();

                    let values = [];

                    if (Array.isArray(newValue)) {
                        values = isMultiple ? [...new Set(newValue)] : [newValue[0]];
                    } else {
                        let value = newValue.toString();
                        if (prevValues.includes(value)) {
                            values = radio && !isMultiple ? prevValues : prevValues.filter(v => v !== value);
                        } else {
                            values = isMultiple ? [...new Set([...prevValues, value])] : [value];
                        }
                    }


                    let inputs = values.map(value => $("input#input-" + name + "-" + value.toLowerCase()));
                    let buttons = values.map(value => $(this).find("[data-value='" + value + "']"));

                    // set the value
                    $(this).data("value", values);

                    // Enable or disable the hidden input elements
                    $(this).find("input[type=hidden]").prop("disabled", true);
                    inputs.forEach(input => input.prop("disabled", false));

                    $(this).find(".tag-selector").removeClass("selected");
                    buttons.forEach(button => button.addClass("selected"));

                    // Trigger change event
                    let event = jQuery.Event("change");
                    event.target = $(this)[0];
                    $(this).trigger(event);
                    return $(this);
                } else {
                    // Getter (Important! currently only supports getting a single value)
                    // if (isMultiple) return JSON.parse($(this).data('value') ? $(this).data('value') : "[]");
                    return Array.isArray(prevValue) ? prevValue : [prevValue];
                }
            } else {
                return originalValue.apply(this, arguments);
            }
        };

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
                let isMultiple = $(this).data("multiple");
                $(target).addClass("hidden");

                $(target).filter(function() {
                    let visible = $(this).data("visible");
                    if (!visible) return false;
                    if (Array.isArray(value)) return visible.toString().split("|").some(v => value
                        .includes(v));
                    return visible.toString().split("|").includes(value);
                }).removeClass("hidden");
            }).each(function() {
                // Hide all targets
                $($(this).data("target")).addClass("hidden");
            });

            $("[data-toggle=form-select]").each(function() {
                let defaultValue = $(this).data("default");
                if (defaultValue !== undefined) {
                    $(this).val(defaultValue).change();
                }
            });

            $("[data-toggle=form-repeat]").change(function() {
                let target = $(this).data("target");
                let maxItems = $(this).data("max-items");
                let value = isNaN(Number($(this).val())) ? Number(maxItems) : Number($(this).val());
                $(target).addClass("hidden");
                $(target).each(function() {
                    if ($(this).data("index")) {
                        index = Number($(this).data("index"));
                        if (index <= value) {
                            $(this).removeClass("hidden");
                        }
                    } else if ($(this).data("visible")) {
                        let visible = $(this).data("visible");
                        if (visible.toString().split("|").includes(value.toString())) {
                            $(this).removeClass("hidden");
                        }
                    }

                })
            }).each(function() {
                $($(this).data("target")).addClass("hidden");

                let defaultValue = $(this).data("default");

                if (typeof defaultValue !== "undefined") {
                    $(this).val(defaultValue).change();
                } else {
                    $(this).val("1").change();
                }
            })

            $(".tag-selector").click(function() {
                let value = $(this).data("value");
                $(this).parent().val(value.toString());
            })

            {if $readonly}
                $("form input, form textarea").prop("readonly", true);
                $(':radio:not(:checked)').attr('disabled', true);
                $(':checkbox:not(:checked)').attr('disabled', true);
                $('select > option:not(:selected)').attr('disabled', true);
            {/if}

        })
    </script>
{/block}
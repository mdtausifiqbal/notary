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
                // Custom behavior for elements with the class 'tags'
                if (typeof newValue !== 'undefined') {
                    let name = $(this).data("name");
                    let isMultiple = $(this.data("multiple")) == "true";
                    console.log(typeof newValue);
                    let value = newValue;

                    // Get the hidden input element
                    let inputEl = $("input#input-" + name + "-" + value.toLowerCase());

                    // Get the button with the given value
                    let buttonEl = $(this).find("[data-value='" + value + "']");

                    if (buttonEl.length === 0) {
                        console.error("Invalid value: " + value);
                        return $(this);
                    }

                    // set the value
                    $(this).data("value", value);

                    // add or remove the selected class
                    if (isMultiple) {
                        if (buttonEl.hasClass("selected")) {
                            // User want to remove the current selection
                            $(this).removeClass("selected");
                            // Disable the hidden input element
                            inputEl.prop("disabled", true);
                        } else {
                            // User want to add to the current selection
                            $(this).addClass("selected");
                            // Enable the hidden input element
                            inputEl.prop("disabled", false);
                        }
                    } else {
                        // Remove the selected class from all buttons
                        $(this).find(".tag-selector").removeClass("selected");
                        // Now add the selected class to the targeted button
                        $(buttonEl).addClass("selected");
                        // Disable all hidden input elements
                        $(this).find("input[type=hidden]").prop("disabled", true);
                        // Enable the only targeted hidden input element
                        inputEl.prop("disabled", false);
                    }

                    // Trigger change event
                    let event = jQuery.Event("change");
                    event.target = $(this)[0];
                    $(this).trigger(event);
                    return $(this);
                } else {
                    // Getter (Important! currently only supports getting a single value)
                    return $(this).data('value');
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
                $(target).addClass("hidden");
                console.log("form select change", $(this), target, value);
                $(target).filter(function() {
                    let visible = $(this).data("visible");
                    return visible.split("|").includes(value);
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
                let value = Number($(this).val());
                $(target).addClass("hidden");
                $(target).each(function() {
                    let index = Number($(this).data("index"));
                    if (index <= value) {
                        $(this).removeClass("hidden");
                    }
                })
            }).each(function() {
                $($(this).data("target")).addClass("hidden");
            }).val("1").change();

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
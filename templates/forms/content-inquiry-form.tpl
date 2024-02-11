<form action="{$formaction}" method="post" class="needs-validation" novalidate>
	<input type="hidden" id="action" name="action" value="send">
	{if $inquirytype}<input type="hidden" id="inquirytype" name="inquirytype" value="{$inquirytype}">{/if}
	{if $slocation}<input type="hidden" id="slocation" name="slocation" value="{$slocation}">{/if}
	{if $sdetail}<input type="hidden" id="sdetail" name="sdetail" value="{$sdetail}">{/if}
	{if $contractor_surl}<input type="hidden" id="contractor-surl" name="contractor-surl"
		value="{$contractor_surl}">{/if}

	<!-- Basic Information -->
	<div class="card contact-card">
		<div class="card-header">
			<h4 class="card-title">{t}Basic Data{/t}</h4>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Email{/t} <span class="text-danger">*</span></label>
						<input type="email" class="form-control" id="input-email" name="email">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Username{/t} <span class="text-danger">*</span></label>
						<input type="text" class="form-control" value="guest" id="input-username" name="username"
							readonly>
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}First Name{/t} <span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="input-firstname" name="firstname">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Last Name{/t} <span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="input-lastname" name="lastname">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Phone Number{/t}</label>
						<input type="text" class="form-control" id="input-phonenumber" name="phonenumber">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Basic Information -->

	<!-- Schedule -->
	<div class="card tags-widget">
		<div class="card-header">
			<h4 class="card-title">{t}Schedule for an Appointment{/t}</h4>
		</div>
		<div class="card-body">
			<ul class="tags">
				{assign var=schedulearray value=["sofort","diese Woche","nächste Woche","diesen Monat","demnächst"]}
				{foreach from=$schedulearray item=item key=id}
					<input type="hidden" id="input-scheduletype-{$id}" name="scheduletype-{$id}" value="0">
				{/foreach}
				{foreach from=$schedulearray item=item key=id}
					<li><a href="#" id="button-scheduletype-{$id}" class="tag tag-selector"
							data-name="button-scheduletype-{$id}">{$item}</a></li>
				{/foreach}
			</ul>
			<div class="form-group card-label mb-0">
				<label>{t}Remark{/t}</label>
				<textarea class="form-control" rows="3" id="input-schedule-comment" name="schedule-comment"></textarea>
				<small class="form-text text-muted">{t}Note: You may state your sole time available or else{/t}</small>
			</div>
		</div>
	</div>
	<!-- /Schedule -->

	<!-- Transactions -->
	<div class="card tags-widget">
		<div class="card-header">
			<h4 class="card-title">{t}Transactions{/t}</h4>
		</div>
		<div class="card-body">
			<ul class="tags">
				{assign var=transactionsarray value=["Beglaubigung einer Unterschrift","Testament","Ehevertrag","Gründung einer Gesellschaft","sonstiges","Beurkundung"]}
				{foreach from=$transactionsarray item=item key=id}
					<input type="hidden" id="input-transactiontype-{$id}" name="transaction-type-{$id}" value="0">
				{/foreach}
				{foreach from=$transactionsarray item=item key=id}
					<li><a href="#" id="button-transactiontype-{$id}" class="tag tag-selector"
							data-name="button-transactiontype-{$id}">{$item}</a></li>
				{/foreach}
			</ul>
			<small class="form-text text-muted">{t}Note: Choose one or more transactions needed{/t}</small>
		</div>
	</div>
	<!-- /Transactions -->

	<!-- Transaction / Company Formation -->
	<div class="card tags-widget hidden" id="card-transaction-companyformation">
		<div class="card-header">
			<h4 class="card-title">{t}Company Formation{/t}</h4>
		</div>
		<div class="card-body">
			<ul class="tags">
				{assign var=companytypesarray value=["Gesellschaft Bürgerlichen Rechts (GbR)", "UG", "GmbH", "GmbH & Co KG", "KG", "AG", "sonstiges"]}
				{foreach from=$companytypesarray item=item key=id}
					<input type="hidden" id="input-transaction-companyformation-companytype-{$id}"
						name="transaction-companyformation-companytype-{$id}" value="0">
				{/foreach}
				{foreach from=$companytypesarray item=item key=id}
					<li><a href="#" id="button-transaction-companyformation-companytype-{$id}" class="tag tag-selector"
							data-name="button-transaction-companyformation-companytype-{$id}">{$item}</a></li>
				{/foreach}
			</ul>
			<div class="experience-info">
				<div class="row form-row experience-cont">
					<div class="col-12 col-md-10 col-lg-11">
						<div class="row form-row">
							<div class="col-12 col-md-6 col-lg-4">
								<div class="form-group card-label">
									<label>{t}Share Capital{/t}</label>
									<input type="text" class="form-control"
										id="input-transaction-companyformation-sharecapital"
										name="transaction-companyformation-sharecapital">
									<small class="form-text text-muted">{t}Note: Leave blank if not decided yet,
										otherwise enter the planned share capital{/t}</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group card-label mb-0 hidden" id="card-transaction-companyformation-comment-6">
				<label>{t}Other Company Formation{/t}</label>
				<textarea class="form-control" rows="5" id="input-transaction-companyformation-comment-6"
					name="transaction-companyformation-comment-6"></textarea>
				<small class="form-text text-muted">{t}Note: Explain what kind of formation you are planning{/t}</small>
			</div>
		</div>
	</div>
	<!-- /Transaction / Company Formation -->

	<!-- Demand -->
	<div class="card contact-card">
		<div class="card-header">
			<h4 class="card-title">{t}Information{/t}</h4>
		</div>
		<div class="card-body">
			<div class="form-group card-label mb-0">
				<label>{t}Information{/t}</label>
				<textarea class="form-control" rows="5" id="input-demand-comment" name="demand-comment"></textarea>
				<small class="form-text text-muted">{t}Note: Explain your demand{/t}</small>
			</div>
		</div>
	</div>
	<!-- /Demand -->

	<!-- Contact Details -->
	<div class="card contact-card">
		<div class="card-header">
			<h4 class="card-title">{t}Contact Details{/t}</h4>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Address Line 1{/t}</label>
						<input class="form-control" type="text" id="input-address1" name="address1">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Address Line 2{/t}</label>
						<input type="text" class="form-control" id="input-address2" name="address2">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Postal Code{/t}</label>
						<input type="text" class="form-control" id="input-zip" name="zip" {if $zip}value="{$zip}" {/if}>
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}City{/t}</label>
						<input type="text" class="form-control" id="input-city" name="city" value="{$city}">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}Country{/t}</label>
						<input type="text" class="form-control" id="input-country" name="country" value="{$country}">
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<div class="form-group card-label">
						<label>{t}State / Province{/t}</label>
						<input type="text" class="form-control" id="input-county" name="county" value="{$state}">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Contact Details -->

	<!-- Confirm and Send -->
	<div class="card">
		<div class="card-header">
			<h4 class="card-title">{t}Confirm and Send{/t}</h4>
		</div>
		<div class="card-body">
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
				<button type="submit" class="btn btn-primary submit-btn">{t}send{/t}</button>
			</div>
			<!-- /Submit Section -->
		</div>

	</div>
	<!-- /Confirm and Send -->

</form>

<script>
	$(document).ready(function() {

		$(".tag-selector").click(function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).toggleClass("selected");

			var name = $(this).data('name');
			if (name.substring(0, 7) == "button-") {
				if ($(this).hasClass("selected")) {
					$("#input-" + name.slice(7)).val("1");
				} else {
					$("#input-" + name.slice(7)).val("0");
				}
			}

			{if false}
				$("div").each(function(i) {
					if (this.style.color !== "blue") {
						this.style.color = "blue";
					} else {
						this.style.color = "";
					}
				});
			{/if}

			var name = $(this).data('name');

			if (name == "button-transactiontype-3") {
				if ($(this).hasClass("selected")) {
					$("#card-transaction-companyformation").removeClass("hidden");
				} else {
					$("#card-transaction-companyformation").addClass("hidden");
				}
			}

			if (name == "button-transaction-companyformation-companytype-6") {
				if ($(this).hasClass("selected")) {
					$("#card-transaction-companyformation-comment-6").removeClass("hidden");
				} else {
					$("#card-transaction-companyformation-comment-6").addClass("hidden");
				}
			}

		});

	})
</script>
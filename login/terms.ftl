<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
<div id="kc-error-div" class="${properties.kcFormClass!}">
    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
	<div class="form-group col-md-12">
		<h4>${msg("termsTitle")}</h4>
	</div>
    <div id="kc-terms-text">
        <!-- ${kcSanitize(msg("termsText"))?no_esc} -->
		<p>By signing up to our service you confirm that you have read, understood and agree to our <a href="https://labs.ai/terms-of-service" target="_blank" alt="TnC">terms and conditions</a></p>
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
		<div class="col-md-6">
			<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-accept" type="submit" value="${msg("doAccept")}"/>
		</div>
        <div class="col-md-6">
			<input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="kc-decline" type="submit" value="${msg("doDecline")}"/>
		</div>
    </form>
    <div class="clearfix"></div>
    </#if>
</div>
</@layout.registrationLayout>

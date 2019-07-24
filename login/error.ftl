<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <div id="kc-error-message">
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <p class="instruction">${message.summary}</p>
        <#if client?? && client.baseUrl?has_content>
            <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
        </#if>
    </#if>
    </div>
</@layout.registrationLayout>

<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" class="${properties.kcContentWrapperClass!}">
      <div id="kc-form-wrapper">
        <#if realm.password>
			<div class="form-group col-md-12">
				<h4>${msg("doLogIn")}</h4>	
			</div>
			<#if realm.password && social.providers??>
			<div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!}">
				<#list social.providers as p>
					<div class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="btn btn-default zocial ${p.providerId}"><span>${p.displayName}</span></a></div>
				</#list>
			</div>
			<div class="text-center">
				<h6 class="text-muted">By using a social media login, you confirm that you have read, understood and agree to our <a href="https://labs.ai/terms-of-service" target="_blank" alt="EDDI TnC">terms and conditions</a></h6>
			</div>
			</#if>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
				<div class="${properties.kcFormGroupClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled placeholder=${msg("username")} />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" placeholder=${msg("username")} />
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
					<#if realm.resetPasswordAllowed>
						<span class="${properties.kcFormOptionsWrapperClass!}"><a tabindex="5" href="${url.loginResetCredentialsUrl}">(${msg("doForgotPassword")})</a></span>
					</#if>
                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" placeholder=${msg("password")} />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <button tabindex="4" class="${properties.kcButtonClass!}" name="login" id="kc-login" type="submit">${msg("doLoginBtnMessage")}</button>
                  </div>
            </form>
        </#if>
        </div>        
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>

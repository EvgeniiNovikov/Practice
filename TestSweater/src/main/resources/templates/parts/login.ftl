<#include "security.ftl" >

<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User name:</label>
            <div class="col-sm-6">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Username"/>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password" name="password" placeholder="Password"/>
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Confirm Password:</label>
                <div class="col-sm-6">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           type="password" name="password2" placeholder="Confirm Password"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input class="form-control ${(eMailError??)?string('is-invalid', '')}"
                       value="<#if user??>user.eMail</#if>"
                       type="email" name="eMail" placeholder="some@some.com"/>
                <#if eMailError??>
                    <div class="invalid-feedback">
                        ${eMailError}
                    </div>
                </#if>
            </div>
        </div>
            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6LejHdUUAAAAAJfcetEmZJ21X_5kNtLsywEe4CIK"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new User</a></#if>
        <button class="btn btn-primary" type="submit">Sign In</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit"><#if user??>Sign Out<#else>Log in</#if></button>
    </form>
</#macro>
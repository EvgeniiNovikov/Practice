<#import "parts/login.ftl" as l>
<#import "parts/commons.ftl" as c>
<@c.page>
Login page
   <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
       <div class="alert alert-danger" role="alert">
           ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
       </div>
   </#if>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert">
            ${message}
        </div>
    </#if>
<@l.login "/login" false/>
</@c.page>
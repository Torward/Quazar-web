<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="container">
    <div class="row">

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

        <div class="col-md-5 mx-auto">
<@l.login "/login" false/>
        </div>
        </div>
        </div>
</@c.page>
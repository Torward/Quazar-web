<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="mb-2">
    <h3>Добавить нового пользователя</h3>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-5 mx-auto">
    ${message?ifExists}
<@l.login "/registration" true/>
        </div>
        </div>
        </div>
</@c.page>
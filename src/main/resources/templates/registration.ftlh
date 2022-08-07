<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div class="mb-2">
    <h3>Добавить нового пользователя</h3>
</div>
    ${message?ifExists}
<@l.login "/registration" true/>
</@c.page>
<#import "parts/common.ftlh" as c>


<@c.page>
<p>
<form method="get" action="/main" class="row g-3 mb-2">
    <div class="col-auto">
        <input class="form-control" type="text" name="filter" value="${filter?ifExists}" placeholder="Введите тэг..."/>
    </div>
    <div class="col-auto">
        <button class="btn btn-outline-warning" type="submit">Поиск</button>
    </div>
</form>
</p>
<div class="row">

    <div class="col-md-3">
            <#include "parts/messageEdit.ftlh" />
    </div>
    <div class="col-md-6 gedf-main">
            <#include "parts/messageList.ftlh" />
    </div>
    <div class="col-md-3">

    </div>
</div>
</@c.page>
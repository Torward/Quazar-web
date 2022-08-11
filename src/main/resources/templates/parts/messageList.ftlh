<#include "security.ftlh">

            <#list messages as message>
        <div class="card gedf-card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span></br>
                <#if message.tag??>
                <i>${message.tag}</i>
                <#else>
                <i>#${message.tag}</i>
                </#if>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                <a class="button" href="/user-messages/${message.author.id}?message=${message.id}">
                Редактировать
                </a>
                <a class="button"  href="/delete-message/${message.id}">
                    Удалить
                </a>
                </#if>
            </div>
        </div>
        <#else>
        No message
        </#list>



<#import "parts/common.ftlh" as c>


<@c.page>

<h3>${userChannel.username}</h3>
<#if !isCurrentUser>
    <#if isSubscriber>
        <a class="button" href="/user/unsubscribe/${userChannel.id}">Отписываюсь!</a>
    <#else>
        <a class="button" href="/user/subscribe/${userChannel.id}">Подписываюсь!</a>
    </#if>
</#if>
<div class="container my-3">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Subscriptions</div>
                    <h3 class="card-text">
                        <a href="/user/subscriptions/${userChannel.id}">${subscriptionsCount}</a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Subscribers</div>
                    <h3 class="card-text">
                        <a href="/user/subscribers/${userChannel.id}">${subscribersCount}</a>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</div>

<#if isCurrentUser>
<div class="row">
    <div class="col-md-3">
    <#include "parts/messageEdit.ftlh" />
    </div>
</#if>
<div class="col-md-6 gedf-main">
<#include "parts/messageList.ftlh" />
</div>
</div>

</@c.page>
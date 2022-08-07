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
<p>
    <a class="btn btn-outline-warning" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Написать сообщение
    </a>
</p>
<p>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="card card-body">
        <form class="row g-3" method="post" enctype="multipart/form-data">
            <div class="form-floating col-auto">
            <input class="form-control ${(textError??)?string('is-invalid', '')}" type="text" id="floatingInput" name="text"
                   value="<#if message??>${message.text}</#if>" placeholder="Пиши сообщение здесь..."/>
               <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
                <label for="floatingInput"><strong>Текст сообщения</strong></label>
            </div>
            <div class="form-floating col-auto">
            <input class="form-control ${(tagError??)?string('is-invalid', '')}"  id="floatingInput"
                   value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="Тэг"/>
                <#if textError??>
                <div class="invalid-feedback">
                    ${tagError}
                </div>
            </#if>
                <label for="floatingInput"><strong>Тег</strong></label>
            </div>
            <div class="mb-3">
                <label class="form-label" for="formFile"><strong>Загрузите файл</strong></label>
                <input class="form-control" type="file" name="file" id="formFile">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="col-auto">
            <button class="btn btn-outline-warning" type="submit"><strong>Добавить</strong></button>
            </div>
        </form>
        </div>
    </div>
</p>

<div class="row row-cols-1 row-cols-md-3 g-4 x-2">
    <#list messages as message>
    <div class="card text-bg-success border-warning my-3" style="width: 18rem;">
        <#if message.filename??>
        <img class="card-img-top" src="/img/${message.filename}">
    </#if>
    <div class="m-1">
        <span class="text-start">${message.text}</span>
        <i class="text-end">${message.tag}</i>
    </div>
    <div class="card-footer">${message.authorName}
    </div>

</div>
<#else>
No message!
</#list>
</div>
</@c.page>
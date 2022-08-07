<#import "parts/common.ftlh" as c>

<@c.page>
<h3 >Вход</h3 >
<h5 >${username}</h5 >
    ${message!}
<form method = "post" >
    <div class = "form-group row mb-2" >
    <label class = "col-sm-2 col-form-label" > Пароль: </label >
<div class = "col-auto" >
    <input type = "password" name = "password" class = "form-control"  placeholder = "Введи пароль..." />
    </div >
    </div >
    <input type = "hidden" name = "_csrf" value = "${_csrf.token}" />

    <div class = "form-group row mb-2" >
    <label class = "col-sm-2 col-form-label" > Email:</label >
<div class = "col-auto" >
    <input type = "email" name = "email" class = "form-control" placeholder = "some@some.com" value="${email!''}" />
    </div >
    </div >

    <button type = "submit" class = "btn btn-outline-warning" >Сохранить</button >
</form >
</@c.page>
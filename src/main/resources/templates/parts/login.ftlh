<#macro login path isRegisterForm>
<form action = "${path}" method = "post" >
    <div class = "form-group row mb-2" >
    <label class = "col-sm-2 col-form-label" > Псевдоним : </label >
<div class = "col-auto" >
    <input type = "text"
           name = "username"
           value="<#if user??>${user.username}</#if>"
           class = "form-control ${(usernameError??)?string('is-invalid', '')}"
           placeholder = "Введи псевдоним..." />
    <#if usernameError??>
    <div class="invalid-feedback">
        ${usernameError}
    </div>
</#if>
</div >
    </div >
    <div class = "form-group row mb-2" >
    <label class = "col-sm-2 col-form-label" > Пароль: </label >
<div class = "col-auto" >
    <input type = "password"
           name = "password"
           class = "form-control ${(passwordError??)?string('is-invalid', '')}"
           placeholder = "Введи пароль..." />
    <#if passwordError??>
        <div class="invalid-feedback">
            ${passwordError}
        </div>
    </#if>
</div >
    </div >
    <input type = "hidden" name = "_csrf" value ="${_csrf.token}" />
    <#if isRegisterForm>
    <div class = "form-group row mb-2" >
        <label class = "col-sm-2 col-form-label" > Пароль ещё раз: </label >
        <div class = "col-auto" >
            <input type = "password"
                   name = "password2"
                   class = "form-control ${(password2Error??)?string('is-invalid', '')}"
                   placeholder = "Введи пароль повторно..." />
            <#if password2Error??>
            <div class="invalid-feedback">
                ${password2Error}
            </div>
        </#if>
    </div >
    </div >
    <div class = "form-group row mb-2" >
        <label class = "col-sm-2 col-form-label" > Email:</label >
    <div class = "col-auto" >
        <input type = "email"
               value="<#if user??>${user.email}</#if>"
               name = "email"
               class = "form-control ${(emailError??)?string('is-invalid', '')}"
               placeholder="some@some.com" />
        <#if emailError??>
        <div class="invalid-feedback">
            ${emailError}
        </div>
    </#if>
    </div>
    <p>
    <div>
        <div class="g-recaptcha" data-sitekey="6Le58EEhAAAAAFbFqcWIQSIIUp-S8D-SWWbCXrjm"></div>
        <#if captchaError??>
        <div class="alert alert-danger" role="alert">
            ${captchaError}
        </div>
    </#if>
    </div>
    </p>
    </div>
    </#if>
    <button type = "submit" class = "btn btn-outline-warning" >
    <#if isRegisterForm>
        Зарегистрироваться
    <#else>
        Войти
    </#if>
    </button >
    <#if !isRegisterForm>
<a href = "/registration" >Зарегистрироваться</a>
    </#if>

</form>
</#macro>
<#macro logout>
<form action = "/logout" method = "post" >
    <input type = "hidden" name = "_csrf" value = "${_csrf.token}"/>
    <button class = "btn btn-outline-warning" type = "submit" >
        Выйти
    </button >
</form >
</#macro>
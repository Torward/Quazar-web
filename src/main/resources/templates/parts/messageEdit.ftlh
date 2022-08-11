

    <div class="card gedf-card">
        <div class="card-header">
            <form method="post" enctype="multipart/form-data">
                <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                     <a class="nav-link active posts-tab" id="posts-tab" data-toggle="tab" href="#posts" role="tab"
                       aria-controls="posts" aria-selected="true">Скажи, что хотел</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images"
                       aria-selected="false" href="#images">Показывай</a>
                    </li>
                </ul>
        </div>

            <div class="card-body">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                        <p>
                            <div class="form-group">
                                <label class="sr-only" for="message">post</label>
                                <textarea type="text" class="form-control ${(textError??)?string('is-invalid', '')}" id="message" rows="3"
                                value="<#if message??>${message.text}</#if>" name="text"
                                placeholder="Введите сообщение"></textarea>
                                <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                                </#if>
                            </div>
                        </p>
                        <p>
                            <div class="form-group">
                                <input type="text" class="form-control"
                                    value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                                <#if tagError??>
                                <div class="invalid-feedback">
                                    ${tagError}
                                </div>
                                </#if>
                            </div>
                        </p>
                    </div>
<!--            5-->
                    <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                        <p>
                        <div class="form-group">
                            <div class="custom-file">
                                <input type="file" name="file" id="customFile" class="custom-file-input">
                                <label class="custom-file-label" for="customFile">Выбери файл</label>
                            </div>
                        </div>
                        </p>
                        <div class="py-2"></div>
                    </div>
                </div>
<!--    9-->
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
                <div class="btn-toolbar justify-content-between">
                    <div class="btn-group">
                        <button type="submit">Я сказал!</button>
                    </div>
                </div>
            </div>
        </form>
    </div>



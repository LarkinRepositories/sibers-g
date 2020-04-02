<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl"as p>
<@c.page>
<#--    <div class="form-row">-->
<#--        <div class="form-group col-md-6">-->
<#--            <form method="get" class="form-inline">-->
<#--                <input type="text" name="filterText" class="form-control" placeholder="Введите текст для поиска" value="${filter!}">-->
<#--                <button type="submit" class="btn btn-primary ml-2">Найти новость</button>-->
<#--            </form>-->
<#--        </div>-->
<#--    </div>-->
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add news
    </a>
    <div  class="collapse" <#if newsDto??>show</#if> id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Enter the news title</label>
                    <input type="text" name="title" class="form-control ${(titleError??||alreadyExitsError??)?string('is-invalid', '')}" value="${title!}"
                           placeholder="News title" />
                    <#if titleError??>
                        <div class="invalid-feedback">
                            ${titleError}
                        </div>
                    </#if>
                    <#if alreadyExitsError??>
                        <div class="invalid-feedback">
                            ${alreadyExitsError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="formControlTextarea">Enter the news text</label>
                    <textarea  id="formControlTextarea"  name="text" class="form-control ${(textError??)?string('is-invalid', '')}" rows="3">
                        ${text!}
                    </textarea>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile" class="form-control ${(fileError??)?string('is-invalid', '')}">
                        <label class="custom-file-label" for="customFile">Upload an image</label>
                        <#if fileError??>
                            <div class="invalid-feedback">${fileError}</div>
                        </#if>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
    <#if titleError?? || textError?? || fileError?? || alreadyExitsError??><div class="alert alert-danger" role="alert">Error: invalid input, please try again</div></#if>
    <h1>Latest news</h1>
    <@p.pager url news></@p.pager>
    <div class="card-columns">
        <#list news.content as element>
            <div class="card" style="witdh: 18 rem">
                <#if element.img??><img src="/img/${element.img}" class="card-img-top"/></#if>
                <div class="card-body">
                    <h5 class="card-title"><a href="/show?id=${element.id}">${element.title}</a></h5>
                    <time class="card-subtitle">${element.created}</time>
                    <p class="card-text">${element.text}</p>
                </div>
            </div>
        </#list>
    </div>
</@c.page>
<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl"as p>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" class="form-inline">
                <input type="text" name="filterText" class="form-control" placeholder="Введите текст для поиска" value="${filter!}">
                <button type="submit" class="btn btn-primary ml-2">Найти новость</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить Новость
    </a>
    <div  class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="title" class="form-control" placeholder="Введите заголовок новости" />
                </div>
                <div class="form-group">
                    <input type="text" name="text" class="form-control" placeholder="Введите текст новости" />
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Выберите картинку</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить новость</button>
                </div>
            </form>

        </div>
    </div>
    <h1>Список новостей</h1>
    <@p.pager url news></@p.pager>
    <div class="card-columns">
        <#list news.content as element>
            <div class="card" style="witdh: 18 rem">
                <#if element.img??><img src="/img/${element.img}" class="card-img-top"/></#if>
                <div class="card-body">
                    <h5 class="card-title">${element.title}</h5>
                    <h6 class="card-subtitle">${element.created}</h6>
                    <p class="card-text">${element.text}</p>
                </div>
            </div>
        </#list>
    </div>
</@c.page>
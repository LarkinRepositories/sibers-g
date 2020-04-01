<#import "parts/common.ftl" as c>
<@c.page>
<div>
    <form method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Введите заголовок новости" />
        <input type="text" name="text" placeholder="Введите текст новости" />
        <input type="file" name="file" />
        <button type="submit">Добавить новость</button>
    </form>
</div>
<div>Список новостей</div>
<form method="get">
    <input type="text" name="filterText" placeholder="Введите текст для поиска" value="${filter!}">
    <button type="submit">Найти новость</button>
</form>
<#list news as element>
    <h3>${element.title}</h3>
    <div>${element.created}</div>
    <#if element.img??><div><img src="/img/${element.img}"/></div></#if>
    <div>${element.text}</div>
</#list>
</@c.page>
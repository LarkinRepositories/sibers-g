<#import "parts/common.ftl" as c>
<@c.page>
    <div class="card-body">
    <#if newsRecord.img??><img src="/img/${newsRecord.img}"/></#if>
    <h3 class="card-title">${newsRecord.title}</h3>
    <time>${newsRecord.created}</time>
    <div>${newsRecord.text}</div>
    <div><a href="/">Go back</a></div>
    </div>
</@c.page>
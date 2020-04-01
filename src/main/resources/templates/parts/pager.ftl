<#--<#macro pager url page>-->
<#--    <#if page.getTotalPages() gt 7>-->
<#--        <#assign-->
<#--            totalPages = page.getTotalPages()-->
<#--            pageNumber = page.getNumber() + 1-->

<#--            head = (pageNumber > 4)?then([1, -1], [1, 2, 3])-->
<#--            tail = (pageNumber < totalPages - 3)?then([-1, totalPages], [totalPages - 2, totalPages - 1, totalPages])-->
<#--            bodyBefore = (pageNumber > 4 && pageNumber < totalPages - 1)?then([pageNumber - 2, pageNumber - 1], [])-->
<#--            bodyAfter = (pageNumber > 2 && pageNumber < totalPages - 3)?then([pageNumber + 1, pageNumber + 2], [])-->

<#--            body = head + bodyBefore + (pageNumber > 3 && pageNumber < totalPages - 2)?then([pageNumber], []) + bodyAfter + tail-->
<#--        >-->
<#--    <#else>-->
<#--        <#assign body = 1..page.getTotalPages()>-->
<#--    </#if>-->
<#--    <div class="mt-3">-->
<#--        <ul class="pagination">-->
<#--            <li class="page-item disabled">-->
<#--                <a class="page-link" href="#" tabindex="-1">Pages</a>-->
<#--            </li>-->
<#--&lt;#&ndash;            <#list 1..page.getTotalPages() as p>&ndash;&gt;-->
<#--                <#list body as p>-->
<#--                <li class="page-item active">-->
<#--                <#if (p-1) == page.getNumber()>-->
<#--                    <a class="page-link" href="#" tabindex="-1">${p}</a>-->
<#--                    </li>-->
<#--                <#else>-->
<#--                    <li class="page-item">-->
<#--                        <a class="page-link" href="${url}?page=${p-1}&size=${page.getSize()}" tabindex="-1">${p}</a>-->
<#--                    </li>-->
<#--                </#if>-->
<#--            </#list>-->
<#--        </ul>-->
<#--    </div>-->
<#--    <ul class="pagination">-->
<#--        <li class="page-item disabled">-->
<#--            <a class="page-link" href="#" tabindex="-1">Elements count </a>-->
<#--        </li>-->
<#--        <#list [1,10,20,50] as e>-->
<#--            <li class="page-item active">-->
<#--            <#if e == page.getSize()>-->
<#--                <a class="page-link" href="#" tabindex="-1">${e}</a>-->
<#--                </li>-->
<#--            <#else>-->
<#--                <li class="page-item">-->
<#--                    <a class="page-link" href="${url}?page=${page.getNumber()}&size=${e}" tabindex="-1">${e}</a>-->
<#--                </li>-->
<#--            </#if>-->
<#--        </#list>-->
<#--    </ul>-->
<#--</#macro>-->

<#macro pager url page>
    <#if page.getTotalPages() gt 7>
        <#assign
        totalPages = page.getTotalPages()
        pageNumber = page.getNumber() + 1

        head = (pageNumber > 4)?then([1, -1], [1, 2, 3])
        tail = (pageNumber < totalPages - 3)?then([-1, totalPages], [totalPages - 2, totalPages - 1, totalPages])
        bodyBefore = (pageNumber > 4 && pageNumber < totalPages - 1)?then([pageNumber - 2, pageNumber - 1], [])
        bodyAfter = (pageNumber > 2 && pageNumber < totalPages - 3)?then([pageNumber + 1, pageNumber + 2], [])

        body = head + bodyBefore + (pageNumber > 3 && pageNumber < totalPages - 2)?then([pageNumber], []) + bodyAfter + tail
        >
    <#else>
        <#assign body = 1..page.getTotalPages()>
    </#if>
    <div class="mt-3">
        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Страницы</a>
            </li>
            <#list body as p>
                <#if (p - 1) == page.getNumber()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${p}</a>
                    </li>
                <#elseif p == -1>
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">...</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${p - 1}&size=${page.getSize()}" tabindex="-1">${p}</a>
                    </li>
                </#if>
            </#list>
        </ul>

        <ul class="pagination">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Элементов на странице</a>
            </li>
            <#list [10, 20, 50] as c>
                <#if c == page.getSize()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${c}</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?page=${page.getNumber()}&size=${c}" tabindex="-1">${c}</a>
                    </li>
                </#if>
            </#list>
        </ul>
    </div>
</#macro>
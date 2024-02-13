<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск обзоров</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchGroup">Тип обзора</label>
                <select id="searchGroup" class="form-control">
                    <option value="">Тип не выбран</option>
                    <option value="Книги">Книги</option>
                    <option value="Кино">Кино</option>
                    <option value="Игры">Игры</option>
                    <option value="Музыка">Музыка</option>
                    <option value="Другое">Другое</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по обзорам</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list reviews as review>
            <a href="/review/${review.id}" class="review-link">
                <div class="card text-white bg-dark my-9 review">
                    <img src="/images/${review.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${review.title}</h5>
                        <h7 class="card-title">${review.group}</h7>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>
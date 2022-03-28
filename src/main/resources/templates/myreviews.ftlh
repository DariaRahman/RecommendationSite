<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои обзоры</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый обзор
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/review/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="reviewName">Название обзора</label>
                <input type="text" required class="form-control"
                       id="reviewName" name="title">
            </div>

            <div class="form-group">
                <label for="reviewTag">Тэги обзора</label>
                <input type="tag" required class="form-control"
                       id="reviewЕфп" name="tag">
            </div>

            <div class="form-group">
                <label for="searchGroup">Тип обзора</label>
                <select id="searchGroup" required name="group" class="form-control">
                    <option value="">Тип не выбран</option>

                    <option value="Книги">Книги</option>
                    <option value="Кино">Кино</option>
                    <option value="Игры">Игры</option>
                    <option value="Музыка">Музыка</option>
                    <option value="Другое">Другое</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание обзора</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография к обзору</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Первая фотография к обзору</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография к обзору</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="card-columns">
        <#list reviews as review >
            <a href="/review/${review.id}" class="review-link">
                <div class="card text-white bg-dark my-3 review">
                    <div class="card-top">
                        <form action="/review/delete/${review.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
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
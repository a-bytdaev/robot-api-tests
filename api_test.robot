*** Settings ***
Library    RequestsLibrary    #Библиотека для работы с HTTP-запросами
Library    Collections        #Библиотека для работы со структурами (словари, списки, сравнения...)

*** Test Cases ***
Get User Data from API
    [Documentation]    Пример GET-запроса к JSONPlaceholder    # Описание теста (будет отображаться в отчёте)
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com/    # Создание HTTP-сессии с именем jsonplaceholder + URL
    
    
    ${response}=     GET On Session    jsonplaceholder    /users/10     #GET-запрос по адресу /users/1 с использованием созданной выше сессии, результат сохраняется в переменную ${response}
    Status Should Be    200    ${response}    # Проверка что статус ответа — 200(ОК)
    
    ${json}=    To Json    ${response.content}    # Преобразование содержимого ответа из JSON в словарь
    Should Be Equal As Strings    ${json['name']}    Clementina DuBuque    # Проверка имя пользователя в ответе — "Clementina DuBuque"
    Log    Email пользователя: ${json['email']}    # Логируем email пользователя — это будет видно в log.html
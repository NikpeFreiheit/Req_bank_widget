Метод REST JSON over HTTP

1. Обдумать как реализовать в структуре базы, что у одной карты может быть несколько счетов и что у одного счета может быть несколько карт (например как у тинькофф можно выпустить карту с другой платежной системой)

2. Должно быть синхронное взаимодействие, т.к. банковская услуга должна совершаться мгновенно с отображением результата. Обязательно клиент-серверная архитектура, что обеспечит мгновенное получение данных о выполненых транзакциях. Дополнительно можно подстраховаться асинхронным соединением и раз в какой-то период времени обновлять данные о транзакциях через инкремент забирая данные из Kafka.

3. Должен быть запрос по HTTPS (шифрованный). Писала без него, так как долго бы пришлось разбираться с шифрованным

4. Можно написать на протоколе HTTP/2.0, что позволит в одном GET запросить несколько структур данных

5. В ответе на задание не описаны возможные ошибки, которые могут возникнуть при недоступности одного из узлов или при ошибке транзакции

6. В запросе (GET) так же необходимо настроить фильтры и параметры (указанные в URL), в связи с которыми будут возвращаться данные
   1. Какой счет отобразить (возможно тут еще указать валюту, потому что есть мультивалютные счета)
   2. Какие карты отобразить (Привязанные к счету или все карты?)
   3. Какие транзакции и их количество (по каким картам? Отображенным или всем?)

7. Определение клиента осуществляется на этапе авторизации клиента в приложении (аутентификация, проверка сертификата)
8. Как и указано в задании, в ответе не содержится описания возможности клиентом каких-либо действий, следовательно кроме URL и фильтраций и сортировки никаких других параметров нет. Например при методах POST/PUT нужно было бы написать структуру JSON для выполнения изменения или замены данными из запроса


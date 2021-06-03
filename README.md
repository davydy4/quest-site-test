# quest-site-test
### Задание
На главной странице вывести три-четыре квеста.
На странице квеста (quest), кроме фотографии и названия, отобразить сетку расписания, форму бронирования. Сетку бронирования достаточно отобразить на фиксированный период, например, на две ближайшие недели.
Пользователь выбирает временной слот, заполняет имя\email\телефон и совершает бронирование (booking) данного времени для данного квеста, слот сразу меняет своё состояние на недоступное (можно провести аналогию с записью к врачу).
В админке отображается список всех броней, где администратор квеста должен сразу понять, когда и кто собирается прийти играть, и может поменять статус брони (возможные статусы new, success, cancel).
Бронь со статусом отмены не занимает временной слот.
Выполнить задание можно на любом стеке технологий,
желательно Laravel + Vue.
Подключить какой-нибудь CSS фреймворк для приятного внешнего вида.
Результат опубликовать на Github.

###Установка
composer install
npm i

php artisan serve
npm run watch

###Вход в админ-панель
логин: admin@admin.ru
пароль: 123456
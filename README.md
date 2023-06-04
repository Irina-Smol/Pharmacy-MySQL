# База данных для организации работы аптеки

Аптека продает лекарства покупателям и постоянно пополняет их запас, пользуясь услагами нескольких поставщиков. О каждом поставщике известно: уникальный шифр, название фирмы, город, дата заключения договора на поставку лекарств. Также известен список лекарств, доступных для заказа у поставщиков.  

Про каждое лекарство известно: Шифр, название, группа лекарств, фирма производитель, страна производитель. 

Для пополнения запасов лекарств в аптеке составляется Заказ. В заказе указывается поставщик, дата составления заказа и ожидаемая дата получения заказа, и его стоимость. Также предусмотрено поле для проставления даты реального получения заказа. проставления даты реального получения заказа. 

Каждый заказ содержит множество строк заказа. В каждой строке указано конкретное лекарство и его количество. В базе данных аптеки хранятся также данные о имеющихся в наличии лекарствах. При этом одноименные лекарства, полученные по разной цене, учитываются отдельно. Про каждое лекарство известно количество упаковок на фиксированную дату. 

## ER диаграмма

![image](https://github.com/Irina-Smol/Pharmacy-MySQL/assets/112115002/1a830006-504e-44dd-8747-2ca514bdfa39)

## Написание простых запросов

1) Показать все сведения о поставщиках, договоры с которыми были заключены в марте 2020 года. 
2) Показать поставщиков, договора с которыми были расторгнуты за последние 5 дней. 
3) Показать количество поставщиков в каждом городе. 
4) Показать количество упаковок лекарства ХХХ, заказанных в первом полугодии 2020 года. 
5) Показать сколько наименований лекарств каждой группы хранится в базе? 
6) Показать минимальную цену лекарства с шифром ХХХ.

## Написание сложных запросов

1) Составить отчет о заказах лекарств за март 2020 года по форме: Шифр лекарства, Название, общее количество в заказах. 
2) Составить отчет о заказах за март 2020 года по форме: Шифр поставщика, название фирмы, общая сумма всех заказов. 
3) Покажите все сведения о поставщике, у которого было заказано самое дорогое лекарство с шифром ХХХ в марте 2020 года. 
4) Показать все сведения о поставщике, с которым не было заключено ни одного заказа (с помощью левостороннего соединения) 
5) Показать все сведения о поставщике, с которым не было заключено ни одного заказа в марте 2020 года. 
6) Показать все сведения о поставшике, чаще всех поставлявшего лекарство с шифром ХХХ в 2020 году (с помощью View).

## Триггеры и хранимые процедуры

Разработать процедуру, которая будет принимать на вход дату. В процедуре реализовать вычисление и занесение в БД стоимости всех заказов, составленных в этот день.  

Разработать триггер, который будет срабатывать при добавлении новой строки заказа. В триггере реализовать увеличение общей стоимости соответствующего заказа нарастающим итогом.

# Документация
>Каждой команде необходимо создать документацию по выполненому заданию, за которое она отвечала.
>Документация должна удовлетворять указанным в данном документе требованиям к содержанию и оформлению.

## Требования к содержанию

Каждый блок документации, посвещенный реализации какой-либо задачи, должен иметь следующую структруру:

* Описание/Постановка задачи
    * теоретическая сводка (описание алгоритма/реализуемой структуры/...)
    * входные/выходные данные (по возможности)
* Описание реализации
    * иеарархия классов
    * описание методов
* Пример использования
    * словесное описание кода
    * код
    * тесты (по возможности)

## Требования к оформлению
Каждому заданию должен соответствовать свой md-файл с именем <№ задания>-<название команды>-<краткое название>.md
>Например, для задания "1.ЯП версия 1" должен быть создан файл 1-pc-version1.md.
>Номер задания можно найти в Списке всех заданий.

Все md-файлы должны быть помещены в директорию document/src проекта. В итоге они будут объединены в один общий файл. 

1. Код должен быть приведен внутри блока с подсветкой синтаксиса для c#.
**Пример:**
```csharp
// this is a loop
for (int i = 0 ; i < 10; i++)
{
   // ...
}
```

----------

## Список всех заданий
1. ЯП версия 1
2. ЯП версия 2
3. Генерация трехадресного кода
4. Разбиение на ББЛ
5. Создание из ББЛ CFG
6. Поддержка goto и меток
7. Активные переменные внутри ББЛ
8. Доступные выражения внутри ББЛ
9. Достигающие определения, вычисление gen_B и kill_B
10. Итерационный алгоритм для достигающих определений
11. Живые переменные между ББЛ, множества use_B и def_B
12. Живые переменные, итерационный алгоритм
13. Доступные выражения между базовыми блоками - множества e_gen(b) и e_kill(b)
14. Достигающие выражения, итерационный алгоритм
15. Построить на CFG глубинное остовное дерево, перенумеровав элементы в порядке обратном посфиксному
16. Разработка класса для хранения f_r,IN[s] и f_r,OUT[B]
17. Передаточная функция для реализации распространения констант
18. Модифицированный (ускоренный) алгоритм с правильной нумерацией базовых блоков
19. Классификация ребер графа: наступающие, отступающие, поперечные
20. Установить, все ли отступающие ребра обратные
21. Для каждого обратного ребра найти естественный цикл
22. Дерево доминаторов
23. Формирование поседовательности областей R1,...,Rn в восходящем порядке
24. Разработка класса "область" с разновидностями "область тела" и "область цикла"
25. Восходящая часть алгоритма анализа на основе областей
18. Нисходящая часть алгоритма анализа на основе областей




## Распределение между командами

| Team          | Dev1          | Dev2           | 
| ------------- |:-------------:| :-------------:| 
| RR            | Rogov D.      | Raskin A.      |
| AN            | Avakyan G     | Nezhevsky N.   |
| LK            | Limarev V.    | Koval N.       |
| FB            | Fateev S.     | Bulanov D.     |
| PC            | Paterikin A.  | Cherkasov V.   |
| OE            | Ostapenko A.  | Ermolaev D.    |
| AE            | Aliev M.      | Ermolinsky A.  |


## Полезные ссылки
* [Справка по markdown](https://guides.github.com/features/mastering-markdown/)
* [Документация github markdown](https://help.github.com/categories/writing-on-github/)
* [StackEdit - онлайн-редактор](https://stackedit.io/)

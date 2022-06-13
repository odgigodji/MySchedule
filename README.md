# MySchedule (in work..)
<!-- ## schedule for school or university -->


### Приложение с использованием Realm, три View Controller’a c возможностью просмотра, добавления предметов в расписание, выбором цветов, указанием типа, имени преподавателя, аватарки и тд. Использованы TableView, Alert’ы, верстка в коде.

❗️Для подключения подов в корневой папке ввести команду ``pod install`` или ``arch -x86_64 pod install`` (для процессора m1)



<!-- ![scr](https://i.ibb.co/HYgs5zC/ezgif-com-gif-maker-1.gif) -->

### ``Главные VC's:``
### ScheduleVC(выводит список всех предметов):
![screenShot](https://i.ibb.co/wRsQLxc/ezgif-com-gif-maker.gif)- В верхней части календарь с возможностью выбора дня недели
- Реализована возможность скрывать календарь с помощью свайпа и на кнопку ``hide calendar``
- в нижней части Table View с предметами на выбранный день
- в правом верхнем углу кнопка ``+`` которая переносит нас на экран добавления предмета(``SсheduleOptionsTableVC``)

### TaskVC(cписок задач к конкретному уроку/предмету):
![taskVC](https://i.ibb.co/dK5ygKq/ezgif-com-gif-maker-3.gif)
- TableView со списком всех задач на день
- кнопка ``+`` которая переносит нас на экран добавления задания(``TasksOptionsTableVC``)

### ContactsVC(список контактов, связанных с учебой):
![contactVC](https://i.ibb.co/brdWyQX/ezgif-com-gif-maker-2.gif)
- TableView с преподавателями и студентами
- Каждая ячейка состоит из аватарки, номера телефона, имени, почты
- SearchBar для поиска контактов
- segmentController для выбора учеников или преподавателей
- возможность изменить контакт по тапу
- кнопка ``+`` которая переносит нас на экран добавления контакта(``ContactOptions``)

### ``Второстепенные VC's:`` 
#### ScheduleOptions:
-
#### TaskOptions:
-
#### ContactOptions:
-
#### TeachersOptions:
-
#### ColorsOptions(for schedule and tasks)
-

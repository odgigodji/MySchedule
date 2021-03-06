# MySchedule ver 1.0
<!-- ## schedule for school or university -->


### Приложение с использованием Realm, три View Controller’a c возможностью просмотра, добавления предметов в расписание, выбором цветов, указанием типа, имени преподавателя, аватарки и тд. Использованы TableView, Alert’ы, верстка в коде.

❗️Для подключения подов в корневой папке ввести команду ``pod install`` или ``arch -x86_64 pod install`` (для процессора m1)



<!-- ![scr](https://i.ibb.co/HYgs5zC/ezgif-com-gif-maker-1.gif) -->

### ``Главные VC's:``
### ScheduleVC(выводит список всех предметов):
![screenShot](https://i.ibb.co/wRsQLxc/ezgif-com-gif-maker.gif)
- В верхней части календарь с возможностью выбора дня недели
- Реализована возможность скрывать календарь с помощью свайпа и на кнопку ``hide calendar``
- в нижней части Table View с предметами на выбранный день
- в правом верхнем углу кнопка ``+`` которая переносит нас на экран добавления предмета(``SсheduleOptionsTableVC``)

### TaskVC(cписок задач к конкретному уроку/предмету):
![taskVC](https://i.ibb.co/dK5ygKq/ezgif-com-gif-maker-3.gif)
- TableView со списком всех задач на день
- ячейка состоит из названия предмета и задания, а также кнопки которую можно нажать если задача выполнена
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
- позволяет настроить дату, время, название, тип, корпус и аудитория предмета
- при нажатии на ``Teacher's name`` переходим на экран выбора учителя ``TeacherVC``
- выбор цвета и переход на ``ColorsOption``
- переключатель если предмет поввторяется каждую неделю(по умалчанию включен)
#### TaskOptions:
- позволяет выбрать дату, время, название предмета, а также задание 
- цвет через ``ColorsOption``
#### ContactOptions:
<!-- ![asdf](https://i.ibb.co/jTH5VB1/ezgif-com-gif-maker-7.gif) -->
- позволяет настроить имя, телефон, почту
- выбрать фото
#### TeachersVC:
- экран, появляется при выборе учитиля в ``ScheduleOptin`` содержит всех учителей
#### ColorsOptions(for schedule and tasks)
- появляется при выборе цвета задачи/предмета в ``ScheduleOption`` или ``TaskOption``
- на выбор предлагается 8 тонов

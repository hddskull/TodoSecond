# Функциональная спецификация

Приложение таск менеджер - приложения в которой можно заводить и отслеживать задачи.

Целью приложения является помощь пользователю в составлении и отслеживании определенных задач для упрощения его деятельности.

К примеру у студента Иванова 2 курсовых работы и 32 практических работы. Ему конечно сложно будет помнить про них всех и помнить какие работы к каким датам ему нужно будет подготовить. Поэтому для упрощения своей жизни он воспользуется приложением и составить для каждой работы свою задачу, а в их описании он может написать требования к работам, какие шаги надо предпринять для выполнения задачи и многое другое, что он сочтет нужным.

## Функционал приложения по экранам:

1) Экран входа
- На данном экране пользователь входит в ранее заведенную учетную запись или проходить регистрацию учетной записи посредством перехода на экран регистрации, нажатием кнопки "registration".

2) Экран регистрации
- На данном экране заполнив текстовые поля "emial" и "password" и нажав на кнопку "register" пользователь регистрирует учетную запись в локальной БД.

3) Экран списка задач
- На данном экране пользователь может увидеть заведенные им задачи. При отсутсвии таковых список будет пустым.
- В одной строке будет отображаться одна задача у которой будут выводится: название задачи, описание задачи и дедлайн (срок к которому задача должна быть выполнена).
- Каждую задачу можно изменить нажав на нее.
- Также каждую задачу можно удалить, смахнув справа налево или поменять ей статсу с "active" на "done" смахнува слева направо.
- Задачи которые еще не выполненые будут отображаться желтым цветом.
- Задачи которые выполнены будут отображаться серым цветом.
- Удаленные задачи не будут отображаться.
- Выход из учетной записи происходит по кнопке "back"

4) Экран создания/редактирования задачи
- На данном экране есть 3 поля: название задачи, описание задачи и выбор дедлайна
- При выходе с данного экрана изменения не сохранятся
- При нажатии на кнопку "save" изменения сохранятся и откроется экран спикса задач

##Модифированный /tg/station v1.0.1
Используется сервером Infinity.

**Сайт оригинального разработчика:** http://www.tgstation13.org  
**Оригинальный код:** https://github.com/tgstation/-tg-station  
**Код**: https://bitbucket.org/infinity_team/infinity-tg  
**Сайт разработчика:** http://infinity.smforum.ru/index.php  
**IRC (На английском)**: irc://irc.rizon.net/coderbus  
**Карта:** MetaStation v41A.II_FIX7.dmm, z2t.dmm

##ЗАГРУЗКА

Есть несколько способов скачать билд проекта.

Вариант 1:  
Скачать здесь в *.zip файле: https://bitbucket.org/infinity_team/infinity-tg/downloads

Вариант 2:  
1. Установить SourceTree (рекомендуем) или любой другой GIT-клиент.  
https://www.sourcetreeapp.com/download/  
2. Зайти в SourceTree и клонировать репозиторий по ссылке:  
https://bitbucket.org/infinity_team/infinity-tg.git

##УСТАНОВКА
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Откройте файл tgstation.dme с помощью Dream Maker.
2. Нажмите Build -> Compile или нажмите Ctrl + K.
3. Дождитесь сообщения:  
...  
saving tgstation.dmb (DEBUG mode)  
tgstation.dmb - 0 errors, 0 warnings
4. Если будут проблемы, пишите на форум.

##ЗАПУСК
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Нажмите на Menu (Шестеренка) -> Start Dream Daemon. Или нажмите Ctrl + D.
2. Выберите с файл с помощью кнопки [...].
3. Напишите порт и нажмите кнопку [GO].
4. Как только появится строка "Initializations Complete" нажмите кнопку входа, которая обозначена стрелкой.

##ХОСТИНГ В ОС LINUX
В билде используется BYGEX для некоторых текстовых операции. К сожалению, билд имеет только библиотеку для ОС Windows. Если вы можете, то можете скачать BYGEX для Linux здесь https://code.google.com/p/byond-regex/ и скомпилировать его.  
Также можно отредактировать файл code/_compile_options.dm, и закомментировать строку: #define USE_BYGEX в начале строки таким образом: //#define USE_BYGEX и перекомпилировать билд снова.

##СОДЕЙСТВИЕ РАЗРАБОТКЕ БИЛДА.
Читать здесь:  
http://infinity.smforum.ru/index.php?topic=2630
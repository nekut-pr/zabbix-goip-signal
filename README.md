Вашему вниманию предоставляется программа для мониторинга принимающего сигнала SIM карт с Go-IP.
===========

Для начала нужно установить модуль **HTML::Parser**.

```
perl -MCPAN -e 'install HTML::Parser'
```

Этой ссылкой вы указываете куда будет сохраняться html код строницы **Status->Summary** с GoIP
```perl 
my $file_curle = "/usr/scripts/go-ip/curl.html";
```
Этой ссылкой вы указываете куда сохранять уровень сигнала с формат txt
```perl 
my $file_output = "/usr/scripts/go-ip/output.txt"; 
```
____
Запуск файла
-----------
Открываем файл в crontab на дерактирование 
```
nano /etc/crontab
```
Вставляем в конец файла *(запуск скрипта каждые 5 минут)*
```
*/5 *    * * *   root    perl /usr/scripts/go-ip/go-ip.pl
```
Перегружаем cron
```
/etc/init.d/cron restart 
```
Проверка
```
perl /usr/scripts/go-ip/go-ip.pl
cat /usr/scripts/go-ip/output.txt
```

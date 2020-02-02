Вашему вниманию предоставляется программа для мониторинга принимающего сигнала SIM карт с Go-IP.
===========

Для начала нужно установить модуль **HTML::Parser**.

```
perl -MCPAN -e 'install HTML::Parser'
```
`l1_gsm_signal` это номер канала с которого вы хотите снимать показания 
```perl 
system("curl -s -u admin:admin 'http://ip_address_go-ip/default/en_US/status.html' | grep l1_gsm_signal >> $file_curle");

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
____
Zabbix
-----------

создаем файл
```
/etc/zabbix/zabbix_agentd.d/userparameter_asterisk.conf
```
#### вводим

```UserParameter=signal,cat /usr/scripts/go-ip/output.txt```
#### выходим

### Перегружаем Zabbix агента

```/etc/init.d/zabbix-agent restart```


### Переходим в zabbix

Настройки->Узлы сети->Zabbix Server
Элементы данных->Создать элемент данных


| Данные | Значения |
|----------------|:---------:|
| Имя | Уровень сигнала MTS |
| Тип | Zabbix агент |
| ключ | signal |
| Единица измерения | dB |
| Интервал обновления | 5m |

Имя Уровень сигнала 

Тип Zabbix агент
Ключ signal.mts



Инстукцию по созданию графиков вы можете посмотреть тут
https://www.zabbix.com/documentation/3.0/ru/manual/config/visualisation/graphs/custom

И вот ваш мониторинг уровня сигнала готов
![Alt-текст](https://i.ibb.co/gghZ51Q/zabbix.png)

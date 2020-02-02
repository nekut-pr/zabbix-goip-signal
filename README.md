Вашему вниманию предоставляется программа для мониторинга принимающего сигнала SIM карт с Go-IP.
-----------

Для начала нужно установить модуль **HTML::Parser**.

> perl -MCPAN -e 'install HTML::Parser'

Этой ссылкой вы указываете куда будет сохраняться html код строницы Status->Summary с GoIP
 ```perl 
 my $file_curle = "/usr/scripts/go-ip/curl.html";
 ```
 Этой ссылкой вы указываете куда сохранять уровень сигнала с формат txt
 ```perl 
 my $file_output = "/usr/scripts/go-ip/output.txt"; 
 ```
 

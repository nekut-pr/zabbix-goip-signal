В данном примере я покажу как и чё делать

  GNU nano 2.7.4                                                                                          Файл: /usr/scripts/test/go-ip.pl                                                                                                    

#!/usr/bin/perl -w

use strict;
use warnings;
use HTML::Parser;

my $file_curle = "/usr/scripts/test/curl.html";
my $file_output = "/usr/scripts/test/output.txt";

system("curl -s -u admin:admin 'http://192.168.33.250/default/en_US/status.html' | grep l1_gsm_signal >> $file_curle");         #MTC


open(my $in, "<", $file_curle)                              # открываем файл на чтение
    or die "Не могу открыть файл на чтение";
        my @array = <$in>;                                  # считываем строки файла в массив
close($in);                                                 # закрываем файл

open(my $out, ">", $file_curle)                             # открываем файл на запись
    or die "Не могу открыть файл на запись";
        foreach my $x (@array) {                            # последовательно перебираем все элементы массива
            $x =~ s/\s//g;                                  # убераем пробелы
            $x =~ s/&nbsp;//g;                              # делаем замену   
        print $out $x;                                      # выводим в файл
    }
close($out);                                                # закрываем файл

my $p = HTML::Parser->new( api_version => 3, text_h => [\&text, "event,text" ]);
    $p->parse_file($file_curle);

sub text {
    my ($self, $text) = @_;
    open(my $fh, '>', $file_output) or die "Не могу открыть $file_output\n";
    print $fh $text or die "Не могу записать данные в $file_output\n";
}

unlink $file_curle; # удаляем файл


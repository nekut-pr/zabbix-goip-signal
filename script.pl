#!/usr/bin/perl -w

use strict;
use warnings;
use HTML::Parser;

my $file_curle = "путь к файлу для сохранения выхлопа сurl";
my $file_output = "путь к файлу для хранения цифры уровня сигнала";

system("curl -s -u admin:admin 'http://ip_address_go-ip/default/en_US/status.html' | grep l1_gsm_signal >> $file_curle");

open(my $in, "<", $file_curle)                             
    or die "Не могу открыть файл на чтение";
        my @array = <$in>;                                  
close($in);                                                 

open(my $out, ">", $file_curle)                             
    or die "Не могу открыть файл на запись";
        foreach my $x (@array) {                            
            $x =~ s/\s//g;                                  
            $x =~ s/&nbsp;//g;                                 
        print $out $x;                                     
    }
close($out);                                               

my $p = HTML::Parser->new( api_version => 3, text_h => [\&text, "event,text" ]);
    $p->parse_file($file_curle);

sub text {
    my ($self, $text) = @_;
        open(my $fh, '>', $file_output) or die "Не могу открыть $file_output\n";
        print $fh $text or die "Не могу записать данные в $file_output\n";
}

unlink $file_curle;

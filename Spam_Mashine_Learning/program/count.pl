#!/usr/bin/env perl

use warning;


#ボアソン分布作成用プログラム　カウントできる.
#agv（引数にarffを指定））





open(DATAFILE, "< $fileuri")) or die("error :$!");

@ip;
@time;
@msid;
@subject;
@from;
@text;
@multi;
@url;
@urlper;
@spam_word;
@spam_f;
@spam;


while (my $line = <DATAFILE>){
    chomp($line);



#arffの実データIP40?????になるまで検索.
if ($line =~ /4/) {

    ($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12) = split(",",$line);

    push(@ip,$a1); 
    push(@time,$a2);
    push(@msid,$a3);
    push(@subject,$a4);
    push(@text,$a5);
    push(@multi,$a6);
    push(@url,$a7);
    push(@url_per,$a8);
    push(@time,$a9);
    push(@spam_word,$a10);
    push(@spam_f,$a11);
    push(@spam,$a12);
    
}



}


print @multi;

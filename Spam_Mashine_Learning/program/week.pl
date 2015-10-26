#!/usr/bin/env perl

use warnings;


#arima用プログラム　カウントできる.
#agv（引数にarffを指定））


my $fileuri = $ARGV[0];

open(DATAFILE, "< $fileuri")or die("error :$!");

#月


#カウント用
@splittime;
@htmlnum;
@textnum;
@nonmultipart;
@multipart_text;
@multipart_nontext;
@spliturl;
@spliturlper;
@splitspam_word;
@splitspam_f;
@splitnonspam;
@splitspam;




#new
@splittime2;
@htmlnum2;
@textnum2;
@nonmultipart2;
@multipart_text2;
@multipart_nontext2;
@spliturl2;
@spliturlper2;
@splitspam_word2;
@splitspam_f2;
@splitnonspam2;
@splitspam2;






while (my $line = <DATAFILE>){
    chomp($line);


   ($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12) = split(",",$line);
    
     push(@splittime,$a1);
     push(@htmlnum,$a2);
     push(@textnum,$a3);
     push(@nonmultipart,$a4);
     push(@multipart_text,$a5);
     push(@multipart_nontext,$a6);
     push(@spliturl,$a7);
     push(@spliturlper,$a8);
     push(@splitspam_word,$a9);
     push(@splitspam_f,$a10);
     push(@splitnonspam,$a11);
     push(@splitspam,$a12);

}


$r = 0;

$b1 = 0;
$b2 = 0;
$b3 = 0;
$b4 = 0;
$b5 = 0;
$b6 = 0;
$b7 = 0;
$b8 = 0;
$b9 = 0;
$b10 = 0;
$b11 = 0;
$b12 = 0;

 



for($i=0;$i<=$#splittime;$i++){


#処理

 


    $b2+=$htmlnum[$i];
    $b3+=$textnum[$i];
    $b4+=$nonmultipart[$i];
    $b5+=$multipart_text[$i];
    $b6+=$multipart_nontext[$i];
    $b7+=$spliturl[$i];
    $b8+=$spliturlper[$i];
    $b9+=$splitspam_word[$i];
    $b10+=$splitspam_f[$i];
    $b11+=$splitnonspam[$i];
    $b12+=$splitspam[$i];


    if(($i+1)%7 == 0){
	
	push(@splittime2,$r);
	push(@htmlnum2,$b2);
	push(@textnum2,$b3);
	push(@nonmultipart2,$b4);
	push(@multipart_text2,$b5);
	push(@multipart_nontext2,$b6);
	push(@spliturl2,$b7);
	push(@spliturlper2,$b8);
	push(@splitspam_word2,$b9);
	push(@splitspam_f2,$b10);
	push(@splitnonspam2,$b11);
	push(@splitspam2,$b12);
	
	$r++;
	$b1 = 0;
	$b2 = 0;
	$b3 = 0;
	$b4 = 0;
	$b5 = 0;
	$b6 = 0;
	$b7 = 0;
	$b8 = 0;
	$b9 = 0;
	$b10 = 0;
	$b11 = 0;
	$b12 = 0;

    }

}


$r++;
push(@splittime2,$r);
push(@htmlnum2,$b2);
push(@textnum2,$b3);
push(@nonmultipart2,$b4);
push(@multipart_text2,$b5);
push(@multipart_nontext2,$b6);
push(@spliturl2,$b7);
push(@spliturlper2,$b8);
push(@splitspam_word2,$b9);
push(@splitspam_f2,$b10);
push(@splitnonspam2,$b11);
push(@splitspam2,$b12);



open(ECHO, "> count.txt")or die("error :$!");
    for($i=0;$i<=$#splittime2;$i++){
      print ECHO "$splittime2[$i],$htmlnum2[$i],$textnum2[$i],$nonmultipart2[$i],$multipart_text2[$i],$multipart_nontext2[$i],$spliturl2[$i],$spliturlper2[$i],$splitspam_word2[$i],$splitspam_f2[$i],$splitnonspam2[$i],$splitspam2[$i]\n";



    }

#!/usr/bin/env perl

use warnings;


#ボアソン分布作成用プログラム　カウントできる.
#agv（引数にarffを指定））


$rm = `rm -rf count.txt`;

my $fileuri = $ARGV[0];

open(DATAFILE, "< $fileuri")or die("error :$!");


#fileuri用
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



#カウント用
@splittime;
@htmlnum;
@text;
@nonmultipart;
@multipart_text;
@multipart_nontext;
@spliturl;
@spliturlper;
@splitspam_word;
@splitspam_f;
@splitnonspam;
@splitspam;



while (my $line = <DATAFILE>){
    chomp($line);



#arffの実データIP40?????になるまで検索.
if ($line =~ /4/) {

    ($a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$a10,$a11,$a12) = split(",",$line);




    push(@ip,$a1); 
    push(@time,$a2);
    push(@msid,$a3);
    push(@subject,$a4);
    push(@from,$a5);
    push(@text,$a6);
    push(@multi,$a7);
    push(@url,$a8);
    push(@urlper,$a9);
    push(@spam_word,$a10);
    push(@spam_f,$a11);
    push(@spam,$a12);
    
}



}


#始まりの値　終わりの値
#1228118400 <-2008/12/01 17:00:00  1267426162<-2010/03/01 15:49:22   (1228118400 - 1267455600)を時間間隔で検索

#1時間を得たい場合は3600
#1日86400
#一月 ....
#4半期 ...

$kankaku = 86400;

for($z=1230735600;$z<1262271600;$z+=$kankaku){
    $ii = $z + $kankaku;
    $pattern = "[$z-$ii]";

    push(@splittime,$z);
    
    $b1=0;
    $b2=0;
    $b3=0;
    $b4=0;
    $b5=0;
    $b6=0;
    $b7=0;
    $b8=0;
    $b9=0;
    $b10=0;
    $b11=0;
    


    for($i=0;$i<=$#time;$i++){

 	     $iii  = $time[$i]-$z;


	     
	#time範囲
	if (0 <= $iii && $kankaku >$iii ) {
	 



   
	  if ($text[$i] =~ /HTML/) {
	      $b1++;
	  }elsif($text[$i] =~ /text/){
	      $b2++;
	  }
	    
	  if ($multi[$i] =~ /non-multipart/) {
              $b3++;
          }elsif($multi[$i] =~ /multipart_text/){
              $b4++;
          }elsif($multi[$i] =~ /multipart_non-text/){
              $b5++;
          }



	  $b6+=$url[$i];
	  $b7+=$urlper[$i];	  
	  $b8+=$spam_word[$i];
          $b9+=$spam_f[$i];
   
	  
	  if($spam[$i] =~ /non-spam/){
              $b10++;
          }elsif($spam[$i] =~ /spam/){
              $b11++;
          }


	  

	}



    }

	
    push(@htmlnum,$b1);
    push(@text,$b2);
    push(@nonmultipart,$b3);
    push(@multipart_text,$b4);
    push(@multipart_nontext,$b5);
	 push(@spliturl,$b6);
	 push(@spliturlper,$b7);
	 push(@splitspam_word,$b8);
	 push(@splitspam_f,$b9);
	 push(@splitnonspam,$b10);
	 push(@splitspamspam,$b11);

   
  
}



    open(ECHO, "> count.txt")or die("error :$!");

    for($i=0;$i<=$#splittime;$i++){

#	print  "$splittime[$i],$htmlnum[$i],$text[$i],$nonmultipart[$i],$multipart_text[$i],$multipart_nontext[$i],$spliturl[$i],$spliturlper[$i],$splitspam_word[$i],$splitspam_f[$i],$splitnonspam[$i],$splitspamspam[$i]\n";



      print ECHO "$splittime[$i],$htmlnum[$i],$text[$i],$nonmultipart[$i],$multipart_text[$i],$multipart_nontext[$i],$spliturl[$i],$spliturlper[$i],$splitspam_word[$i],$splitspam_f[$i],$splitnonspam[$i],$splitspamspam[$i]\n";



    }

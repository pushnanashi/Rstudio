#!/usr/bin/env perl

use warnings;


#ボアソン分布作成用プログラム　カウントできる.
#agv（引数にarffを指定））

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
@non-multipart;
@multipart_text;
@multipart_non-text;
@spliturl;
@spliturlper;
@splitspam_word;
@splitspam_f;
@splitnon-spam;
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
    push(@text,$a5);
    push(@multi,$a6);
    push(@url,$a7);
    push(@urlper,$a8);
    push(@time,$a9);
    push(@spam_word,$a10);
    push(@spam_f,$a11);
    push(@spam,$a12);
    
}



}


#始まりの値　終わりの値
#1228118400 <-2008/12/01 17:00:00  1267426162<-2010/03/01 15:49:22   (1228118400 - 1267455600)を時間間隔で検索


for(i=1228118400;i<=1267455600;i+=3600){
    $ii = $i + 3600;
    $patterm = "[$i-$ii]";

    push(@splittime,$i;);
    
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

	#time範囲
	if ($time =~ /$pattern/) {
	    
	  if ($text[$i] =~ /HTML/) {
	      $b1++;
	  }else if($text[$i] =~ /text/){
	      $b2++;
	  }
	    
	  if ($multi[$i] =~ /non-multipart/) {
              $b3++;
          }else if($multi[$i] =~ /multipart_text/){
              $b4++;
          }else if($multi[$i] =~ /multipart_non-text/){
              $b5++;
          }



	  $b6+=$url[$i];
	  $b7+=$urlper[$i];
	  
	  $b8+=$spam_word[$i];
          $b9+=$spam_f[$i];   
	  if($multi[$i] =~ /non-spam/){
              $b10++;
          }else if($multi[$i] =~ /spam/){
              $b11++;
          }

	  

	}



    }

		 push(@htmlnum,$b1);
		 push(@text,$b2);
		 push(@non-multipart,$b3);
		 push(@multipart_text,$b4;
		 push(@multipart_non-text,$b5);
		 push(@spliturl,$b6);
		 push(@spliturlper,$7);
		 push(@splitspam_word,$b8);
		 push(@splitspam_f,$b9);
		 push(@splitnon-spam,$b10);
	         push(@splitspam-spam,$b11);

   
  
}



    open(ECHO, "> count.txt")or die("error :$!");

    for($i=0;$i<=$#splittime;$i++){

      print ECHO "$splittime[$i],$html1um[$i],$text[$i],$non-multipart[$i],$multipart_text[$i],$multipart_non-text[$i],$spliturl[$i],$spliturlper[$i],$splitspam_word[$i],$splitspam_f[$i],$splitnon-spam[$i],$splitspam-spam[$i]\n";



    }

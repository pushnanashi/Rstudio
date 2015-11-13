timesplit <- function(data,start,end,label){
  
  
  #最後の行は引く値がなくなるため計算しない
  
   end<- end-1
   ansers<-c()
   
   for(i  in 1:end){
     
        before<-data[i]   
        after<-data[i+1]
        ans <-after-before
        ansers[i]<-ans
   }
  
return(ansers)  
}
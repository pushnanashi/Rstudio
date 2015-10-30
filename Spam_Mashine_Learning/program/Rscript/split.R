spliting <- function(data,start,end,point){

  ncolnum<-end%/%point
  print(ncolnum)
  kazu<-point*ncolnum
  
#program return this array   
  moto <- matrix(start:kazu, nrow=point, ncol=ncolnum) 
 
  print(moto)
  
  kaisu <- 1
  
 for(ii  in 1:ncolnum){
   
   for(iii in  1:point){
     moto[iii,ii]<-data[kaisu]
     kaisu<-kaisu+1
   }
   
 }
print(moto)
  
  return(moto)
  }


spliting <- function(data,start,end,point,Label){

  ncolnum<-end%/%point
  print(ncolnum)
  kazu<-point*ncolnum
  
#program return this array   
  #moto <- matrix(start:kazu, nrow=point, ncol=ncolnum) 
 
  
  moto<-c()
  #print(moto)
  
  kaisu <- 1
  name = c()
  
  ma<-c() 
  
 for(ii  in 1:ncolnum){
   
 
   newcol<-paste(Label,ii)
   name <- rbind (name, newcol) 
   
   
  
   mb<-c()    #初期化
    
   for(iii in  1:point){
     #moto[ii,iii]<-data[kaisu]
     kaisu<-kaisu+1
     mb<-c(mb, data[kaisu])
   }
   
   moto<-rbind(moto,mb) 
   
 }

  rownames(moto) <- c(name)  # 列の名前
    # 列の名前
  moto <- as.data.frame(moto)
    return(moto)
  
}


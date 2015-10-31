tesya <- function(){
  

x <- matrix(1:2, nrow=1, ncol=2)             # 2 * 3 の行列
rownames(x) <- c("up")               # 行の名前

xx <-c("unchi")
xxx <-c("unchi2")
xx <- rbind ( xx, xxx ) 


colnames(x) <- c(xx)  # 列の名前

return(x)
}
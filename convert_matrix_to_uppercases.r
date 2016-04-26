###convert all the lower-case characters in the dataframe to uppercase


df <- data.frame(v1=letters[1:5],v2=1:5,v3=letters[10:14],stringsAsFactors=FALSE)

  v1 v2 v3
1  a  1  j
2  b  2  k
3  c  3  l
4  d  4  m
5  e  5  n


data.frame(lapply(df, function(v) {
  if (is.character(v)) return(toupper(v))
  else return(v)
}))


Which gives :

  v1 v2 v3
1  A  1  J
2  B  2  K
3  C  3  L
4  D  4  M
5  E  5  N

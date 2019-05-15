/*
 * computeOperation - read file content process it to exclude  text 
  between two * * and send back to client 
 */

#include "csapp.h"

void computeOperation(int connfd) {
  
  char c ; 
 
 int firstStar  = 0 , lastStar = 0 ;

// read from client 
while(Read(connfd , &c , 1) != 0)
{
  // first * case , set  firstStar to indicate first one 
if (c == '*' && firstStar == 0  ){
firstStar = 1 ; 
continue ; 
}

// second one is defined by find * and firstStar equal one 
if (c == '*' && firstStar  == 1 ){
break;   
}
// here we start after first * so sent to client 
if (firstStar == 1){
Write(connfd , &c , 1);
}

}

}

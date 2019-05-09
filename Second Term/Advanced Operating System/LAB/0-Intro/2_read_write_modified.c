#include "csapp.h"

int main()
{

int fd1;
char c [10]; 

fd1 = Open("foo2.txt", O_RDWR| O_CREAT, 0666);
printf("fd is %d\n" , fd1);
while(Read(STDIN_FILENO, &c, 2) != 0) // READ (src , holder , size )
{
Write( 1,&c,strlen(c));
Write(fd1, &c, strlen(c));// write one byte to OUT (i.e screen) 
}

printf("finished %s\n" , c);

return 0 ; 
}

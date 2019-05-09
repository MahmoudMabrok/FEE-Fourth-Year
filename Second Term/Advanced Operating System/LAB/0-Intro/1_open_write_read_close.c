#include "csapp.h"

int main()
{

int fd1, fd2;
char c ; 

fd1 = Open("foo.txt", O_RDONLY| O_CREAT, 0666); // fd represent file descriptor for file (used to access file,
						// perform operation on it ) , 
					// O_RDONLY| O_CREAT are options for file 
					//  0666 -> file permission (owner , group , all ) each one (rwx)

fd2 = Open("foo.txt", O_RDWR| O_CREAT, 0666);
printf("fd1  %df\nd2 = %d\n", fd1 , fd2);

while(Read(STDIN_FILENO, &c, 1) != 0) // READ (src , holder , size )
{
printf("entered %c\n" , c);
Write(fd2, &c, 1);// write one byte to file  (i.e screen) 
}

printf("finished %c\n" , c);
exit(0);

}

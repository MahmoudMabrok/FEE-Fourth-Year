#include "csapp.h"

int main(int argc, char **argv)
{
  int clientfd;
  char *host, *port;


  if (argc != 3) {
    fprintf(stderr, "usage: %s <host> <port>\n", argv[0]);
    exit(0);
  }

  host = argv[1];
  port = argv[2];

// request client fd with host and port from command line 
  clientfd = Open_clientfd(host, port);

// to hold read byte 
char c;

int fd1  ; 

// open file to write read data from user into it 
// O_TRUNC to remove its prev content 
fd1 = Open("in2.txt" , O_RDWR|O_CREAT|O_TRUNC ,0666);

// contine to accept input from command line and break when got # 
while(Read(STDIN_FILENO , &c , 1) != 0 ){
if (c == '#')
break;

// write read byte into file
Write(fd1 , &c , 1);
}

// Caution, must open it again to begin reading from start
fd1 = Open("in2.txt" , O_RDWR|O_CREAT , 0666 ); 

// read from file and sent to server 
while(Read(fd1 , &c , 1) != 0 ){
Write(clientfd , &c , 1);
}

// read  result from server and output to screen 
while(Read(clientfd , &c , 1) != 0 ){
Write(1 , &c , 1);
}

exit(0);
}






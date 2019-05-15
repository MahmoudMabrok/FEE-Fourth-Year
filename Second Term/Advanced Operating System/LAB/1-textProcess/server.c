
#include "csapp.h"

void computeOperation(int connfd);

int main(int argc, char **argv) {
  int listenfd, connfd;

  if (argc != 2) {
    printf("usage: %s <port>\n", argv[0]);
    exit(0);
  }

  listenfd = Open_listenfd(argv[1]);

  while (1) {
    connfd = Accept(listenfd, NULL, NULL);
      printf("recived an client %d" , connfd);
    while (1) {
      computeOperation(connfd);
    }
  }
  Close(connfd);
  exit(0);
}

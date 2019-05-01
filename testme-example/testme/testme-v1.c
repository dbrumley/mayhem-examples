#include <stdio.h>

int checkme(char *buf)
{
  if(buf[0] == 'b')
    if(buf[1] == 'u')
      if(buf[2] == 'g')
        // this is a bug!
        return 1/0;
  return 0;
}

int main(int argc, char *argv[])
{
  FILE *f;
  char buf[10];
  int ret;
  if(argc != 2){
    fprintf(stderr, "Must supply a text file\n");
    return -1;
  }
  f = fopen(argv[1], "r");
  if(f == NULL){
    fprintf(stderr, "Could not open %s\n", argv[1]);
    return -1;
  }
  if(fgets(buf, sizeof(buf), f) == NULL){
    fprintf(stderr, "Could not read from %s\n", argv[1]);
    return -1;
  }
  ret = checkme(buf);
  printf("checkme returned: %d\n", ret);
  return ret;
}

#include "x509.h"
#include <stdlib.h>
#include <stdio.h>

int LLVMFuzzerTestOneInput(const unsigned char *data, size_t size) {
  void *outcert;
	psX509ParseCert(NULL, data, size, &outcert, 0);
  psX509FreeCert(outcert);
}

#ifndef LIBFUZZER
void main(int argc, char **argv) {
  FILE *f = fopen(argv[1], "r");
  fseek(f, 0, SEEK_END);
  int len = ftell(f);
  char *buf = malloc(len);
  fseek(f, 0, SEEK_SET);
  fread(buf, len, 1, f);
  fclose(f);
  LLVMFuzzerTestOneInput(buf, len);

}
#endif


#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stddef.h>
#include <linux/can.h>
#include <linux/can/error.h>
#include "lib.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t len){
  struct canfd_frame frame;
  if(len < sizeof(struct canfd_frame)) return 0;
  char *buf = malloc(len);
  memcpy(buf, data, len-1);
  buf[len-1]=0;
  parse_canframe((char *)buf, &frame);
  free(buf);
  return 0;
}

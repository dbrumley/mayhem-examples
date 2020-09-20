#include "mongoose.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  struct mg_dns_message req;
  return mg_parse_dns((const char *) data, size, &req);
}

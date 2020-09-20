#include "mongoose.h"

int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  char var_name[100], file_name[100];
  const char *chunk;
  size_t chunk_len, n1, n2;
  n1 = n2 = 0;
  return mg_parse_multipart((const char *)data, size,
                            var_name, sizeof(var_name),
                            file_name, sizeof(file_name),
                            &chunk, &chunk_len);
}

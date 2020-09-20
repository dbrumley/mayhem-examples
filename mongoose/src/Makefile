all: fuzz-parse-dns fuzz-parse-multipart

fuzz-parse-dns:
	$(CC) fuzz-parse-dns.c ../mongoose/mongoose.c -o $@ -fsanitize=fuzzer,address -g -I../mongoose 

fuzz-parse-multipart:
	$(CC) fuzz-parse-multipart.c ../mongoose/mongoose.c -o $@ -fsanitize=fuzzer,address -g -I../mongoose 

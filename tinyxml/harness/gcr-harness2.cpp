#include <unistd.h>
#include <fcntl.h>
#include "tinyxml2.h"

using namespace tinyxml2;

int fuzz_gcr(char *p, ssize_t length) {
    *p = '&';
    *(p+1) = '#';
    char buf[10] = { 0 };
    int len = 0;
    char* adjusted = const_cast<char*>( XMLUtil::GetCharacterRef( p, buf, &len ) );
    
    return 0;
}
    
int main(int argc, char **argv) {
    const size_t bufsize = 20;
    char buf[bufsize+1] = {0};
	int fd = open(argv[1], 0);
    ssize_t bytes_read = read(fd, buf+2, bufsize-2); // "&#" will be p[0], p[1]
    if (bytes_read > 0) {
        fuzz_gcr(buf, bytes_read);
    }
    
    return 0;
}

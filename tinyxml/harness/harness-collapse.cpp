// harness-collapse.cpp
#include "tinyxml2.h"

using namespace tinyxml2;
using namespace std;

int main(int argc, char **argv)
{
    tinyxml2::XMLDocument doc(true, COLLAPSE_WHITESPACE);
    doc.LoadFile( argv[1] );
    doc.Print();
    int errorID = doc.ErrorID();

    return errorID;
}

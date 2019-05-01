// harness.cpp
#include "tinyxml2.h"

int main(int argc, char **argv)
{
    tinyxml2::XMLDocument doc;
    doc.LoadFile( argv[1] );
    doc.Print();
    int errorID = doc.ErrorID();

    return errorID;
}

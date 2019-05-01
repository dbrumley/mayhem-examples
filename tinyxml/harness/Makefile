CXX=g++
CXXFLAGS=-g
TARGETS = gcr-harness2 harness gcr-harness  harness-collapse

all: $(TARGETS)

$(TARGETS): ${@:%=%.cpp}
	$(CXX) $(CXXFLAGS) -Itinyxml2-7.0.1 -Ltinyxml2-7.0.1  ${@:=.cpp} -o $@ -ltinyxml2

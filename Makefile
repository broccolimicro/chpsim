SOURCES	    :=  $(shell find src -name '*.cpp') $(shell find src -name '*.c')
OBJECTS	    :=  $(subst .c,.o,$(subst .cpp,.o,$(subst src/,build/,$(SOURCES))))
DIRECTORIES :=  $(sort $(dir $(OBJECTS)))

CXX				= g++
CC				= gcc
CFLAGS			= -O2 -g -fmessage-length=0
INCLUDE_PATHS	= -I../../lib/common -I../../lib/parse -I../../lib/parse_ucs -I../../lib/parse_expression -I../../lib/parse_dot -I../../lib/parse_chp -I../../lib/ucs -I../../lib/arithmetic -I../../lib/petri -I../../lib/chp -I../../lib/interpret_ucs -I../../lib/interpret_arithmetic -I../../lib/interpret_chp
LIBRARY_PATHS	= -LC:\MinGW\bin -L../../lib/common -L../../lib/parse -L../../lib/parse_ucs -L../../lib/parse_expression -L../../lib/parse_dot -L../../lib/parse_chp -L../../lib/ucs -L../../lib/arithmetic -L../../lib/petri -L../../lib/chp -L../../lib/interpret_ucs -L../../lib/interpret_arithmetic -L../../lib/interpret_chp
LIBRARIES		= -linterpret_chp -linterpret_arithmetic -linterpret_ucs -lchp -lpetri -larithmetic -lucs -lparse_chp -lparse_dot -lparse_expression -lparse_ucs -lparse -lcommon
TARGET			= chpsim

all: build $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(LIBRARY_PATHS) $(CFLAGS) $(OBJECTS) -o $(TARGET) $(LIBRARIES)

build/%.o: src/%.cpp 
	$(CXX) $(INCLUDE_PATHS) $(CFLAGS) -c -o $@ $<

build/%.o: src/%.c 
	$(CC) $(INCLUDE_PATHS) $(CFLAGS) -c -o $@ $<

build:
	mkdir $(DIRECTORIES)

clean:
	rm -f $(OBJECTS) $(TARGET) $(TARGET).exe

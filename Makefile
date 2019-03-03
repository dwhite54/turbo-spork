TARGET = raytracer
LIBS = -lm
CC = g++
CFLAGS = -g -Wall

.PHONY: default all clean run

default: $(TARGET)
all: default run

OBJECTS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))
HEADERS = $(wildcard *.h)

%.o: %.cpp $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@

run:
	./$(TARGET) | feh -

clean:
	-rm -f *.o
	-rm -f $(TARGET)

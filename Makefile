CC = gcc
CFLAGS = -O0

TARGET = bookshelf
OBJS = main.o bookshelf.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

main.o: main.c bookshelf.h
	$(CC) $(CFLAGS) -c main.c

bookshelf.o: bookshelf.c bookshelf.h
	$(CC) $(CFLAGS) -c bookshelf.c

clean:
	rm -f $(OBJS) $(TARGET)

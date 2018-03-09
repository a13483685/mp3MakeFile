.PHONY:clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
BIN  = mp3

$(BIN):$(OBJS)
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f $(BIN) $(OBJS)

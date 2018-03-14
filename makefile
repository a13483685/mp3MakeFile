.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
BIN  = mp3
all  = $(BIN) $(DEPS)

$(BIN):$(OBJS)
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $(filter %c,$^)
%cd:%.c
	gcc -MM $^ > $@
clean:
	rm -f $(BIN) $(OBJS)

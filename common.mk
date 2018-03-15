.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)

LINK_OBJ_DIR =/home/xie/work/cppTest/makeFileTest/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))

OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)

all:$(BIN) $(DEPS) $(OBJS)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(LINK_OBJ)
	gcc -o $@ $^ $(OBJS)
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o $@ -c $(filter %.c,$^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)

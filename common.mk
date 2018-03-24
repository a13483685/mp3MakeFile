.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
BIN  := $(addprefix /home/xie/work/cppTest/makeFileTest/,$(BIN)) 

LINK_OBJ_DIR =/home/xie/work/cppTest/makeFileTest/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
DEPS_DIR = /home/xie/work/cppTest/makeFileTest/app/dep
$(shell mkdir -p $(DEPS_DIR))

OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
DEPS := $(addprefix $(DEPS_DIR)/,$(DEPS))

LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ +=$(OBJS)

all: $(DEPS) $(OBJS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(LINK_OBJ)
	gcc -o $@ $^
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o $@ -c $(filter %.c,$^)
$(DEPS_DIR)/%.d:%.c
	gcc -MM $^ | sed 's,\(.*\).o[ :]*,$(LINK_OBJ_DIR)/\1.o $@:,g' > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)

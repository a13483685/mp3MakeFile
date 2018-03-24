.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
BIN  := $(addprefix /home/xie/work/cppTest/makeFileTest/,$(BIN)) 

LINK_OBJ_DIR =$(BUILD_ROOT)/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
DEPS_DIR = $(BUILD_ROOT)/app/dep
$(shell mkdir -p $(DEPS_DIR))
LIB_OBJ_DIR = $(BUILD_ROOT)/app/lib_obj
$(shell mkdir -p $(LIB_OBJ_DIR))
LIB_DIR = $(BUILD_ROOT)/lib

OBJ_DIR = $(LINK_OBJ_DIR)#.o文件默认存放在LINK_OBJ_DIR当中

ifneq ("$(LIB)","")#如果有定义LIB，那么
OBJ_DIR = $(LIB_OBJ_DIR)
endif

OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
DEPS := $(addprefix $(DEPS_DIR)/,$(DEPS))
LIB  := $(addprefix $(LIB_DIR)/,$(LIB))

LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ +=$(OBJS)

all: $(DEPS) $(OBJS) $(LIB) $(BIN)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(LINK_OBJ) $(LIB_DEP)
	gcc -o $@ $^
$(LIB):$(OBJS)
	ar rcs $@ $^
$(OBJ_DIR)/%.o:%.c
	gcc -I$(HEAD_PATH) -o $@ -c $(filter %.c,$^)
$(DEPS_DIR)/%.d:%.c
	gcc -I$(HEAD_PATH) -MM $(filter %.c,$^) | sed 's,\(.*\)\.o[ :]*,$(OBJ_DIR)/\1.o $@:,g' > $@
clean:
	rm -f $(BIN) $(OBJS) $(DEPS)

CC          = gcc
LD          = gcc
CFLAG       = -Wall
PROG_NAME   = csv-split

SRC_DIR     = ./src
BUILD_DIR   = ./build
BIN_DIR     = ./bin
LIST = $(SRC_LIST:%.c=%)
SRC_LIST = $(notdir $(wildcard $(SRC_DIR)/*.c))
OBJ_LIST = $(addprefix $(BUILD_DIR)/,$(LIST:%=%.o))

.PHONY: all clean $(PROG_NAME) compile

all: $(PROG_NAME)

compile: 
	$(foreach f, $(LIST), $(CC) -c $(CFLAG) -o $(BUILD_DIR)/$(f).o $(SRC_DIR)/$(f).c;)

mkdir:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BIN_DIR)

$(PROG_NAME): mkdir compile
	$(LD) $(OBJ_LIST) -o $(BIN_DIR)/$@

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

check:
	echo "No checks implemented, yet."
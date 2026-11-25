CC ?= gcc
CFLAGS ?= -std=c99 -Wall -Wextra -pedantic -O2
FLEX ?= flex
BISON ?= bison

SRC_DIR := .
BIN_DIR := $(SRC_DIR)/bin
BUILD_DIR := $(SRC_DIR)/build

INCLUDES := -I$(SRC_DIR)/common -I$(SRC_DIR)/compiler -I$(SRC_DIR)/vm -I$(BUILD_DIR)

# Generated parser and lexer files
PARSER_C := $(BUILD_DIR)/parser.tab.c
PARSER_H := $(BUILD_DIR)/parser.tab.h
LEXER_C := $(BUILD_DIR)/lex.yy.c

# Common objects
COMMON_OBJS := $(BUILD_DIR)/ast.o
VM_CORE_OBJS := $(BUILD_DIR)/bytecode.o $(BUILD_DIR)/disasm.o $(BUILD_DIR)/vm.o

# Compiler objects
COMPILER_OBJS := $(BUILD_DIR)/symtab.o \
                 $(BUILD_DIR)/sema.o \
                 $(BUILD_DIR)/codegen.o \
                 $(BUILD_DIR)/parser.tab.o \
                 $(BUILD_DIR)/lex.yy.o \
                 $(BUILD_DIR)/compiler_main.o

# Targets
MINIC := $(BIN_DIR)/minic
MINIC_VM := $(BIN_DIR)/minic-vm

.PHONY: all clean test

all: $(MINIC) $(MINIC_VM)

$(BIN_DIR) $(BUILD_DIR):
	mkdir -p $@

# Generate Bison Parser
$(PARSER_C) $(PARSER_H): $(SRC_DIR)/compiler/parser.y | $(BUILD_DIR)
	$(BISON) -d $< -o $(PARSER_C)

# Generate Flex Scanner
$(LEXER_C): $(SRC_DIR)/compiler/lexer.l $(PARSER_H) | $(BUILD_DIR)
	$(FLEX) -o $(LEXER_C) $<

# Compile generated C files
$(BUILD_DIR)/parser.tab.o: $(PARSER_C) | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/lex.yy.o: $(LEXER_C) | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Compile common objects
$(BUILD_DIR)/ast.o: $(SRC_DIR)/common/ast.c $(SRC_DIR)/common/ast.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Compile VM objects
$(BUILD_DIR)/bytecode.o: $(SRC_DIR)/vm/bytecode.c $(SRC_DIR)/vm/bytecode.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/disasm.o: $(SRC_DIR)/vm/disasm.c $(SRC_DIR)/vm/disasm.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/vm.o: $(SRC_DIR)/vm/vm.c $(SRC_DIR)/vm/vm.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Compile compiler objects
$(BUILD_DIR)/symtab.o: $(SRC_DIR)/compiler/symtab.c $(SRC_DIR)/compiler/symtab.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/sema.o: $(SRC_DIR)/compiler/sema.c $(SRC_DIR)/compiler/sema.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/codegen.o: $(SRC_DIR)/compiler/codegen.c $(SRC_DIR)/compiler/codegen.h | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/compiler_main.o: $(SRC_DIR)/compiler/main.c $(PARSER_H) | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(BUILD_DIR)/vm_main.o: $(SRC_DIR)/vm/main.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Link minic (Compiler)
$(MINIC): $(COMMON_OBJS) $(VM_CORE_OBJS) $(COMPILER_OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@

# Link minic-vm (Virtual Machine)
$(MINIC_VM): $(VM_CORE_OBJS) $(BUILD_DIR)/vm_main.o | $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@

test: all
	bash $(SRC_DIR)/tests/run_all.sh

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

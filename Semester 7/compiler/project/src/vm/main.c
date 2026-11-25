#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "vm.h"
#include "disasm.h"

static void print_usage(const char *prog) {
    printf("Usage: %s [options] <file.mbc>\n", prog);
    printf("Options:\n");
    printf("  --trace     Enable step-by-step instruction tracing with stack snapshots\n");
    printf("  --disasm    Disassemble and display the bytecode without executing\n");
    printf("  --help      Show this help message\n");
}

int main(int argc, char **argv) {
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    bool trace_mode = false;
    bool disasm_only = false;
    const char *file_path = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--trace") == 0) {
            trace_mode = true;
        } else if (strcmp(argv[i], "--disasm") == 0) {
            disasm_only = true;
        } else if (strcmp(argv[i], "--help") == 0) {
            print_usage(argv[0]);
            return 0;
        } else if (argv[i][0] == '-') {
            fprintf(stderr, "Unknown option: %s\n", argv[i]);
            print_usage(argv[0]);
            return 1;
        } else {
            file_path = argv[i];
        }
    }

    if (!file_path) {
        fprintf(stderr, "Error: no input bytecode file specified.\n");
        print_usage(argv[0]);
        return 1;
    }

    VM vm;
    if (!vm_load_file(&vm, file_path)) {
        return 1;
    }

    if (disasm_only) {
        BytecodeChunk chunk;
        chunk.code = (uint8_t *)vm.code;
        chunk.code_size = vm.code_size;
        chunk.constants = (Value *)vm.constants;
        chunk.constant_count = vm.constant_count;
        chunk.locals_count = (uint32_t)vm.locals_count;
        disasm_chunk(&chunk, stdout);
        vm_free(&vm);
        return 0;
    }

    vm.trace_mode = trace_mode;
    int exit_code = vm_run(&vm);
    vm_free(&vm);
    return exit_code;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "../common/ast.h"
#include "symtab.h"
#include "sema.h"
#include "codegen.h"
#include "../vm/bytecode.h"
#include "../vm/disasm.h"
#include "../vm/vm.h"

extern FILE *yyin;
extern int yyparse(void);
extern ASTNode *g_root;
extern void yylex_destroy(void);

static void print_banner(const char *title) {
    printf("\n================================================================\n");
    printf("=== [%s] ===\n", title);
    printf("================================================================\n");
}

static void print_usage(const char *prog) {
    printf("Mini-C Bytecode Compiler ('minic')\n");
    printf("Usage:\n");
    printf("  %s compile <file.mc> [-o <file.mbc>]   Compile source to portable bytecode\n", prog);
    printf("  %s run [--verbose] [--trace] <file.mc>  Compile and execute immediately\n", prog);
    printf("  %s --dump-ast <file.mc>                Parse and display the syntactic AST\n", prog);
    printf("  %s --dump-sym <file.mc>                Perform semantic analysis and dump Symbol Table\n", prog);
    printf("  %s --dump-typed-ast <file.mc>          Display AST annotated with types and promotions\n", prog);
    printf("  %s --disasm <file.mc | file.mbc>       Disassemble bytecode or compiled source\n", prog);
    printf("  %s --help                              Show this help information\n", prog);
}

static bool parse_source(const char *path) {
    bool is_stdin = (strcmp(path, "-") == 0);
    FILE *f = is_stdin ? stdin : fopen(path, "r");
    if (!f) {
        fprintf(stderr, "Compiler Error: cannot open source file '%s'\n", path);
        return false;
    }
    yyin = f;
    g_root = NULL;
    int res = yyparse();
    if (!is_stdin) fclose(f);
    yylex_destroy();
    return (res == 0 && g_root != NULL);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    enum {
        MODE_COMPILE,
        MODE_RUN,
        MODE_DUMP_AST,
        MODE_DUMP_SYM,
        MODE_DUMP_TYPED_AST,
        MODE_DISASM
    } mode = MODE_COMPILE;

    bool verbose = false;
    bool trace = false;
    const char *input_path = NULL;
    const char *output_path = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "compile") == 0) {
            mode = MODE_COMPILE;
        } else if (strcmp(argv[i], "run") == 0) {
            mode = MODE_RUN;
        } else if (strcmp(argv[i], "--dump-ast") == 0) {
            mode = MODE_DUMP_AST;
        } else if (strcmp(argv[i], "--dump-sym") == 0) {
            mode = MODE_DUMP_SYM;
        } else if (strcmp(argv[i], "--dump-typed-ast") == 0) {
            mode = MODE_DUMP_TYPED_AST;
        } else if (strcmp(argv[i], "--disasm") == 0) {
            mode = MODE_DISASM;
        } else if (strcmp(argv[i], "--verbose") == 0) {
            verbose = true;
        } else if (strcmp(argv[i], "--trace") == 0) {
            trace = true;
        } else if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) {
            output_path = argv[++i];
        } else if (strcmp(argv[i], "--help") == 0) {
            print_usage(argv[0]);
            return 0;
        } else if (argv[i][0] == '-') {
            fprintf(stderr, "Unknown option: %s\n", argv[i]);
            print_usage(argv[0]);
            return 1;
        } else {
            input_path = argv[i];
        }
    }

    if (!input_path) {
        fprintf(stderr, "Error: no input file specified.\n");
        print_usage(argv[0]);
        return 1;
    }

    // Check if --disasm was called on an existing .mbc file
    if (mode == MODE_DISASM) {
        FILE *check_f = fopen(input_path, "rb");
        if (check_f) {
            uint8_t magic[4];
            if (fread(magic, 1, 4, check_f) == 4 && memcmp(magic, MBC_MAGIC, 4) == 0) {
                fclose(check_f);
                VM vm;
                if (!vm_load_file(&vm, input_path)) return 1;
                BytecodeChunk c;
                c.code = (uint8_t *)vm.code;
                c.code_size = vm.code_size;
                c.constants = (Value *)vm.constants;
                c.constant_count = vm.constant_count;
                c.locals_count = (uint32_t)vm.locals_count;
                disasm_chunk(&c, stdout);
                vm_free(&vm);
                return 0;
            }
            fclose(check_f);
        }
    }

    // Otherwise, parse source file
    if (!parse_source(input_path)) {
        return 1;
    }

    if (mode == MODE_DUMP_AST) {
        print_banner("Stage 1: Abstract Syntax Tree (AST)");
        ast_print(g_root, 0);
        ast_free(g_root);
        return 0;
    }

    if (verbose) {
        print_banner("Stage 1: AST");
        ast_print(g_root, 0);
    }

    // Semantic analysis
    SemaResult sema_res = sema_analyze(g_root, (mode == MODE_DUMP_SYM || verbose));
    if (!sema_res.success) {
        ast_free(g_root);
        return 1;
    }

    if (mode == MODE_DUMP_SYM) {
        ast_free(g_root);
        return 0;
    }

    if (mode == MODE_DUMP_TYPED_AST) {
        print_banner("Stage 2: Typed AST");
        ast_print(g_root, 0);
        ast_free(g_root);
        return 0;
    }

    if (verbose) {
        print_banner("Stage 2: Symbol Table & Typed AST");
        ast_print(g_root, 0);
    }

    // Bytecode generation
    BytecodeChunk *chunk = codegen_generate(g_root, sema_res.total_locals);
    if (!chunk) {
        fprintf(stderr, "Codegen Error: failed to generate bytecode.\n");
        ast_free(g_root);
        return 1;
    }

    if (mode == MODE_DISASM) {
        disasm_chunk(chunk, stdout);
        bytecode_chunk_free(chunk);
        ast_free(g_root);
        return 0;
    }

    if (verbose) {
        print_banner("Stage 3: Generated Bytecode Disassembly");
        disasm_chunk(chunk, stdout);
    }

    if (mode == MODE_COMPILE) {
        char default_out[512];
        if (!output_path) {
            snprintf(default_out, sizeof(default_out), "%s.mbc", input_path);
            output_path = default_out;
        }
        if (!codegen_write_file(chunk, output_path)) {
            bytecode_chunk_free(chunk);
            ast_free(g_root);
            return 1;
        }
        if (verbose) {
            printf("\nSuccessfully compiled to bytecode file '%s'\n", output_path);
        }
        bytecode_chunk_free(chunk);
        ast_free(g_root);
        return 0;
    }

    // MODE_RUN
    if (verbose) {
        print_banner("Stage 4: VM Execution Trace");
    }

    VM vm;
    vm_init(&vm, chunk->code, chunk->code_size, chunk->constants, chunk->constant_count, chunk->locals_count);
    vm.trace_mode = (verbose || trace);

    int exit_code = vm_run(&vm);

    vm_free(&vm);
    bytecode_chunk_free(chunk);
    ast_free(g_root);
    return exit_code;
}

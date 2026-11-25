#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "../common/ast.h"
#include "../compiler/sema.h"
#include "../compiler/codegen.h"
#include "../vm/bytecode.h"
#include "../vm/disasm.h"

int main(void) {
    printf("=== Testing Code Generation & Disassembly ===\n");

    // int main() { int a = 5; int b = a + 3; println(b); return 0; }
    ASTNode *block = ast_new_block(1, 1);
    ast_block_append(block, ast_new_decl("a", TYPE_INT, ast_new_literal_int(5, 1, 1), 1, 1));
    ast_block_append(block, ast_new_decl("b", TYPE_INT,
        ast_new_binary_op('+', ast_new_var("a", 2, 1), ast_new_literal_int(3, 2, 5), 2, 3), 2, 1));
    ast_block_append(block, ast_new_print(ast_new_var("b", 3, 1), true, 3, 1));
    ast_block_append(block, ast_new_return(ast_new_literal_int(0, 4, 1), 4, 1));

    ASTNode *prog = ast_new_program(ast_new_func_def("main", block, 1, 1));

    SemaResult sema_res = sema_analyze(prog, false);
    assert(sema_res.success);
    assert(sema_res.total_locals == 2);

    BytecodeChunk *chunk = codegen_generate(prog, sema_res.total_locals);
    assert(chunk != NULL);
    assert(chunk->code_size > 0);
    assert(chunk->locals_count == 2);

    // Verify disassembler prints instructions
    printf("\n--- Generated Disassembly ---\n");
    disasm_chunk(chunk, stdout);

    // Write to a temporary .mbc file and read back header
    const char *tmp_mbc = "/tmp/test_gen.mbc";
    bool written = codegen_write_file(chunk, tmp_mbc);
    assert(written);

    FILE *f = fopen(tmp_mbc, "rb");
    assert(f != NULL);
    uint8_t magic[4];
    assert(fread(magic, 1, 4, f) == 4);
    assert(memcmp(magic, MBC_MAGIC, 4) == 0);
    fclose(f);

    bytecode_chunk_free(chunk);
    ast_free(prog);
    printf("\n[PASS] Code generation and disassembly test completed.\n");
    return 0;
}

#ifndef MINIC_SEMA_H
#define MINIC_SEMA_H

#include <stdbool.h>
#include "../common/ast.h"
#include "symtab.h"

typedef struct {
    bool success;
    int total_locals;
    int error_count;
} SemaResult;

SemaResult sema_analyze(ASTNode *root, bool verbose);

#endif

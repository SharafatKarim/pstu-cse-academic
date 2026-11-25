#ifndef MINIC_SYMTAB_H
#define MINIC_SYMTAB_H

#include <stdbool.h>
#include "../common/value.h"

typedef struct Symbol {
    char *name;
    DataType type;
    int scope_depth;
    int local_slot;
    int line;
    int col;
} Symbol;

typedef struct Scope {
    struct Scope *parent;
    Symbol **symbols;
    int count;
    int capacity;
    int scope_depth;
} Scope;

typedef struct SymbolTable {
    Scope *current_scope;
    Scope **all_scopes;
    int all_count;
    int all_capacity;
    int next_slot;
    int total_slots;
} SymbolTable;

SymbolTable *symtab_new(void);
void symtab_free(SymbolTable *st);
void symtab_enter_scope(SymbolTable *st);
void symtab_leave_scope(SymbolTable *st);
Symbol *symtab_lookup_current(SymbolTable *st, const char *name);
Symbol *symtab_lookup(SymbolTable *st, const char *name);
Symbol *symtab_add(SymbolTable *st, const char *name, DataType type, int line, int col);
void symtab_dump(const SymbolTable *st);

#endif

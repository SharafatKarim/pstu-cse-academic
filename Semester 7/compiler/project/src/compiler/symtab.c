#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

static char *my_strdup(const char *s) {
    if (!s) return NULL;
    size_t len = strlen(s) + 1;
    char *d = (char *)malloc(len);
    if (d) memcpy(d, s, len);
    return d;
}

static Scope *scope_new(Scope *parent, int depth) {
    Scope *sc = (Scope *)malloc(sizeof(Scope));
    sc->parent = parent;
    sc->scope_depth = depth;
    sc->count = 0;
    sc->capacity = 4;
    sc->symbols = (Symbol **)malloc(sizeof(Symbol *) * sc->capacity);
    return sc;
}

static void scope_free(Scope *sc) {
    if (!sc) return;
    for (int i = 0; i < sc->count; i++) {
        free(sc->symbols[i]->name);
        free(sc->symbols[i]);
    }
    free(sc->symbols);
    free(sc);
}

SymbolTable *symtab_new(void) {
    SymbolTable *st = (SymbolTable *)malloc(sizeof(SymbolTable));
    st->current_scope = scope_new(NULL, 0);
    st->next_slot = 0;
    st->total_slots = 0;
    return st;
}

void symtab_free(SymbolTable *st) {
    if (!st) return;
    Scope *cur = st->current_scope;
    while (cur) {
        Scope *parent = cur->parent;
        scope_free(cur);
        cur = parent;
    }
    free(st);
}

void symtab_enter_scope(SymbolTable *st) {
    if (!st) return;
    int depth = st->current_scope ? st->current_scope->scope_depth + 1 : 0;
    st->current_scope = scope_new(st->current_scope, depth);
}

void symtab_leave_scope(SymbolTable *st) {
    if (!st || !st->current_scope) return;
    Scope *old = st->current_scope;
    st->current_scope = old->parent;
    scope_free(old);
}

Symbol *symtab_lookup_current(SymbolTable *st, const char *name) {
    if (!st || !st->current_scope || !name) return NULL;
    Scope *sc = st->current_scope;
    for (int i = 0; i < sc->count; i++) {
        if (strcmp(sc->symbols[i]->name, name) == 0) {
            return sc->symbols[i];
        }
    }
    return NULL;
}

Symbol *symtab_lookup(SymbolTable *st, const char *name) {
    if (!st || !name) return NULL;
    for (Scope *sc = st->current_scope; sc != NULL; sc = sc->parent) {
        for (int i = 0; i < sc->count; i++) {
            if (strcmp(sc->symbols[i]->name, name) == 0) {
                return sc->symbols[i];
            }
        }
    }
    return NULL;
}

Symbol *symtab_add(SymbolTable *st, const char *name, DataType type, int line, int col) {
    if (!st || !st->current_scope || !name) return NULL;
    Scope *sc = st->current_scope;

    Symbol *sym = (Symbol *)malloc(sizeof(Symbol));
    sym->name = my_strdup(name);
    sym->type = type;
    sym->scope_depth = sc->scope_depth;
    sym->local_slot = st->next_slot++;
    if (st->next_slot > st->total_slots) {
        st->total_slots = st->next_slot;
    }
    sym->line = line;
    sym->col = col;

    if (sc->count >= sc->capacity) {
        sc->capacity *= 2;
        sc->symbols = (Symbol **)realloc(sc->symbols, sizeof(Symbol *) * sc->capacity);
    }
    sc->symbols[sc->count++] = sym;
    return sym;
}

static const char *type_to_str(DataType t) {
    switch (t) {
        case TYPE_INT: return "int";
        case TYPE_FLOAT: return "float";
        case TYPE_VOID: return "void";
        default: return "unknown";
    }
}

void symtab_dump(const SymbolTable *st) {
    if (!st) return;
    printf("=== Symbol Table (Current Scope Hierarchy) ===\n");
    int level = 0;
    for (Scope *sc = st->current_scope; sc != NULL; sc = sc->parent) {
        printf("--- Scope Level %d (depth %d, %d symbols) ---\n", level++, sc->scope_depth, sc->count);
        for (int i = 0; i < sc->count; i++) {
            Symbol *s = sc->symbols[i];
            printf("  [%d] %s : %s (slot: %d, declared at line %d, col %d)\n",
                   i, s->name, type_to_str(s->type), s->local_slot, s->line, s->col);
        }
    }
}

#ifndef MINIC_VALUE_H
#define MINIC_VALUE_H

#include <stdint.h>

typedef enum {
    TYPE_UNKNOWN = 0,
    TYPE_INT,
    TYPE_FLOAT,
    TYPE_VOID
} DataType;

typedef union {
    int64_t i;
    double f;
} Value;

#endif

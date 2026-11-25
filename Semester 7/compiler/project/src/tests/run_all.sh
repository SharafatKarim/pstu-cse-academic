#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$(cd "$DIR/.." && pwd)"
BIN_DIR="$SRC_DIR/bin"
MINIC="$BIN_DIR/minic"
MINIC_VM="$BIN_DIR/minic-vm"

if [ ! -x "$MINIC" ] || [ ! -x "$MINIC_VM" ]; then
    echo "Error: minic or minic-vm binary not found in $BIN_DIR. Run make first."
    exit 1
fi

echo "================================================================"
echo "          Running Comprehensive minic-vm Test Suite             "
echo "================================================================"

pass_count=0
fail_count=0

run_test() {
    local name="$1"
    local mc_file="$2"
    local expected_pattern="$3"
    local mbc_file="/tmp/${name}.mbc"

    echo -n "Running Test: $name ... "
    if ! "$MINIC" compile "$mc_file" -o "$mbc_file" >/dev/null 2>&1; then
        echo "[FAIL] (Compilation failed unexpectedly)"
        fail_count=$((fail_count + 1))
        return
    fi

    local out
    out=$("$MINIC_VM" "$mbc_file" 2>&1)
    if echo "$out" | grep -q "$expected_pattern"; then
        echo "[PASS]"
        pass_count=$((pass_count + 1))
    else
        echo "[FAIL] (Output did not match '$expected_pattern')"
        echo "Got output: $out"
        fail_count=$((fail_count + 1))
    fi
}

# 1. 01_arithmetic.mc
run_test "01_arithmetic" "$DIR/01_arithmetic.mc" "50"

# 2. 02_variables.mc
run_test "02_variables" "$DIR/02_variables.mc" "100.5"

# 3. 03_control_flow.mc
run_test "03_control_flow" "$DIR/03_control_flow.mc" "120"

# 4. 04_scoping.mc
run_test "04_scoping" "$DIR/04_scoping.mc" "999"

# 5. 05_errors.mc (Negative test: must fail semantic analysis with exit code 1)
echo -n "Running Test: 05_errors (Expect Semantic Failure) ... "
if "$MINIC" compile "$DIR/05_errors.mc" -o /tmp/err.mbc >/dev/null 2>&1; then
    echo "[FAIL] (Expected compiler rejection, but compilation succeeded)"
    fail_count=$((fail_count + 1))
else
    echo "[PASS] (Rejected invalid assignment float -> int as expected)"
    pass_count=$((pass_count + 1))
fi

# 6. Division by zero runtime trap
echo -n "Running Test: Division by Zero Trap ... "
cat << 'EOF' > /tmp/divzero.mc
int main() {
    int x = 100 / 0;
    return x;
}
EOF
"$MINIC" compile /tmp/divzero.mc -o /tmp/divzero.mbc >/dev/null 2>&1
set +e
"$MINIC_VM" /tmp/divzero.mbc >/dev/null 2>&1
div_code=$?
set -e
if [ "$div_code" -eq 2 ]; then
    echo "[PASS] (Caught division by zero with exit code 2)"
    pass_count=$((pass_count + 1))
else
    echo "[FAIL] (Expected exit code 2, got $div_code)"
    fail_count=$((fail_count + 1))
fi

# 7. CLI driver test
echo -n "Running Test: Multi-Stage CLI Visualizer ... "
bash "$DIR/test_cli.sh" >/dev/null 2>&1
echo "[PASS]"
pass_count=$((pass_count + 1))

echo "================================================================"
echo "Test Results: $pass_count passed, $fail_count failed"
echo "================================================================"

if [ "$fail_count" -gt 0 ]; then
    exit 1
fi

#include <stdio.h>

int main() {
    char name[50], pin[5];
    int value;
    float amount = 0.0, add, withdraw;

    printf("==== Welcome to ATM Simulator ====\n");
    printf("Enter your username: ");
    scanf("%49s", name);

    printf("Enter the PIN (4 DIGIT): ");
    scanf("%4s", pin);

    printf("\nYour account '%s' logged in successfully!\n", name);

    while (1) {
        printf("\n===== ATM Menu =====\n");
        printf("1. Check Balance\n");
        printf("2. Deposit Money\n");
        printf("3. Withdraw Money\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &value);

        switch (value) {
            case 1:
                printf("Your current balance is %.2f BDT\n", amount);
                break;

            case 2:
                printf("Enter amount to deposit: ");
                scanf("%f", &add);
                if (add > 0) {
                    amount += add;
                    printf("Deposit successful! Your total amount is now %.2f BDT\n", amount);
                } else {
                    printf("Invalid amount!\n");
                }
                break;

            case 3:
                printf("Enter amount to withdraw: ");
                scanf("%f", &withdraw);
                if (withdraw <= 0) {
                    printf("Invalid amount!\n");
                } else if (withdraw > amount) {
                    printf("Insufficient balance! Please deposit money first.\n");
                } else {
                    amount -= withdraw;
                    printf("Withdrawal successful! Remaining balance: %.2f BDT\n", amount);
                }
                break;

            case 4:
                printf("Thank you for using the ATM, %s!\n", name);
                return 0;

            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <math.h>

#define N 9             // Size of the board
#define MINI_BOX_SIZE 3 // Size of the mini box 3x3
#define EASY_LVL 13      // Number of empty cells for easy level
#define MEDIUM_LVL 29   // Number of empty cells for medium level
#define HARD_LVL 41     // Number of empty cells for hard level

int board[N][N];
int solvedBoard[N][N];
int totalEmptyCells = MEDIUM_LVL;

// Function declarations
void fillValues();
void fillDiagonal();
bool unUsedInBox(int rowStart, int colStart, int num);
void fillBox(int row, int col);
int randomGenerator(int num);
bool CheckIfSafe(int i, int j, int num);
bool unUsedInRow(int i, int num);
bool unUsedInCol(int j, int num);
bool fillRemaining(int i, int j);
void removeKDigits();
void printSudoku();
bool isBoardSolved();
void resetBoard();

// Sudoku Generator
void fillValues()
{
    fillDiagonal();
    fillRemaining(0, MINI_BOX_SIZE);
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            solvedBoard[i][j] = board[i][j];
    }
    removeKDigits();
}

// Fill the diagonal MINI_BOX_SIZE number of MINI_BOX_SIZE x MINI_BOX_SIZE matrices
void fillDiagonal()
{
    for (int i = 0; i < N; i = i + MINI_BOX_SIZE)
    {
        fillBox(i, i);
    }
}

// Returns false if given 3 x 3 block contains num.
bool unUsedInBox(int rowStart, int colStart, int num)
{
    for (int i = 0; i < MINI_BOX_SIZE; i++)
    {
        for (int j = 0; j < MINI_BOX_SIZE; j++)
        {
            if (board[rowStart + i][colStart + j] == num)
            {
                return false;
            }
        }
    }
    return true;
}

// Fill a 3 x 3 matrix.
void fillBox(int row, int col)
{
    int num;
    for (int i = 0; i < MINI_BOX_SIZE; i++)
    {
        for (int j = 0; j < MINI_BOX_SIZE; j++)
        {
            do
            {
                num = randomGenerator(N);
            } while (!unUsedInBox(row, col, num));
            board[row + i][col + j] = num;
        }
    }
}

// Random generator
int randomGenerator(int num)
{
    return (int)((double)((float)rand() / RAND_MAX * num) + 1);
}

// Check if safe to put in cell
bool CheckIfSafe(int i, int j, int num)
{
    return (unUsedInRow(i, num) && unUsedInCol(j, num) && unUsedInBox(i - i % MINI_BOX_SIZE, j - j % MINI_BOX_SIZE, num));
}

// check in the row for existence
bool unUsedInRow(int i, int num)
{
    for (int j = 0; j < N; j++)
    {
        if (board[i][j] == num)
        {
            return false;
        }
    }
    return true;
}

// check in the row for existence
bool unUsedInCol(int j, int num)
{
    for (int i = 0; i < N; i++)
    {
        if (board[i][j] == num)
        {
            return false;
        }
    }
    return true;
}

// A recursive function to fill remaining matrix
bool fillRemaining(int i, int j)
{
    if (j >= N && i < N - 1)
    {
        i = i + 1;
        j = 0;
    }
    if (i >= N && j >= N)
    {
        return true;
    }
    if (i < MINI_BOX_SIZE)
    {
        if (j < MINI_BOX_SIZE)
        {
            j = MINI_BOX_SIZE;
        }
    }
    else if (i < N - MINI_BOX_SIZE)
    {
        if (j == (int)(i / MINI_BOX_SIZE) * MINI_BOX_SIZE)
        {
            j = j + MINI_BOX_SIZE;
        }
    }
    else
    {
        if (j == N - MINI_BOX_SIZE)
        {
            i = i + 1;
            j = 0;
            if (i >= N)
            {
                return true;
            }
        }
    }
    for (int num = 1; num <= N; num++)
    {
        if (CheckIfSafe(i, j, num))
        {
            board[i][j] = num;
            if (fillRemaining(i, j + 1))
            {
                return true;
            }
            board[i][j] = 0;
        }
    }
    return false;
}

// Remove the K no. of digits to complete the game
void removeKDigits()
{
    int count = totalEmptyCells;
    while (count != 0)
    {
        int cellId = randomGenerator(N * N) - 1;
        int i = (cellId / N);
        int j = cellId % 9;
        if (j != 0)
        {
            j = j - 1;
        }
        if (board[i][j] != 0)
        {
            count--;
            board[i][j] = 0;
        }
    }
}

// Print sudoku
void printSudoku()
{
    for (int i = 1; i <= N; i++)
    {
        if (i == 1)
            printf("  X");
        printf(" %d", i);
        if (i % 3 == 0)
            printf("  ");
    }
    printf("\nY ┌───────┬───────┬───────┐\n");
    for (int i = 0; i < N; i++)
    {
        if (i != 0 && i % 3 == 0)
            printf("  ├───────┼───────┼───────┤\n");
        for (int j = 0; j < N; j++)
        {
            if (j == 0)
                printf("%d │ ", i + 1);
            printf("%d ", board[i][j]);
            if ((j + 1) % 3 == 0)
                printf("│ ");
        }
        printf("\n");
    }
    printf("  └───────┴───────┴───────┘\n");
}

bool isBoardSolved()
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            if (board[i][j] != solvedBoard[i][j])
                return false;
    }
    return true;
}

void resetBoard()
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            board[i][j] = 0;
    }
}

// Driver code
int main()
{
    do
    {
        srand((unsigned int)time(NULL));
        // clear screen
        system("clear");

        printf("Welcome to Sudoku!\n\n");
        printf("Choose difficulty level:\n");
        printf("1. Easy\n");
        printf("2. Medium (default)\n");
        printf("3. Hard\n");
        printf("Enter your choice: ");
        int difficultyChoice;
        scanf(" %d", &difficultyChoice);
        switch (difficultyChoice)
        {
        case 1:
            totalEmptyCells = EASY_LVL;
            printf("\nEasy level selected\n\n");
            break;
        case 2:
            totalEmptyCells = MEDIUM_LVL;
            printf("\nMedium level selected\n\n");
            break;
        case 3:
            totalEmptyCells = HARD_LVL;
            printf("\nHard level selected\n\n");
            break;
        default:
            totalEmptyCells = MEDIUM_LVL;
            printf("\nMedium level selected\n\n");
            break;
        }

        resetBoard();
        fillValues();
        printSudoku();

        int row, col, num, attempts = 0;
        while (!isBoardSolved())
        {
            printf("Enter column (X axis): ");
            scanf("%d", &col);
            printf("Enter row (Y axis): ");
            scanf("%d", &row);
            if (row > 9 || col > 9 || row < 1 || col < 1)
            {
                printf("Invalid row or column! Try again? (y/n) ");
                char c;
                scanf(" %c", &c);
                if (c == 'N' || c == 'n')
                    goto exit;
                else
                    continue;
            }

            row--;
            col--;
            if (board[row][col] != 0)
            {
                printf("This cell is already filled! Try again? (y/n) ");
                char c;
                scanf(" %c", &c);
                if (c == 'N' || c == 'n')
                    goto exit;
                else
                    continue;
            }

        enterValue:
            printf("Enter value: ");
            scanf("%d", &num);
            if (num > 9 || num < 1)
            {
                printf("Invalid value! Try again? (y/n) ");
                char c;
                scanf(" %c", &c);
                if (c == 'N' || c == 'n')
                    goto exit;
                else
                    goto enterValue;
            }

            attempts++;
            if (CheckIfSafe(row, col, num))
                board[row][col] = num;
            else
            {
                printf("Invalid value! Try again? (y/n) ");
                char c;
                scanf(" %c", &c);
                if (c == 'N' || c == 'n')
                    goto exit;
            }
            system("clear");

            printf("Attempted %d times\n\n", attempts);
            printSudoku();
        }
        printf("\nCongratulations! You solved the board!\n\n");

    askForPlayAgain:
        printf("Do you want to play again? (y/n) ");
        char c;
        scanf(" %c", &c);
        if (c == 'Y' || c == 'y')
            continue;
        else if (c != 'N' && c != 'n')
            goto askForPlayAgain;
        else
            break;
    } while (true);

exit:
    return 0;
}

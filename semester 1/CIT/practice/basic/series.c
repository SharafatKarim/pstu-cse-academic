#include <stdio.h>
#include <string.h>

#define MAX_STUDENTS 100
#define MAX_NAME_LEN 50
#define MAX_SUBJECTS 5

// Define a structure for students
typedef struct {
    int student_id;
    char name[MAX_NAME_LEN];
    float grades[MAX_SUBJECTS];
} Student;

Student students[MAX_STUDENTS];
int student_count = 0;

// Function to add a new student record
void add_student() {
    if (student_count >= MAX_STUDENTS) {
        printf("Maximum student limit reached.\n");
        return;
    }

    Student new_student;
    printf("Enter student ID: ");
    scanf("%d", &new_student.student_id);

    printf("Enter student name: ");
    scanf("%s", new_student.name);

    // Add grades for each subject
    for (int i = 0; i < MAX_SUBJECTS; i++) {
        printf("Enter grade for subject %d: ", i + 1);
        scanf("%f", &new_student.grades[i]);
    }

    // Add the new student to the students array
    students[student_count] = new_student;
    student_count++;

    printf("Student added successfully.\n");
}

// Function to display all student records
void view_students() {
    if (student_count == 0) {
        printf("No students to display.\n");
        return;
    }

    for (int i = 0; i < student_count; i++) {
        printf("\nStudent ID: %d\n", students[i].student_id);
        printf("Name: %s\n", students[i].name);
        printf("Grades:\n");
        for (int j = 0; j < MAX_SUBJECTS; j++) {
            printf("  Subject %d: %.2f\n", j + 1, students[i].grades[j]);
        }
    }
}

// Function to search for a student by ID
void search_student() {
    int student_id;
    printf("Enter student ID to search: ");
    scanf("%d", &student_id);

    for (int i = 0; i < student_count; i++) {
        if (students[i].student_id == student_id) {
            printf("\nStudent ID: %d\n", students[i].student_id);
            printf("Name: %s\n", students[i].name);
            printf("Grades:\n");
            for (int j = 0; j < MAX_SUBJECTS; j++) {
                printf("  Subject %d: %.2f\n", j + 1, students[i].grades[j]);
            }
            return;
        }
    }

    printf("Student ID not found.\n");
}

// Function to save student data to a file
void save_data() {
    FILE *file = fopen("students_data.txt", "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    // Save student count and student data
    fwrite(&student_count, sizeof(int), 1, file);
    fwrite(students, sizeof(Student), student_count, file);

    fclose(file);
    printf("Data saved successfully.\n");
}

// Function to load student data from a file
void load_data() {
    FILE *file = fopen("students_data.txt", "r");
    if (file == NULL) {
        printf("No existing data found.\n");
        return;
    }

    // Load student count and student data
    fread(&student_count, sizeof(int), 1, file);
    fread(students, sizeof(Student), student_count, file);

    fclose(file);
    printf("Data loaded successfully.\n");
}

// Main function and menu
void menu() {
    int choice;

    while (1) {
        printf("\nResult Management System\n");
        printf("1. Add Student\n");
        printf("2. View All Students\n");
        printf("3. Search Student\n");
        printf("4. Save Data\n");
        printf("5. Load Data\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                add_student();
                break;
            case 2:
                view_students();
                break;
            case 3:
                search_student();
                break;
            case 4:
                save_data();
                break;
            case 5:
                load_data();
                break;
            case 6:
                return;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
}

int main() {
    // Load data from file if exists
    load_data();

    // Present the menu to the user
    menu();
    // Save data before exiting
    save_data();

    return 0;
}

#include <stdio.h>
#include <pthread.h>


void *check_number(void *arg) {
    int num = *((int *) arg);
    if (num % 2 == 0) {
        printf("%d is even\n", num);
    } else {
        printf("%d is odd\n", num);
    }
    pthread_exit(NULL);
}


void *check_year(void *arg) {
    int year = *((int *) arg);
	
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        printf("%d is a leap year\n", year);
    } else {
        printf("%d is not a leap year\n", year);
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t tid[2];
    int num = 28;
    int year = 1996;

    
    pthread_create(&tid[0], NULL, check_number, &num);
    pthread_create(&tid[1], NULL, check_year, &year);

    
    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);

    return 0;
}


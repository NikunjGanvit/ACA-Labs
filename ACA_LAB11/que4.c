#include <stdio.h>
#include "header.h"

int main()
{
    int sum = 0, *final_sum, id, N, i, shmid, nproc = 4;
    int locked = 1, unlocked = 0, *lock;

    lock = (int *)shared(sizeof(int), &shmid);
    final_sum = (int *)shared(sizeof(sum), &i);
    *final_sum = 0;

    printf(" Enter N : ");
    scanf("%d", &N); // suppose user enters 6
    printf("\n");

    // Manually set the lock value to unlocked (0) initially
    *lock = unlocked;

    id = process_fork(nproc);

    // calculating sum using loop splitting
    for (i = id; i <= N; i += nproc)
        sum = sum + i;

    // final sum through mutual exclusion
    spin_lock(lock);
    *final_sum = sum + *final_sum;

    printf("id = %d sum = %d \n", id, sum);

    spin_unlock(lock);

    process_join(4, id);

    printf("\n *******************************\n");
    printf("\nSum: %d\n", *final_sum);

    return 0;
}

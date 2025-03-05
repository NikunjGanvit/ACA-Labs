#include <stdio.h>
#include "header.h"

int main()
{
    int *a, *next_index, i, id, k = 4, nproc = 3, shmid;
    int locked = 1, unlocked = 0, *lock;

    next_index = (int *)shared(sizeof(int), &shmid);
    *next_index = 0;

    a = (int *)shared(sizeof(int) * 10, &shmid);

    for (i = 0; i < 10; i++)
    {
        printf("Enter a[%d] : ", i + 1);
        scanf("%d", &a[i]);  
    }

    lock = (int *)shared(sizeof(int), &shmid);
    *lock = unlocked;  // Initialize the lock to unlocked state

    id = process_fork(nproc);

    while (1)
    {
        spin_lock(lock);
        i = *next_index;
        *next_index = *next_index + 1;
        spin_unlock(lock);

        if (i < 10)
        {
            a[i] = a[i] + k;  // Add constant k to the element
        }
        else
        {
            break;
        }
    }
    process_join(nproc, id);

    for (i = 0; i < 10; i++)
    {
        printf("%d ", a[i]);
    }

    return 0;
}

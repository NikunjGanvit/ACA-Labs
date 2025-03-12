// 2. WAP to Calculate standard deviation with help of barrier

# include <stdio.h>
# include <math.h>
# include "header.h"

int main()
{
    int shmid, id, i, locked = 1, unlocked = 0, *lock, nproc, *bar;
    float *average, *deviation, sum = 0.0, a[20];
    lock = (int *)shared (sizeof (int), &shmid);
    deviation = (float *) shared (sizeof (float), &shmid);
    bar = (int *) shared (sizeof (int) * 4, &shmid);
    average = (float *) shared (sizeof (float), &shmid);
    * average = 0.0;
    * deviation = 0.0;
    printf("\n Enter no  of Process : ");
    scanf("%d",&nproc);

    for (i = 0; i < 20; i++)
    {
        a[i] = i;
    }

    spin_lock_init(lock, &unlocked);
    barrier_init(bar, nproc);
    printf("\n");

    id = process_fork (nproc);

    for(i = id; i < 20; i++)
    {
        sum = sum + a[i];
    }
    spin_lock(lock);
    *average = *average + sum / 20;
    spin_unlock(lock);

    barrier(bar);

    sum = 0.0;

    for(i = id; i < 20; i += nproc)
        sum = sum + fabs(a[i] - *average);
    
    spin_lock(lock);
    *deviation = *deviation + sum / 20;
    spin_unlock(lock);
    process_join(nproc, id);

    // Final output of the results
    if (id == 0) 
    {
        printf("\nAverage: %f", *average);
        printf("\nStandard Deviation: %f\n", sqrt(*deviation));
    }



    return 0;
}
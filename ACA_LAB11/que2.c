// 2. WAP to add constant to array using self-scheduling.


#include<stdio.h>
#include "header.h"

int main()
{
    int *a, *next_index, i, id, k=4, nproc=3, shmid;
    next_index = (int *)shared( sizeof(int),&shmid);
    *next_index = 0;

    a = (int *)shared( sizeof(int)*1000, &shmid);
    
    for(i = 0; i < 1000; i++)
    {
        a[i] = i+1;
        // printf("enter a[%d] : ", i+1);
        // scanf("%d", &*(a+i));
    }
    id = process_fork(nproc);
    while(1)
    {
        i = *next_index;
        *next_index = *next_index + 1;
        
        if (i < 1000)
        {
            *(a+i) = *(a+i) + k;
        }
        else
        {
            break;
        }
    }
    process_join(nproc, id);
    for (i = 0; i < 1000; i++)
    {
        printf("%d \n", *(a + i));
    }

    return 0;
}
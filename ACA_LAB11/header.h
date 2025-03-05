#ifndef HEADER_H // If HEADER_H is not defined
#define HEADER_H // Define HEADER_H
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/ipc.h> // For IPC_PRIVATE and shmget()
#include <sys/shm.h> // For shmget(), shmat(), and related functions
#include <sys/sem.h> // For semop(), sembuf, and semaphores

int process_fork(int nproc)
{
    int j;
    for (j = 1; j < nproc; j++)
    {
        pid_t pid = fork();

        if (pid == -1)
        {
            perror("Fork failed");
            exit(1);
        }
        if (pid == 0)
        {
            // printf("Child process %d created\n", j);
            return j;
        }
    }
    return 0;
}

void process_join(int nproc, int id)
{
    if (id == 0)
    {
        for (int i = 0; i < nproc; i++)
        {
            wait(NULL);
        }
        printf("All Child Processes have finished.\n");
    }
    else  // Child processes exit immediately after completing its work
    {
        exit(0);
    }
}

char* shared(int size, int *shmid)
{
    *shmid = shmget(IPC_PRIVATE, size, 0666 | IPC_CREAT);
    if (*shmid == -1)
    {
        perror("shmget failed");
        return NULL; 
    }

    char *shm_ptr = (char*)shmat(*shmid, 0, 0);
    if (shm_ptr == (char*)-1)
    {
        perror("shmat failed");
        return NULL;
    }
    return shm_ptr;
}

void spin_lock(int *lock)
{
    struct sembuf operations;
    operations.sem_num = 0;
    operations.sem_op = -1;
    operations.sem_flg = 0;
    semop(*lock, &operations, 1);
}

void spin_unlock(int *lock)
{
    struct sembuf operations;
    operations.sem_num = 0;
    operations.sem_op = 1;
    operations.sem_flg = 0;

    semop(*lock, &operations, 1);
}

#endif // HEADER_H // End the guard

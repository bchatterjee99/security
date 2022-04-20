#include <stdio.h>
#include <string.h>
#include <unistd.h>


// %p ta virtual address dey:
// alada process er jonno same virtual addres maps to different physical address
void test1()
{
    char a[30] = "hello world extra string";

    int pid = fork();
    if(pid == 0)
    {
	a[0] = 'f';
	printf("child: %p: %3d %c\n", a, a[0], a[0]);
	
    }
    else
    {
	sleep(1);
	printf("parent: %p: %3d %c\n", a, a[0], a[0]);
    }
}


// array overflow
void test2()
{
    char source[30] = "hello world extra string";
    // char c[20] = "adsfasdfsadfad";
    char dest[10];
    strcpy(dest, source);

    printf("dest:\n");
    for(int i=0; i<10; i++)
    {
	printf("%p: %3d %c\n", dest+i, dest[i], dest[i]);
    }
    printf("\n\n");


    printf("source:\n");
    for(int i=0; i<30; i++)
    {
	printf("%p: %3d %c\n", source+i, source[i], source[i]);
    }
}

int main()
{
    
    test2();
    return 0;
}

#include <stdio.h>
int main()
{
    float x,y; scanf("%f%f",&x,&y);
    if(x==0 && y==0)printf("Origem");else if (y==0)printf("Eixo X");else if (x==0)printf("Eixo Y");else if(x>0 && y>0)printf("Q1");else if(x<0 && y>0)
        printf("Q2");else if(x<0 && y<0)printf("Q3");else if(x>0 && y<0)printf("Q4");
}

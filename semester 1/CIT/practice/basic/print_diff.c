#include<stdio.h>
#include<math.h>
int main()
{
    float A,B;
    double X,X1,X2,X3;
    scanf("%f %f",&A,&B);
    X = A/B;
    X1 = floor(X);
    X2 = ceil(X);
    X3 = round(X);
    printf("floor %.0f / %.0f = %.0lf\n",A,B, X1);
    printf("ceil %.0f / %.0f = %.0lf\n",A,B, X2);
    printf("round %.0f / %.0f = %.0lf\n",A,B, X3);
}

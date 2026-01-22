#include <stdio.h>

int main(){
    char myName[32];
    char dummyChar[512];
    int anInt = 0;
    double aDouble = 0.00;
    int myInit= 0;
    char middleIntial;

    //1) input a string
    printf("Please enter you nmae ");
    scanf("%32s", myName);
    printf("you entered %s\n", myName);


    //2) input a string with space
    printf("Please enter you name again ");
    fgets(myName, 32, stdin);
    printf("you entered %s\n", myName);

    //3) input a integer
    printf("Please enter you integer ");
    scanf("%d", &anInt);
    printf("you entered %d\n", anInt);

    printf("Please enter you integer ");
    scanf("%d", &anInt);
    fgets(dummyChar, 512, stdin);
    printf("you entered %d\n", anInt);

    //4) input float
    printf("Please enter you double ");
    scanf("%lf", &aDouble);
    fgets(dummyChar, 512, stdin);
    printf("you entered %lf\n", aDouble);

    //5) input singal char
    printf("Please enter you simbol ");
    scanf("%c", &middleIntial);
    printf("you entered %c\n", middleIntial);

    printf("program is ending have a nic day");
    return 0;
}
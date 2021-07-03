#include <bits/stdc++.h>
using namespace std;

int main()
{
    long long int random;
    char a[64];
    FILE *fr;
    fr = fopen("inputs.txt", "w+");
    //generate 1 lakh pairs
    for (int n=0 ; n < 100000; n++)
    {
        for (int i = 0; i < 64; i++)
        {
            random = rand() % 2;
            //convert int to char
            random += 48; 
            a[i] = random;
        }
        for (int i = 0; i < 64; i++)
            fprintf(fr, "%c", a[i]);
        fprintf(fr, "\n");

    }
}
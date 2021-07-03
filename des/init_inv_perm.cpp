#include <iostream>

using namespace std;

int main() {
    char a[64],b[64]; int p[64];
    for (int i=0;i<64;i++) cin>>a[i];
    for (int i=0;i<64;i++) cin>>p[i];
    for (int i=0;i<64;i++) b[p[i]-1]=a[i];
    for (int i=0;i<64;i++) cout<<b[i];
    return 0;
}
#include <iostream>
#include <array>

using namespace std;

void print(int A[][3],int N, int M)
{
  for (int R = 0; R < N; R++)
    for (int C = 0; C < M; C++)
       cout << A[R][C];
}
//FUNCTION TO FIND THE SUM OF TWO MATRICES
//void Addition(int A[][20], int B[][20],int N, int M)
//{
//  for (int R=0;R<N;R++)
//    for(int C=0;C<M;C++)
//      C[R][C]=A[R][C]+B[R][C];
//}
//FUNCTION TO FIND OUT TRANSPOSE OF A MATRIX A
void Transpose(int A[][20], int B[][20],int N, int M)
{
  for(int R=0;R<N;R++)
    for(int C=0;C<M;C++)
       B[R][C]=A[C][R];
}



// type name [elements];
int arr[] = { 16, 2, 77, 40, 12071 }; // Array
array<int,5> myarray {16, 2, 77, 40, 12071 }; // array from library
int i, result=0;
// auto dataSize = std::size(arr);
// dataSize == 4

int main()
{
    //std::cout << "Hello World!" << std::endl;
    for(i = 0; i<5; i++){
        result = result + arr[i];
    }
    std::cout << result << std::endl;
    result = 0;
    for(i = 0; i<myarray.size(); i++){
        result = result + myarray[i];
    }
    std::cout << result << std::endl;

    // MAtrix Array
    //int arr[4][3] ={{12, 29, 11},
    //                {25, 25, 13},
    //                {24, 64, 67},
    //                {11, 18, 14}};
    //print(arr,4,3);
    return 0;
}
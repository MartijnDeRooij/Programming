// The problem: (x,y), (x, y2), (x2,y), (x2,y2)
// x != x2 and y != y2

// Psuedo Code https://www.youtube.com/watch?v=EuPSibuIKIg
/*
.1  .3  .5
.2  .4  .6
// (O()N^2 * log(n)) -> O(N^2) by ordering map with some sort of hash map Space O(N)
unorderd_map<pair<int,int>,int> count; // count pair y-pairs like this O(log(n))
for(Point p: points){
    for(Point p_above : points){ // 2 4 6 if second point
        if(p.x == p_above.x && p.y < p_above.y){ // 1 3 5
            //.. PAir of point where one is above the other. 
            // p.y and p_above.y
            pair<int,int> pair_y {p.y, p_above.y}; // Ordering mathers here. because then you count the vertical lines correctly
            Answer += count[pair_y]; // answer +=1 +=2
            count[make_pair(p.y, p.above)]++; =12 to 3
        }
    }
}
return answer;
*/

// rectangalurarray = [[1,1,1],
//                    [1,1,1],
//                    ]
#include <iostream>

int main()
{
    std::cout << "Hello World!" << std::endl;
}
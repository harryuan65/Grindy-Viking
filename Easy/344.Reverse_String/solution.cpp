#include <iostream>
#include <vector>
using namespace std;

class Solution {
   public:
    void solution(vector<char>& s) {
        int ei = s.size() - 1;
        int si = 0;

        while (si < ei) {
            char tmp = s[si];
            s[si] = s[ei];
            s[ei] = tmp;
            si++;
            ei--;
        }
    }
};

int main() {
    Solution a;
    vector<char> s = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd'};
    a.solution(s);
    for (char c : s) {
        cout << c;
    }
    cout << endl;
}
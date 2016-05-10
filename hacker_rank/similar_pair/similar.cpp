#include <map>
#include <set>
#include <list>
#include <cmath>
#include <queue>
#include <stack>
#include <bitset>
#include <vector>
#include <cstdio>
#include <string>
#include <sstream>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <algorithm>
using namespace std;
#define PB push_back
#define MP make_pair
#define SZ(v) ((int)(v).size())
#define abs(x) ((x) > 0 ? (x) : -(x))
#define FOREACH(e,x) for(__typeof(x.begin()) e=x.begin();e!=x.end();++e)
typedef long long LL;

const int maxn = 100005;
struct BinaryIndexTree {
  int N;
  int C[maxn];

  void init(int N) {
    this->N = N;
    memset(C, 0, sizeof(C));
  }

  int lowbit(int x) {
    return x & (-x);
  }

  void add(int x, int num) {
    // cout << "add(" << x << ", " << num << ")" << endl;
    for (int i = x; i <= N; i += lowbit(i))
      C[i] += num;
  }

  int sum(int x) {
    // cout << "sum(" << x << ")" << endl;
    int ret = 0;
    for (int i = x; i > 0; i -= lowbit(i))
      ret += C[i];
    return ret;
  }
}bit;

int n, T;
LL res;
int deg[maxn];
vector<int> adj[maxn];

void dfs(int u) {
  // cout << "dfs(" << u << ")" << endl;
  res += bit.sum(min(n, u + T)) - bit.sum(max(1, u - T) - 1);
  // cout << "res = " << res << endl;
  bit.add(u, 1);

  for (int i = 0; i < adj[u].size(); i++) {
    // cout << "adj[" << u << "][" << i << "] = " << adj[u][i] << endl;
    int v = adj[u][i];
    dfs(v);
  }
  bit.add(u, -1);
}

int main() {
  scanf("%d%d", &n, &T);

  bit.init(n);
  memset(deg, 0, sizeof(deg));
  for (int i = 1; i < n; i++) {
    int a, b;
    scanf("%d%d", &a, &b);
    adj[a].PB(b);
    deg[b]++;
  }
  int root = 0;
  for (int i = 1; i <= n; i++) {
    if (deg[i] == 0) {
      root = i;
      break;
    }
  }

  res = 0;
  dfs(root);
  cout << res << endl;
  return 0;
}

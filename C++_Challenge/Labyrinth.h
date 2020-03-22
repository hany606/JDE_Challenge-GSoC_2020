#ifndef LABYRINTH_G
#define LABYRINTH_G

#include <string>
#include <vector>
#include <tuple>


using namespace std;

typedef struct solution
{
    int length;
    vector<cell> path;
}solution;

typedef struct cell
{
    int x;
    int y;
}cell;

class Labyrinth
{
    public:
        Labyrinth(string,string);

        vector<vector<char>> getMap();
        solution getLongestSolution();
        vector<solution> getlAllSolutions();
        void solve();



    private:
        void readFile(string);
        void writeFile(string);
        void searchDFS(cell);
        int neighbours_moves[4][2] = {{1,0},{0,1},{-1,0},{0,-1}};
        string in_file_name;
        string out_file_name;
        
        vector<vector<char>> map;
        vector<solution> solutions;
        vector<cell> getNeighbours(cell);


};


#endif
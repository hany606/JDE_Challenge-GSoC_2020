#include "Labyrinth.h"
#include <tuple>

using namespace std;


Labyrinth::Labyrinth(string in_file_name, string out_file_name): 
    in_file_name(in_file_name), out_file_name(out_file_name)
{
}

void Labyrinth::readFile(string file_name)
{
    
}

void Labyrinth::writeFile(string file_name)
{

}

vector<vector<char>> Labyrinth::getMap()
{

}

solution Labyrinth::getLongestSolution()
{
    
}

vector<solution> Labyrinth::getlAllSolutions()
{
    
}

void Labyrinth::searchDFS(cell root)
{

    // if it is already visited return (exist in the root path)
    // Visit the root
    // Add the current cell to the path
    // Get the neighbours and make them as children
    vector<cell> neighbours = Labyrinth::getNeighbours(root);
    for(int i = 0; i < neighbours.size(); i++)
    {
        searchDFS(neighbours[i]);
    }
}

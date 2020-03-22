#include "Labyrinth.h"
#include <tuple>
#include <iostream>
#include <fstream>


using namespace std;


Labyrinth::Labyrinth(string in_file_name, string out_file_name): 
    in_file_name(in_file_name), out_file_name(out_file_name)
{
    width = 0;
    height = 0;
}

void Labyrinth::readFile(string file_name)
{
    ifstream fin (file_name);
    if(!fin.is_open()){
        printf("File %s does not exist\n", file_name.c_str());
        return;
    }

    string row;
    while(getline(fin, row)){
        width = row.length();
        vector<char> row_vector;

        for(int i = 0; i < width; i++)
            row_vector.push_back(row[i]);
        
        map.push_back(row_vector);
        height++;
    }
}

void Labyrinth::writeFile(string file_name)
{

    ofstream fout (file_name);
    if(!fout.is_open()){
        printf("File %s does not exist\n", file_name.c_str());
        return;
    }

    solution final_solution = getLongestSolution();

    for(int i = 0; i < final_solution.length; i++){
        map[final_solution.path[i].y][final_solution.path[i].x] = char(i + 1 + '0');
    }
    // Write the soltion
    for(int y = 0; y < height; y++){
        for(int x = 0; x < width; x++){
            fout<<map[y][x];
        }
        fout<<"\n";
    }


}

vector<vector<char>> Labyrinth::getMap()
{

}

solution Labyrinth::getLongestSolution()
{
    int mx_index = 0;
    int mx_length = 0;
    for(int i = 0; i < solutions.size(); i++){
        if(mx_length < solutions[i].length){
            mx_length = solutions[i].length;
            mx_index = i;
        }
    }
    return solutions[mx_index];
    
}

vector<solution> Labyrinth::getlAllSolutions()
{
    
}
bool Labyrinth::visitedCell(cell c, solution sol)
{
    for(int i = 0; i < sol.length; i++)
        if(c.x == sol.path[i].x && c.y == sol.path[i].y)
            return true;
    
    return false;
}

bool Labyrinth::availableCell(cell c)
{
    if(map[c.y][c.x] == '#')
        return false;
    return true;
}

vector<cell> Labyrinth::getNeighbours(cell root)
{
    vector<cell> neighbours;
    for(int i = 0; i < sizeof(neighbours_moves)/sizeof(neighbours_moves[0]); i++){  // it is flexible with the changing of available movements
        int new_x = root.x + neighbours_moves[i][0];
        int new_y = root.y + neighbours_moves[i][1];
        
        if(new_x < 0 || new_x >= width || new_y < 0 || new_y >= height)
            continue;

        cell new_cell = {new_x, new_y};

        if(!availableCell(new_cell))
            continue;

        neighbours.push_back(new_cell);
    }

    return neighbours;

}

void Labyrinth::searchDFS(cell root, solution sol)
{

    if(!availableCell(root)){
        solutions.push_back(sol);
        return;
    }
    // if it is already visited return (exist in the root path)
    bool visited = visitedCell(root, sol);
    if(visited)
        return;
    // Visit the root
    // Add the current cell to the path
    solution new_sol = sol;
    new_sol.path.push_back(root);
    new_sol.length++;
    // Get the neighbours and make them as children
    vector<cell> neighbours = getNeighbours(root);
    for(int i = 0; i < neighbours.size(); i++)
    {

        searchDFS(neighbours[i],new_sol);

    }
    solutions.push_back(new_sol);
    return;
}


void Labyrinth::solve()
{
    readFile(in_file_name);
    vector<cell> empty_path;
    solution empty_sol = {
        0, empty_path
    };

    // Iterate all over the cells from the first row until find a row that has a space (Wrong for the case of the deadend of the element starting from the 1st row and for example there is another cell that start and end too far)
    // for(int y = 0; y < height; y++){
    //     for(int x = 0; x < width; x++){
            // cell root = {x,y};
            cell root = {6,0};
            // if(!availableCell(root))
            //     continue;
            
            searchDFS(root, empty_sol);
    //     }
    // }
    
    writeFile(out_file_name);
}


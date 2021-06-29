Squarematrix = [[1,0,0,0,0,0],
                [0,1,0,1,1,1],
                [0,0,1,0,1,0],
                [1,1,0,0,1,0],
                [1,0,1,1,0,0],
                [1,0,0,0,0,1],
                ]

def is_border(i, j, matrix):
    if (i == 0) or (i == len(matrix) - 1) or (j == 0) or (j == len(matrix) - 1):
        return True
    return False # Do nothing

def is_outside_matrix(new_i, new_j, matrix):
    if new_i < 0 or new_j < 0 or new_i > len(matrix) - 1 or new_j > len(matrix[0]) - 1:
        return True
    return False

def border_island_key(i,j):
    return '{}{}'.format(i, j)

def rec(i, j, matrix, border_islands): # recurse python passes the actual entity
    # look up left right and down then stick it in. Grabbing all the neighbours:
    steps = [ # Tuples
        (0,1),
        (1,0),
        (0,-1),
        (-1,0),
    ] # look up left right and down

    for (ix, ij) in steps:
        new_i = ix + i
        new_j = ij + j
        if is_outside_matrix(new_i, new_j, matrix):
            continue
        neigh = matrix[new_i][new_j]
        key_border = border_island_key(new_i,new_j)
        if((neigh == 1) and not (key_border in border_islands)):
            border_islands[key_border] = True
            #if not (key_border in border_islands): This is always false
            rec(new_i, new_j, matrix, border_islands)

# Time and space complexity: 
# this a graph problem.
def removeIslands(matrix): # Remove from borthers
    # 1 -> Black
    # 0 -> white
    # Write code here:
    # Adjecency list:
    # key -> []
    # list of edges
    # index -> '00'
    # 30 -> [31, 40]
    # The problem is a depth first search for all edges. 
    border_islands = {} # adjecency list  Keeping track of everything that is a border. 
    # O(n*m)
    for indexi, row in enumerate(matrix): # Enumerate gives index and row gives the row. 
        for indexj, value in enumerate(row):
            # print(indexi)
            # its a border when: indexi
            if(value == 1) and is_border(indexi,indexj,matrix) : # if you find a 1 and a edge then try to find the island not to remove. 
                # here is where you depth first search:
                # To reduce complexity:
                if border_island_key(indexi,indexj) in border_islands:
                    continue
                border_islands[border_island_key(indexi,indexj)] = True
                rec(indexi, indexj, matrix, border_islands)
    print(border_islands)
    # O(n*m)
    for indexi, row in enumerate(matrix): # Enumerate gives index and row gives the row. 
        for indexj, value in enumerate(row):
            if value == 1 and not (border_island_key(indexi,indexj) in border_islands):
                matrix[indexi][indexj] = 0
    # O(n*m + n*m) ->
    # O(n*m)
    return matrix

def main():
    print("hello world!")

if __name__ == "__main__":
    main()
    new_matrix = removeIslands(Squarematrix)
    print(new_matrix)
"""
# Sample output:
SampleOutput = [[1,0,0,0,0,0],
                [0,0,0,1,1,1],
                [0,0,0,0,1,0],
                [1,1,0,0,1,0],
                [1,0,0,0,0,0],
                [1,0,0,0,0,1],
                ]
SampleOutput = [[ , , , , , ],
                [ ,1, , , , ],
                [ , ,1, , , ],
                [ , , , , , ],
                [ , ,1,1, , ],
                [ , , , , , ],
                ]
"""
def diagonal(row,col):
    matrix=[[0]*col for i in range(row)]
    value=1
    for line in range(1, (row + col)):
        start_col=max(0, line - row)
        count = min(line, (col - start_col), row)

        for j in range(0, count):
            matrix[min(row, line) - j -1][start_col + j] = value
            value +=1
            
    return matrix

row =int(input('enter row:'))
col =int(input('enter column:'))
matrix = diagonal(row,col)
for row in matrix:
    print(row)

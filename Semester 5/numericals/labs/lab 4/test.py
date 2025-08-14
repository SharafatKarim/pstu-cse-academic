#Function of matrix printing
def displaymatrix ():
    for a in range (nr):
        for b in range (nc):
            print ("%10.3f" %(matrix[a][b]), end=" ")
        print("\n")

# Taking Matrix Input
matrix=[]
nr=int(input("Enter Number of rows :"))
nc=int(input("Enter Number of coulums :"))
for i in range (nr):
    pseudomatrix = []
    for j in range (nc):
        num= float(input(f"Enter Numbers in Matrix {str(i+1) + str(j+1)} :"))
        pseudomatrix.append(num)
    matrix.append(pseudomatrix)
displaymatrix ()

# #Taking input pivot element
pivotelementrow = int(input("Enter Pivot Element row :"))
pivotelementcolumn = int(input("Enter Pivot Element column :"))


while pivotelementrow > 0 and pivotelementcolumn > 0:
    pivotelementrow -= 1
    pivotelementcolumn-= 1

    #Solving for pivot element
    for p in range (nc):
        pivotelement=(matrix[pivotelementrow][pivotelementcolumn])
        matrix[pivotelementrow][pivotelementcolumn]= (matrix[pivotelementrow][pivotelementcolumn])/pivotelement
        for r in range(nc):
            if r != pivotelementcolumn:
                matrix[pivotelementrow][r]=(matrix[pivotelementrow][r])/pivotelement
        #Solving for pivot value
        for z in range (nr):
            if z != pivotelementrow:
                pivotvalue= matrix[z][pivotelementcolumn]
                for c in range (nc):
                    matrix[z][c]= matrix[z][c]- pivotvalue * matrix[pivotelementrow][c]

    displaymatrix()
    pivotelementrow = int(input("Enter Pivot Element row :"))
    pivotelementcolumn = int(input("Enter Pivot Element column :"))

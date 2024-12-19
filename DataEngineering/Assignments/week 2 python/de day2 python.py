############################################

##Day2


##lambda functions
str1 = 'Hexforhexa'

upper = lambda string: string.upper()
print(upper(str1))
#####################################
format_numeric = lambda num: f"{num:e}" if isinstance(num, int) else f"{num:,.2f}"

print("Int formatting:", format_numeric(1000000))
print("float formatting:", format_numeric(999999.789541235))
#############################
def cube(y):
    return y*y*y

lambda_cube = lambda y: y*y*y
print("Using function defined with `def` keyword, cube:", cube(5))
print("Using lambda function, cube:", lambda_cube(5))
##################################
is_even_list = [lambda arg=x: arg * 10 for x in range(1, 5)]
for item in is_even_list:
    print(item())
############################################
Max = lambda a, b : a if(a > b) else b
print(Max(1, 2))
######################################
List = [[2,3,4],[1, 4, 16, 64],[3, 6, 9, 12]]

sortList = lambda x: (sorted(i) for i in x)
secondLargest = lambda x, f : [y[len(y)-2] for y in f(x)]
res = secondLargest(List, sortList)

print(res)
######################################
li = [5, 7, 22, 97, 54, 62, 77, 23, 73, 61]

final_list = list(filter(lambda x: (x % 2 != 0), li))
print(final_list)

###############-----------Functions
##---1.String Function

text = "hello"
upper_text = text.upper()
print(upper_text)

##--2.Datetime function


import datetime

# Get current date and time
current_datetime = datetime.datetime.now()
print(current_datetime)
###########
##--3.Default argument value function

def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")
greet("Bob", "Good Morning")

########################
##--4.Keyword argumets
def introduce(name, age):
    print(f"Name: {name}, Age: {age}")

introduce(age=25, name="Charlie")

##########
##--5.Number functions
num = -5
abs_value = abs(num)
print(abs_value)

##--6.Special parameters-args
def sum_numbers(*args):
    return sum(args)

result = sum_numbers(1, 2, 3, 4)
print(result)

##-kwargs
def print_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_info(name="David", age=30, city="New York")

###########
##--7.Arbitrary arguments lists
def display(*args, **kwargs):
    print("Arguments:", args)
    print("Keyword arguments:", kwargs)

display(1, 2, 3, name="Alice", age=25)

#####################




################################################
##csv read/write
import csv
# import os
file_path="C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\salary.csv"

with open(file_path,'r') as file:
    csv_reader=csv.reader(file)
    for row in csv_reader:
        print(row)



# import csv
rows = []
with open(file_path, 'r') as file:
    csvreader = csv.reader(file)
    header = next(csvreader)

    for row in csvreader:
        rows.append(row)
    print("header--------------->")
    print(header)
    print("rows------------------>")
    print(rows)

# # import csv
# # filepath='Myfiles.csv'
with open(file_path,'w',newline="") as file:#append mode 'a' not to overwrite data
    csvwriter=csv.writer(file)
    csvwriter.writerow(["Id","Name","Age","Courses_Enrolled"])
    data=[[1,"Aparna",20,3],
    [2,"Stella",20,1],
    [3,"kishore",21,4]]
    csvwriter.writerows(data)
    print("writing had been completed")

with open(file_path,'a',newline="") as file:#append mode 'a' not to overwrite data
    csvwriter=csv.writer(file)
    csvwriter.writerow(["Id","Name","Age","Courses_Enrolled"])
    data=[[6,"arna",20,3],
    [5,"Divya",20,1],
    [4,"RAmya",21,4]]
    csvwriter.writerows(data)
    print("writing had been completed")

#######################-----Lunch break-----##############

###Lambda function using filter

lis=[0,1,2,3,4,5,6,7,8,9]
final_list=list(filter(lambda x : (x%2!=0),lis))
print(final_list)

##filter using list and map

lis=[10,20,30,40]

final_list=list(filter(lambda x:x>500,map(lambda x:x**2,lis)))
print(final_list)

##Reduce

from functools import reduce
lis=[1,2,3,4,5,6,7]

sum1=reduce((lambda x,y:x+y),lis)
print(sum1)

##Getting unique values of a list

def unique1(list1):
    lset=set(list1)
    ulist=(list(lset))
    for x in ulist:
        print(x)

list1=[1,1,2,3,4,4,5,6,7]
unique1(list1)

##de day1 python
# spark can be implemented using python-pyspark,sql-sparksql,R,scala

# numpy,pandas to read/write in data warehouse

# for gui, python tkinter
# ERP-Enterprise resource planning

#if statement

'''
statements
indentation- tab or space before the line
if
if else
if else ladder
if elif else
'''
# i1=30
# i2=60
# if i1<i2:
#     print("i2 is greater")
# else:
#     print("i2 might be less")


# if i1>i2:
#     print("i1 is greater")
# elif i1==i2:
#     print("both are qual")
# else:
#     print("i1 might be less")

# a=int(input("enter a number"))

# if(a)%3==0:
#     print("{} is div by 3".format(a))
# else:
#     print("{} is not div by 3".format(a))

##check whether year is the leap year or not


# year=int(input("Enter a number"))
# if year%100==0:
#     if year%400==0:
#         print("{} is leap year".format(year))
#     else:
#         print("{} is not leap year".format(year))
# elif year%4==0:
#     print("{} is leap year".format(year))
# else:
#     print("{} is not leap year".format(year))


##for loop
# for tempVar in range(1,6):
#     print(tempVar)

# for tempVar in range(5):
#     print("Welcome to Hexaware!")



##while loop
##Q) Display multiplication table for a given number
# n=int(input("Enter number"))
# counter=1
# while counter<11:
#     print(n, 'x', counter, '=',n*counter)
#     counter+=1

##1Q) Counting the number of digits in a number.
# n=int(input("ENter a number"))
# count=0
# while n>0:
#     n=n//10
#     count+=1
# print(count)

##2Q) Finding sum of digits in a number
# n=int(input("enter a number"))
# sum=0
# while n>0:
#     n1=n%10
#     sum+=n1
#     n=n//10
# print(sum)

##3Q) Reversing a string
# n=int(input("Enter a number"))
# rev=0
# while n>0:
#     digit=n%10
#     n=n//10
#     rev=rev*10+digit
# print(rev)

##check if a number is a palindrome .
# n=int(input("Enter a number"))
# temp=n
# rev=0
# while n>0:
#     digit=n%10
#     n=n//10
#     rev=rev*10+digit
# if temp==rev:
#     print("palindrome")
# else:
#     print("not a palindrome")

## guessing a number
# import random
# n=random.randint(1,10)
# guess=0
# while guess!=n:
#     guess=int(input("enter guess"))
#     if guess>n:
#         print("enter smaller")
#     elif guess<n:
#         print("enter larger")
#     else:

#         print("correct")

##print prime number from 1 to 100
# for i in range(1, 11):

    # If i is equals to 6,
    # continue to next iteration
    # without printing
    # if i == 6:
    #     continue
    # else:
    #     # otherwise print the value
    #     # of i
    #     print(i, end = " ")


# Python program to demonstrate
# break statement with nested
# for loop

# first for loop
# for i in range(1, 5):

#     # second for loop
#     for j in range(2, 6):

#         # break the loop if
#         # j is divisible by i
#         if j%i == 0:
#             break

#         print(i, " ", j)
######################################Lunch Break##############
##functions

# def addition_mul(*args): # * before the argument args shows it is a multi/variable length argument; This accepts only values; this behaves as a tuple
#     result = 0
#     for num in args:
#         result += num
#     return result


# print(addition_mul(1,2,345,223,532,12,432))
# print(addition_mul(56,33))
# print(addition_mul(56,33,25,26,32))

# def addition(num1,num2):
#     result = num1+num2
#     #print("The result of addition of {} and {} is {}".format(num1, num2, result))
#     return result
# def get_multiplication_table(num1,num=3):
#     result = num1*num
#     print("The multiplication of {} table by {} is {}".format(num,num1,result))


###############################FIle resding/writing operations########################

import csv
# import os
file_path="C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\csvfile.csv"

with open(file_path,'r') as file:
    csv_reader=csv.reader(file)
    for row in csv_reader:
        print(row)

# import csv
# filepath='Myfiles.csv'
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


# import pandas as pd
# filename='C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\Data Engg\\business data\\stu_data.csv'
# header = ['Name', 'M1 Score', 'M2 Score']
# data = [['Alex', 62, 80], ['Brad', 45, 56], ['Joey', 85, 98]]
# data = pd.DataFrame(data, columns=header)
# data.to_csv('stu_data.csv', index=False)
# print("data is inserted")

###########

#list.sort()
#sorted()

# strs = ['a', 'BB', 'zzzz', 'CCz']
# print(sorted(strs))
# print(sorted(strs,reverse=True))
# print(sorted(strs,key=len))
# print(sorted(strs,key=str.lower))

# def MyFn(strs):

#  return strs[-1]
# print(sorted(strs, key=MyFn))

##List read
# import csv

# with open('C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\salary.csv', 'r') as read_object:
#     csv_reader =csv.reader(read_object)

#     list_data = list(csv_reader)
#     print(list_data)



# import json
# jsonstring = '{ "id": 121, "name": "Naveen", "course": "MERN Stack"}'

# student_data =json.loads(jsonstring)

# print(student_data)
# print(student_data['name'])
# print(student_data['course'])

import json
with open('C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\Data Engg\\business data\\data.json') as json_file:
    data=json.load(json_file)
    print(data['Courses'][0])
    print(data['Courses'][1])

    for i in data['Courses']:
        print("Namelist : "  ,i['Name'])
        #print("Namelist: ",i["Created by"])

with open('C:\\Users\\DivyaSree\\Desktop\\Hexaware Training 2024\\Data Engg\\business data\\data.json') as json_file:
    data = json.load(json_file)

    # Print the type of data variable
    print("Type:", type(data))

    # Print the data of dictionary
    print("\nPeople1:", data['people1'])
    print("\nPeople2:", data['people2'])

import json

# Opening JSON file
with open('data.json') as json_file:
    data = json.load(json_file)

    # for reading nested data [0] represents
    # the index value of the list
    print(data['people1'][0])

    # for printing the key-value pair of
    # nested dictionary for loop can be used
    print("\nPrinting nested dictionary as a key-value pair\n")
    for i in data['people1']:
        print("Name:", i['name'])
        print("Website:", i['website'])
        print("From:", i['from'])
        print()

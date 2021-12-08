import json
from operator import getitem
from functools import reduce

# Below code is for creating a TEST Object and inserting dummy values there

$TestObject=@()
for($i=1; $i -le 10; $i++){
    $TestObject += New-Object PSObject -Property @{
                
                Name         = "City_"+$i
                location     = "Asia_"+$i
                Occupation   = @{Title = "Metro" Country = "India"
                              } } }

def Find_KeyValue_Pair(dataset, keys):
    try:
        return reduce(getitem, keys, dataset)
    except (KeyError, IndexError):
        return None

FirstObject = {"a":{"b":{"c":"d"}}}
FirstKey = "a/b/c"
FirstKeyObject = (list(FirstKey.split("/")))

# Printing the value to check if output is correct
print("Value for Firstobject and FirstKey - :",Find_KeyValue_Pair(dataset=Firstobject, keys=FirstKeyObject))

SecondObject = {"x":{"y":{"z":"a"}}}
SecondKey = "x/y/z"
SecondKeyObject = (list(SecondKey.split("/")))

# Printing the value to check if output is correct
print("Value for SecondObject and SecondKey - :",Find_KeyValue_Pair(dataset=dataobject, keys=SecondKeyObject))

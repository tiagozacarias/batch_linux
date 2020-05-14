# /usr/bin/env python3


LISTA = ["Tiago", "Douglas", "Leonardo", "Tete"]

if "Tiago" in LISTA:

    for i in LISTA:
        
        teste = i,zip
        
        print(teste)
    
    
TUPLA = ("Tiago", "Douglas", "Leonardo", "Tete")    

if "Tiago" in TUPLA:

    print(TUPLA)
    
    
    
DICT = {"1" : "Tiago", "2" : "Douglas",  "3" : "Leonardo", "4" : "Tete" }

for i in DICT:
    
    print(i)
        


GROUP = {"Tiago": True, "Douglas" : True, "Leonardo" : False, "Tete": False}

print(GROUP["Tiago"])

for it in GROUP["Tiago"]:
    
    print(it)
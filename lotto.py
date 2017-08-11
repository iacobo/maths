#Lottery Number picker
import random

if __name__ == '__main__':
    county = int(raw_input("How many numbers do you want to pick? > "))
    maxy = int(raw_input("What is the max number you can pick?  > "))
    
    ans = random.sample(range(1,maxy+1), county)
    
    print("\n")
    print("Here are your numbers:")
    print ' '.join(map(str, ans))
    print("\n")
    
    raw_input("Press any key to exit.")
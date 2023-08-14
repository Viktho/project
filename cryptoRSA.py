#!/usr/bin/python
print("CREATED BY: WHITEWOLFE")
print("DATE: 12/08/2023")
print('\n')

#first stage is to pick two primes, p and q


## print("what is your P value:")
## p = int(input())
## print("what is your Q value:")
## q = int(input())

## n = p * q

## print(n)

#second stage is obtaining the ciphertext >> they gave the integer used to encrypt the message m = 100, public exponent e = 65537, and N = p * q

#x = pow(m, e, n)
#print(x)

#third is to calculate for tot  >> it is needed to calculate for the private exponent tot(n) = (p-1)*(q-1) 

#fourth stage is to calculate for d >> which is the private exponent for decrypting the ciphertext >> d = e^-1 (mod (tot(n)), where ^-1 represents modular inverse >> d = pow(e, -1, tot)

#final stage ciphertext >> plaintext

##from Crypto.Util.number import long_to_bytes

##n = 46022395228858128751292685876215188619138307401522836095528477547022179989791

##d = 9396610625407794388224170006403030942930897728215608480254060826927407747465

##encrypted_flag = 12307158049143389763227445520936582474795745773736242138608235923833886752416

##decrypted_flag = long_to_bytes(pow(encrypted_flag,d,n)).decode()

##print(decrypted_flag)


print("FIRST STAGE")
print('\n')
print("what is your P value:")
p = int(input())
print("what is your Q value:")
q = int(input())

n = p * q
print('\n')
print("This is your public modulus:", n)

print('\n')

print("SECOND STAGE")
print('\n')
print("We need to obtain the ciphertext")
print("The values needed are the integers used to encrypt the message and the public exponent (common value = 65537)")
print('\n')

print("What is the integer used to encrypt the message:")
m = int(input())
print("Input the public exponent:")
e = int(input())

c = pow(m, e, n)
print('\n')
print("This is the cipertext:", c)
print('\n')
tot = (p - 1) * (q - 1)
print("THIRD STAGE")
print('\n')
d = pow(e, -1, tot)
print("This is your private exponent:", d)
print('\n')

# if your flag is encrypted, you should uncomment this final stage. if it is not encrypted don't uncomment it
print("FINAL STAGE")
print("Input the encrypted flag:")
encrypted_flag = int(input())
print('\n')
from Crypto.Util.number import long_to_bytes
flag = long_to_bytes(pow(encrypted_flag,d,n)).decode()
print(flag)

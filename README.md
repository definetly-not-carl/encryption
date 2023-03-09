# Just another encryption library

Hi there, I'm trying to create a program/library that lets me understand how encryption works.
I may plan to add an entire encrypted file format.

**⚠️⚠️DISCLAIMER⚠️⚠️: this library isn't meant to be used in any harmful way, so if it will be used in such a way, it's not my fault.**

ROADMAP:
- [x] Undestand how encryption works (*ish*)
- [x] Create a file/library that lets me encrypt messages ~with a [key](#Explaination)~
- [ ] Use the library/file to encrypt a file
- [ ] Create a file format that contains other files that are encrypted (ex.: encrypted zip-files)

I've recently come to an error: if you try to feed into the program characters such as "è", it will spit out a sequence of 2 hexadecimal numbers that are not correct.
I believe it has something to do with the Lua function string.byte(), because it gives back a value of 195 instead of a value of 232.
Please, try to find why it happens, cause I'm really struggling to find an answer.

**Update about the previous issue:** I believe that Lua translates these kinds of characters to two characters, but it translates them back to their original form when you use string.char(). I believe that this is an explaination of the phenomenon that is happening

## Explaination

Now the program lets you insert the number of times that you want it to be encrypted, therefore it should be "safer".

Thanks for your attention.
~DefinetlyNotCarl

#!/usr/bin/env python
import sys
if __name__ == "__main__":
	if len(sys.argv) < 2:
		print "usage: %s file.bin\n" % (sys.argv[0],)
		sys.exit(0)

	shellcode = "0x"
	ctr = 1
	maxlen = 8
        temp=[]

	for b in open(sys.argv[1], "rb").read():
                temp.append(b.encode("hex"))
		if ctr == maxlen:
                    temp = temp[::-1]
                    temp = ''.join(temp)
		    shellcode += temp + ",0x"
                    temp=[]
		    ctr = 0
		ctr += 1
        if ctr != 1:
            shellcode += (maxlen-ctr+1)*"00" + ''.join(temp[::-1])
	print shellcode
import sys

def notify_mayhem():
    import os
    os.kill(os.getpid(),11)

def BrokenMethod(strInput):
    if len(strInput) >= 2:
        return strInput[0] == 'F' and strInput[1] == 'U' and strInput[2] == 'Z' 

def FuzzerEntrypoint(Data):
    try:
        strData = Data.read().decode("utf-8")
        print strData
        BrokenMethod(strData)
    except UnicodeDecodeError, e:
        return

def main():
    try:
        with open(sys.argv[1], 'r') as f:
            data = f.read(128)
            r=BrokenMethod(data)
	    if r is True:
		notify_mayhem () 
    except: 
        notify_mayhem ()

if __name__ == "__main__":
    main()


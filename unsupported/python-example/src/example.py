#!/usr/bin/env python2.7
import sys

def notify_mayhem():
    import os
    os.kill(os.getpid(),11)
    #exec'()'*7**6
    
def my_sqrt(x):
    """Computes the square root of x, using the Newton-Raphson method"""
    approx = None
    guess = x / 2
    while approx != guess:
        approx = guess
        guess = (approx + x / approx) / 2
    if approx == 3:
	notify_mayhem ()
    return approx

def main():
    try:
        with open(sys.argv[1], 'r') as f:
            contents = f.read()
            result = my_sqrt(int(contents[0],10))
            print result
    except: 
        notify_mayhem ()

if __name__ == "__main__":
    main()

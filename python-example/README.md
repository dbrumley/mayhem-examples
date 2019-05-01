We use
```
import os
os.kill(os.getpid(),11)
```
to raise a UNIX signal. Seems to work.

Interesting the python2 `exec'()'*7**6` was not working. Go figure.
https://codegolf.stackexchange.com/questions/4399/shortest-code-that-raises-a-sigsegv

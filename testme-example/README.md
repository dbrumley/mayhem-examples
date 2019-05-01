# Testme

This shows Mayhem finding a simple bug. Note both the buggy and fixed
versions are inside the same docker image.

Run the buggy program:
```
mayhem run .
```

Run the fixed program:
```
mayhem run -f Mayhemfile-patched .
```

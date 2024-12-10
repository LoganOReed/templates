## Fortran using F2py
Compiles fortran code as python extension modules which are importable as in the example
Both init and main compile all fortran files within app directory so they are usable.

## Potential workflow
1. Write fortran subroutine
2. Run the module or import it from the repl. This compiles the shared library
3. run python files which use the fortran module like
```
python app/test.py
```

## TODO
Either make the init/main functions conditional on .so existing or use just to make workflow easier

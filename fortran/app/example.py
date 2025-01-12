from .fortran import lapack_sort
import numpy as np

def sort():
    """docstring for norm"""
    print(np.__config__.show())
    a = np.array([0,2, 199, 54, 123, 3], dtype=np.float64)
    print(a)
    print(f"{lapack_sort.lapack_sort(a)}")
    print(a)
    

if __name__ == "__main__":
    sort()

from .fortran import euclidian_norm
import numpy as np

def norm():
    """docstring for norm"""
    print(f"{euclidian_norm.euclidian_norm(np.array([0,2]))}")
    

if __name__ == "__main__":
    norm()

import os
import sys
import subprocess
from glob import glob

# Define reasonable Fortran file extensions
FORTRAN_EXTENSIONS = [".f", ".f90", ".f95", ".for"]

def find_fortran_files(directory):
    """Finds all Fortran files in the specified directory."""
    fortran_files = []
    for ext in FORTRAN_EXTENSIONS:
        fortran_files.extend(glob(os.path.join(directory, f"*{ext}")))
    return fortran_files

def compile_fortran_modules():
    """Compiles all Fortran files in the current directory into Python extension modules."""
    current_dir = os.getcwd()
    fortran_files = find_fortran_files(current_dir)
    
    if not fortran_files:
        print("No Fortran files found for compilation.")
        return
    
    for fortran_file in fortran_files:
        module_name = os.path.splitext(os.path.basename(fortran_file))[0]
        
        try:
            print(f"Compiling {fortran_file} into module {module_name}...")
            subprocess.run(
                [
                    "python",
                    "-m",
                    "numpy.f2py",
                    "-c",
                    fortran_file,
                    "-m",
                    module_name,
                ],
                check=True,
            )
            print(f"Module {module_name} compiled successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Failed to compile {fortran_file}: {e}")
            sys.exit(1)

if __name__ == "__main__":
    print("Starting Fortran module compilation...")
    compile_fortran_modules()
    print("All specified Fortran files have been processed.")


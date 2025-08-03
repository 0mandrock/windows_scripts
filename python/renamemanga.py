import os
import re

folder_path = os.getcwd()  
pattern = r"^(\d) - "

for filename in os.listdir(folder_path):
    old_file_path = os.path.join(folder_path, filename)
    
    if os.path.isfile(old_file_path):
        match = re.match(pattern, filename)

        if match:
            # Add "0" before the single-digit prefix
            new_filename = f"0{filename}"
            new_file_path = os.path.join(folder_path, new_filename)
            
            # Rename the file
            os.rename(old_file_path, new_file_path)
            print(f'Renamed: {filename} -> {new_filename}')

print("Renaming completed!")

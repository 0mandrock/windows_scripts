import os
import img2pdf

def collect_images_and_create_pdf(folder_path, output_pdf_path):
    image_files = []
    
    for root, dirs, files in os.walk(folder_path):
        for file in sorted(files):
            if file.endswith(('.png', '.jpg', '.jpeg')):
                image_files.append(os.path.join(root, file))
    
    with open(output_pdf_path, "wb") as f:
        f.write(img2pdf.convert(image_files))

folder_path = os.getcwd()
output_pdf_path = 'output.pdf'

collect_images_and_create_pdf(folder_path, output_pdf_path)

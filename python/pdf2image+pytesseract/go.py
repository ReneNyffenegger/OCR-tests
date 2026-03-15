from pdf2image import convert_from_path
import pytesseract
from PIL import Image  # optional preprocessing
import os

tmpHausbauDir = '/mnt/hausbau/'

pdfPath = tmpHausbauDir + 'Streiten-mit-Moos/2026-03_Anwaltsvollmacht-Stoessel-Schweizer-Partner.pdf'

if not os.path.isfile(pdfPath):
   print(f'{pdfPath} does not exist')
   quit()


pages   = convert_from_path(pdfPath, dpi=300)  # 300 dpi is sweet spot

full_text = ''

for i, page in enumerate(pages):
  # Optional preprocessing for better accuracy
  # page = page.convert("L")  # grayscale
  # page = page.point(lambda x: 0 if x < 128 else 255, "1")  # threshold
    
    text = pytesseract.image_to_string(page, lang='deu')
    full_text += f"--- Page {i+1} ---\n{text}\n"

print(full_text)

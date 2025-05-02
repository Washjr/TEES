from nltk.corpus import machado

print(machado.fileids())

# raw_text = machado.raw('romance/marm05.txt')
# print(raw_text[5600:5800])

texto1 = machado.words('romance/marm05.txt')
print(texto1)
print(len(texto1))                                 
import nltk

stemmer = nltk.stem.RSLPStemmer()
print(stemmer.stem("copiar"))
print(stemmer.stem("paisagem"))
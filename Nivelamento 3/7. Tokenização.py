import nltk

sentence = """Estou bem, mas não tenho certeza
... se viajarei amanhã às 8:30."""

tokens = nltk.word_tokenize(sentence)
print(tokens)
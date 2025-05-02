#Importa as bibliotecas
from nltk.corpus import mac_morpho
from nltk import FreqDist
from nltk.tag import DefaultTagger

#Carrega as sentenças rotuladas do Corpus
# sentencas_etiquetadas = mac_morpho.tagged_sents()   
# print(sentencas_etiquetadas)

# tags = [tag for (word, tag) in mac_morpho.tagged_words()]
# print(FreqDist(tags).max())

etiqPadrao = DefaultTagger('N')
tokens = ['o', 'livro', 'é', 'interessante']
print(etiqPadrao.tag(tokens))
 
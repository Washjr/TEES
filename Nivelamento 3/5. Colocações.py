from nltk.corpus import machado
from nltk.text import Text

bras = Text(machado.words('romance/marm05.txt'))
bras.collocations()
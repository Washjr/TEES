from nltk.corpus import machado
from nltk.text import Text

bras = Text(machado.words('romance/marm05.txt'))
# bras.concordance('olhos')
# bras.similar('chegar')
bras.findall("<olhos> (<.*>)")
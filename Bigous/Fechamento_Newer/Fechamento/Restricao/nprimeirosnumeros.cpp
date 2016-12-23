#include "nprimeirosnumeros.h"

NPrimeirosNumeros::NPrimeirosNumeros(const int &pn, ITransformacao *ptransf) : n(pn), transf(ptransf)
{
}

NPrimeirosNumeros::~NPrimeirosNumeros()
{
}

bool NPrimeirosNumeros::serve(const Jogo &j)
{
  Jogo::const_iterator ib = j.begin();
  Jogo::const_iterator ie = j.end();
  for(; ib != ie; ib++) {
    if(transf->getIndex(*ib) > n)
      return false;
  }
  return true;
}

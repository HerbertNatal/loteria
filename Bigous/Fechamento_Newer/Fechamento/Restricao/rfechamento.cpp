#include "rfechamento.h"

RFechamento::RFechamento(ITransformacao::MapJogos *p_selecionado, const int &valorMinimo) : selecionado(p_selecionado), qtdMinimo(valorMinimo)
{
}

RFechamento::~RFechamento()
{
}

bool RFechamento::serve(const Jogo &j)
{
  if(selecionado != NULL) {
    ITransformacao::MapJogos::iterator it = selecionado->begin();
    ITransformacao::MapJogos::iterator e = selecionado->end();
    for(;it != e; it++) {
      const Jogo &jogo = *it;//.value();
      if(jogo.qtdMatch(j) >= qtdMinimo)
        return false; // TODO: Otimizar ???
    }
  }
  return true;
}

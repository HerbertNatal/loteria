#include "jasorteado.h"

JaSorteado::JaSorteado(Base *p_historico) : historico(p_historico)
{
}

JaSorteado::~JaSorteado()
{
}

bool JaSorteado::serve(const Jogo &j)
{
  if(historico != NULL && historico->jaFoi(j))
    return false;
  return true;
}

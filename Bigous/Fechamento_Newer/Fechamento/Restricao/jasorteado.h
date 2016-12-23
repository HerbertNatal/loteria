#pragma once

#include <Restricao/irestricao.h>
#include <base.h>

class JaSorteado : public IRestricao
{
  Base *historico;
public:
  explicit JaSorteado(Base *p_historico=NULL);
  virtual ~JaSorteado();

  virtual bool serve(const Jogo &j);
};


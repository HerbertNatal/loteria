#pragma once

#include <Restricao/irestricao.h>
#include <Transformacao/itransformacao.h>

class RFechamento : public IRestricao
{
  ITransformacao::MapJogos *selecionado;
  int qtdMinimo;
public:
    explicit RFechamento(ITransformacao::MapJogos *p_selecionado, const int &valorMinimo=3);
    virtual ~RFechamento();

    virtual bool serve(const Jogo &j);
};



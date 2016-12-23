#pragma once

#include <Restricao/irestricao.h>

class Sequencia : public IRestricao
{
  int qtdMaxima;
public:
    explicit Sequencia(const int &valorMaximo=3);
    virtual ~Sequencia();

    virtual bool serve(const Jogo &j);
};


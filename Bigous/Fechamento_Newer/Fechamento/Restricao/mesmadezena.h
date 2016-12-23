#pragma once

#include <Restricao/irestricao.h>

class MesmaDezena : public IRestricao
{
  int qtdMaxima;
  int d[6];
public:
    explicit MesmaDezena(const int &valorMaximo=4);
    virtual ~MesmaDezena();

    virtual bool serve(const Jogo &j);
};


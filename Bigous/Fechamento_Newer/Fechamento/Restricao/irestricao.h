#pragma once

#include <jogo.h>

class IRestricao
{
public:
    IRestricao();
    virtual ~IRestricao();

    virtual bool serve(const Jogo &j) = 0;
};


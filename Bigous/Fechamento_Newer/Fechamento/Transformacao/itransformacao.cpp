#include "itransformacao.h"

ITransformacao::ITransformacao(Base *p_historico) : historico(p_historico)
{
}

ITransformacao::~ITransformacao()
{
}

void ITransformacao::armazenar(const Jogo &j)
{
  //register long long llj = j.toLongLong();
  //if(jogos.find(llj) == jogos.end()) {
  //  jogos.insert(llj, j);
  //}
	jogos.push_back(j);
}

#include "fechamento.h"

extern QTextStream cerr;//(stderr);

void printProgress(const double &dblTotal, const double &dblPosition) {
	double pct = dblPosition / dblTotal;
	int valPct = int(25 * pct);
	cerr << "\r[";
	for(int i = 1; i <= 25; i++) {
		if(valPct >= i)
			cerr << '*';
		else
			cerr << ' ';
	}
	cerr << "] " << (double((long long)(pct*100000.0))/1000.0) << "% [" 
		<< (long long)(dblPosition) << "/" << (long long)(dblTotal) << "]          ";
	cerr.flush();
}

Fechamento::Fechamento(const int &p_fecha, const int &p_from, const int &p_choose)
  : Combinatoria(p_from, p_choose)
{
}

Fechamento::~Fechamento()
{
  foreach(IRestricao * res, restricoes) {
    delete res;
  }
  foreach(ITransformacao * trans, transformacoes) {
    delete trans;
  }
}

void Fechamento::run()
{
  Combinatoria::run();
	printProgress(getTotal(), getPosition());
}

void Fechamento::processar(int *comb, const int &)
{
  //int *c = comb-1;
	static double lastPos=0.0;
	if(getPosition() == lastPos + 10000.0 || lastPos == 0.0) {
		lastPos = getPosition();
		printProgress(getTotal(), lastPos);
	}
  QList< ITransformacao * >::const_iterator it = transformacoes.begin();
  QList< ITransformacao * >::const_iterator e = transformacoes.end();
  for(; it != e; it++) {
    ITransformacao *trans = *it;
    Jogo j(comb, true);
    trans->transformar(j);
    if(validar(j)) {
      trans->armazenar(j);
    }
  }
}

bool Fechamento::validar(const Jogo &j) const
{
  QList< IRestricao * >::const_iterator it = restricoes.begin();
  QList< IRestricao * >::const_iterator e = restricoes.end();
  for(; it != e; it++) {
    IRestricao *restricao = *it;
    if(!restricao->serve(j))
      return false;
  }
  return true;
}

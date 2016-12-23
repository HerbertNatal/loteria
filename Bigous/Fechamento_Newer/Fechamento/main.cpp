#include <QtCore>
#include <base.h>
#include <fechamento.h>
#include <Transformacao/maiordesviotransformacao.h>
#include <Restricao/jasorteado.h>
#include <Restricao/mesmadezena.h>
#include <Restricao/rfechamento.h>
#include <Restricao/sequencia.h>
#include <Restricao/nprimeirosnumeros.h>

QTextStream cout(stdout);
QTextStream cerr(stderr);

int main(int argc, char *argv[])
{
  QCoreApplication a(argc, argv);
  cout.setCodec("cp850");

	if(argc < 3) {
		cout << "Uso:" << "\r\n"
        << "Fechamento -h <arq historico> -t<mdt> [-rjs] [-rmd <nMMD = 4>] [-rs <nMS = 3>] [-rf <nF = 4>] [-rnp <NpN = 60>]" << "\r\n";
		return 0;
	}

  Base baseMega;
  Fechamento fecha;
	ITransformacao *t = NULL;

  int nMMD = 4, nMS = 3, nF = 4, NpN = 0;
	bool js = false;

	// processa configurações
	for(int i = 1; i < argc; i++) {
		char *it = argv[i];

		if(it == QString("-h")) {
			it = argv[++i];
			baseMega.loadFromFile(it);
      cout << "[Base Mega]\n";
      for(Base::const_iterator ib = baseMega.begin(); ib != baseMega.end(); ib++) {
        cout << (*ib).numero << ";" << (*ib).saidas << ";" << (*ib).desvio << "\n";
      }
    } else if( it == QString("-rnp") ) {
      it = argv[++i];
      NpN = QString::fromAscii(it).toInt();
    } else if( it == QString("-rjs") ) {
      js = true;
    } else if( it == QString("-rmd") ) {
			it = argv[++i];
      nMMD = QString::fromAscii(it).toInt();
		} else if( it == QString("-rs") ) {
			it = argv[++i];
      nMS = QString::fromAscii(it).toInt();
		} else if( it == QString("-rf") ) {
			it = argv[++i];
      nF = QString::fromAscii(it).toInt();
		} else if( it == QString("-tmdt") ) {
			t = new MaiorDesvioTransformacao(&baseMega);
		}
	}

	if(nF < 1 || t == NULL) {
    cerr << "Numero de Fechamento deve ser maior que 0 e um estilo de transformação deve ser setado." << "\n";
    cerr.flush();
		return 1;
	}

  // Adiciona a transformação
	fecha.addTransformacao(t);

  // Adiciona restrições condicionais
	if(js) fecha.addRestricao(new JaSorteado(&baseMega));
	if(nMS > 0) fecha.addRestricao(new Sequencia(nMS));
	if(nMMD > 0) fecha.addRestricao(new MesmaDezena(nMMD));
  if(NpN > 0) fecha.addRestricao(new NPrimeirosNumeros(NpN, t));

  // Adiciona restrição de fechamento
	fecha.addRestricao(new RFechamento(&(t->getJogos()), nF)); 

  fecha.run();

  cout << "[Jogos]\n";
  foreach(const Jogo &j, t->getJogos()) {
		j.writeTo(cout);
		cout << '\n';
		cout.flush();
	}

	return 0;
}

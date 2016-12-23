'use strict';

var combinatoria = require('./combinatoria.js');

function LotoFacil(ensure) {
	this.from = 25;
	this.choose = 15;
	this.ensure = ensure || 1;
}

function quantosBatem(arr1, arr2) {
	var ret = 0;
	for (var i1 = 0; i1 < arr1.length; i1++) {
		var e1 = arr1[i1];
		for (var i2 = 0; i2 < arr2.length; i2++) {
			var e2 = arr2[i2];
			if(e1 === e2) ret ++;
		}
	}
	return ret;
}

function repetiu(arr1, arr2, fecha) {
	var bateu = quantosBatem(arr1, arr2);
	return bateu >= fecha;
}

LotoFacil.prototype.rodar = function() {
	var jogos = [];
	var loto = this;
	combinatoria(25, 15, function(jogo) {
		for (var index = 0; index < jogos.length; index++) {
			var element = jogos[index];
			if(repetiu(element, jogo, loto.ensure)) {
				return;
			}			
		}
		jogos.push(jogo);
	});
	return jogos;
}

var loto = new LotoFacil(parseInt(process.argv[2] || '1'));

console.log(loto);

var resultado =loto.rodar();

console.log(resultado);

console.log('Foram gerados %s jogos para fechar %s na Lotofácil', resultado.length);
extends Node

var site = "http://osnngodot.freevar.com"
var url_login     = site + "/bd/dao/autenticar.php?"
var url_ranking   = site + "/bd/dao/jogo_ranking.php?"
var url_ranking_2   = site + "/bd/dao/jogo_ranking_2.php?"
var url_ranking_3   = site + "/bd/dao/jogo_ranking_3.php?"
var url_atualiza_pontuacao = site + "/bd/dao/atualiza_pontuacao.php?"
var url_atualiza_pontuacao2 = site + "/bd/dao/atualiza_pontuacao2.php?"
var url_atualiza_pontuacao3 = site + "/bd/dao/atualiza_pontuacao3.php?"

var id_usuario = 0
var nome_usuario = ""
var melhor_pontuacao = 0
var melhor_pontuacao_2 = 0
var melhor_pontuacao_3 = 0
var ult_fase = 0
var data_criacao = 0
var data_atualiza = 0

var pontuacao_tempo = 0
var pontuacao_tempo_fase = 0
var pontuacao_inimigo = 0

const GRAVIDADE = 20
const ALTURA_PULO = -550
var vida = 3
var fase = 1
var fase_atual = 1
var inimigos_eliminados = 0


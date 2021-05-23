extends Node

var site = "http://osnngodot.freevar.com"
var url_login     = site + "/bd/dao/autenticar.php?"
var url_ranking   = site + "/bd/dao/jogo_ranking.php?"

var id_usuario = 0
var nome_usuario = ""
var melhor_pontuacao = 0
var ult_fase = 0
var data_criacao = 0
var data_atualiza = 0

var pontuacao_tempo = 0
var pontuacao_inimigo = 0

const GRAVIDADE = 20
const ALTURA_PULO = -550
var vida = 3
var fase = 1


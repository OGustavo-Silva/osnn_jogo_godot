extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$NomeUsuario.text = ScriptGlobal.usuario
	atualizar_ranking_1()
	
func atualizar_ranking_1():
	var url_requisicao = ScriptGlobal.url_ranking;
	var dados_envio = ""
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio) # requisicao para POST

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	$ColorRect/ItemList.clear()
	var json = JSON.parse(body.get_string_from_utf8())
	
	for i in range(json.result.size()):
		var posicao = i+1
		var id_usuario = str(json.result[i]["id"])
		var pontuacao = str(json.result[i]["pontuacao"])
		var nome_usuario = str(json.result[i]["nome"])
		
		$ColorRect/ItemList.add_item(str("%03s" % posicao) + str("%25s" % pontuacao) + str("%25s" % nome_usuario))
		if (ScriptGlobal.id_usuario != id_usuario):
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 1, 1, 1 ))
		else:
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 0, 0, 1 ))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Chama ranking fase 1
func _on_Button_pressed():
	atualizar_ranking_1()

#chama ranking fase 2
func _on_Button2_pressed():
	var url_requisicao = ScriptGlobal.url_ranking_2;
	var dados_envio = ""
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest2.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio) # requisicao para POST

#retorno servidor ranking fase 2
func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	$ColorRect/ItemList.clear()
	var json = JSON.parse(body.get_string_from_utf8())
	
	for i in range(json.result.size()):
		var posicao = i+1
		var id_usuario = str(json.result[i]["id"])
		var pontuacao = str(json.result[i]["pontuacao_2"])
		var nome_usuario = str(json.result[i]["nome"])
		
		$ColorRect/ItemList.add_item(str("%03s" % posicao) + str("%25s" % pontuacao) + str("%25s" % nome_usuario))
		if (ScriptGlobal.id_usuario != id_usuario):
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 1, 1, 1 ))
		else:
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 0, 0, 1 ))

func _on_Button3_pressed():
	var url_requisicao = ScriptGlobal.url_ranking_3;
	var dados_envio = ""
	var cabecalho   = ["Content-Type: application/x-www-form-urlencoded"] #para POST usamos application/json
	$HTTPRequest3.request(url_requisicao, cabecalho, false,HTTPClient.METHOD_POST, dados_envio) # requisicao para POST

func _on_HTTPRequest3_request_completed(result, response_code, headers, body):
	$ColorRect/ItemList.clear()
	var json = JSON.parse(body.get_string_from_utf8())
	
	for i in range(json.result.size()):
		var posicao = i+1
		var id_usuario = str(json.result[i]["id"])
		var pontuacao = str(json.result[i]["pontuacao_3"])
		var nome_usuario = str(json.result[i]["nome"])
		
		$ColorRect/ItemList.add_item(str("%03s" % posicao) + str("%25s" % pontuacao) + str("%25s" % nome_usuario))
		if (ScriptGlobal.id_usuario != id_usuario):
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 1, 1, 1 ))
		else:
			$ColorRect/ItemList.set_item_custom_fg_color(i, Color( 1, 0, 0, 1 ))


func _on_voltar_pressed():
	get_tree().change_scene("res://assets/cena_menu.tscn")

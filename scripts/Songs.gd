extends Node

@onready var musicPlayer : AudioStreamPlayer2D = $BackMusic
var musicNum : int = 1 ## Índice referente a cada musica da playlist

## Banco de dados das musicas(Playlist)
var musicDatabase : Dictionary = {
	1: preload("res://assets/songs/caçadoes de lenda1.mp3")
}

## Inicia a musica de fundo com o indice inicial
func _ready() -> void:
	musicPlayer.stream = musicDatabase.get(musicNum) # Seleciona a musica da playlist com base no índice
	playMusic()
	print(musicPlayer.stream)

## Função de controle e legibilidade para o play da musica atual
func playMusic() -> void:
	musicPlayer.stream = musicDatabase.get(musicNum)
	musicPlayer.play()


	
func impactPlay() -> void:
	$ImpactSFX.play()


func backMusicFinished():
	print("musica acabou")
	## Verifica se há proxima musica e itera o índice, caso não volta ao indice inicial
	if musicNum >= musicDatabase.size():
		musicNum = 1
	else:
		musicNum += 1
	
	## Atribuição do indice atual e inicio da musica selecionada
	musicPlayer.stream = musicDatabase.get(musicNum)
	playMusic()
	print(musicNum >= musicDatabase.size())

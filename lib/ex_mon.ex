defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"

  # Função para criar o jogador, suas habilidades.
  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  # Função para começar o game do jogador.
  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  # Função para o usuário passar suas estruções/habilidades.
  def make_move(move) do
    Actions.fetch_move(move)
  end
end

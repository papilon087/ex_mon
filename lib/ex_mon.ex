defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.Status

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
end

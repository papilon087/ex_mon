defmodule ExMon.Game.Status do
  alias ExMon.Game

  # Imprime informações se o jogo começou e seu status.
  def print_round_message() do
    IO.puts("\n===== The game is started! =====\n")
    IO.inspect(Game.info())
    IO.puts("-------------------------------")
  end

  # Imprime mensagem de movimento invalido.
  def print_wrong_move_message(move) do
    IO.puts("\n===== Invalid move: #{move} =====\n")
  end

  # Imprime a mensagem quando o computador atacar o computador
  def print_move_message(:player, :attack, damage) do
    IO.puts("\n===== The Player attacked the computer dealing #{damage} damage. =====\n")
  end

  # # Imprime a mensagem quando o jogador atacar o computador
  def print_move_message(:computador, :attack, damage) do
    IO.puts("\n===== The Computer attacked the player dealing #{damage} damage. =====\n")
  end
end

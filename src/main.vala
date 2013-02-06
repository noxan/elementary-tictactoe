public static int main(string[] args) {
    Gtk.init(ref args);

    var tictactoe = new TicTacToe.Application();

    return tictactoe.run(args);
}

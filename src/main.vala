using Gtk;

namespace TicTacToe {
    class TicTacToe : Granite.Application {
    }
}

public static int main(string[] args) {
    Gtk.init(ref args);

    var tictactoe = new TicTacToe.TicTacToe();

    return tictactoe.run(args);
}

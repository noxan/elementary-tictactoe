using Gtk;

namespace TicTacToe {
    class TicTacToe : Granite.Application {
        private Window window;

        construct {
            program_name = "Tic Tac Toe";
        }

        public override void activate() {
            this.window = new Window();
            this.window.set_application(this);
            this.window.show_all();
        }
    }
}

public static int main(string[] args) {
    Gtk.init(ref args);

    var tictactoe = new TicTacToe.TicTacToe();

    return tictactoe.run(args);
}

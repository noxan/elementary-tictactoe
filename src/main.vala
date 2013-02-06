public static int main(string[] args) {
    Gtk.init(ref args);

    return new TicTacToe.Application().run(args);
}

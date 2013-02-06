namespace TicTacToe {
    public class Board : Gtk.Grid {
        public Board() {
            row_spacing = 5;
            column_spacing = 5;

            for(int i=0; i<9; i++) {
                Gtk.Button button = new Gtk.Button();
                button.set_size_request(64, 64);
                button.expand = true;
                button.clicked.connect ((source) => {
                    source.sensitive = false;
                });
                attach(button, i%3, i/3, 1, 1);
            }
        }
    }
}

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
                    button.draw.connect((context) => {
                        int width = button.get_allocated_width();
                        int height = button.get_allocated_height();

                        context.set_source_rgba(1, 0, 0, 1);
                        context.arc(width/2, height/2, int.min(width, height) / 2, 0, 2 * Math.PI);
                        context.fill();

                        return true;
                    });
                });
                attach(button, i%3, i/3, 1, 1);
            }
        }
    }
}

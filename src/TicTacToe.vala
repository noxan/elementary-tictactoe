namespace TicTacToe {
    public class Block : Gtk.Button {
        public Block() {
            set_size_request(64, 64);

            expand = true;
            clicked.connect ((source) => {
                source.sensitive = false;
            });
            draw.connect((context) => {
                if(sensitive) {
                    return base.draw(context);
                } else {
                    int width = get_allocated_width();
                    int height = get_allocated_height();

                    context.set_source_rgba(1, 0, 0, 1);
                    context.arc(width/2, height/2, int.min(width, height) / 2, 0, 2 * Math.PI);
                    context.fill();

                    return true;
                }
            });
        }
    }

    public class Board : Gtk.Grid {
        public Board() {
            row_spacing = 5;
            column_spacing = 5;

            for(int i=0; i<9; i++) {
                Block block = new Block();
                attach(block, i%3, i/3, 1, 1);
            }
        }
    }
}

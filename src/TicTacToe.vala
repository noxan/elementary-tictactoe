namespace TicTacToe {
    public enum Player {
        PLAYER1,
        PLAYER2
    }

    public class Block : Gtk.Button {
        private Player player { public get; private set; }

        public Block() {
            set_size_request(64, 64);

            expand = true;
        }

        public void mark(Player player) {
            sensitive = false;
            this.player = player;
        }

        public override bool draw(Cairo.Context context) {
            if(sensitive) {
                return base.draw(context);
            } else {
                int width = get_allocated_width();
                int height = get_allocated_height();

                if(player == Player.PLAYER1) {
                    context.set_source_rgba(1, 0, 0, 1);
                } else {
                    context.set_source_rgba(1, 1, 0, 1);
                }
                context.arc(width/2, height/2, int.min(width, height) / 2, 0, 2 * Math.PI);
                context.fill();

                return true;
            }
        }
    }

    public class Board : Gtk.Grid {
        private Player current_player = Player.PLAYER1;

        public Board() {
            row_spacing = 5;
            column_spacing = 5;

            for(int i=0; i<9; i++) {
                Block block = new Block();
                block.clicked.connect ((source) => {
                    block.mark(current_player);
                    change_current_player();
                });
                attach(block, i%3, i/3, 1, 1);
            }
        }

        private void change_current_player() {
            if(current_player == Player.PLAYER1) {
                current_player = Player.PLAYER2;
            } else {
                current_player = Player.PLAYER1;
            }
        }
    }
}

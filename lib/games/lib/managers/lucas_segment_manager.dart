import 'package:flame/components.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/actors/maromba_inimigo.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/creatina.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/plataforma_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/whey.dart';

class Block {
  // gridPosition position is always segment based X,Y.
  // 0,0 is the bottom left corner.
  // 10,10 is the upper right corner.
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [
  segment0,
  segment1,
  segment2,
  segment3,
  segment4,
];

final segment0 = [
  Block(Vector2(0, 0), ChaoBloco),
  Block(Vector2(1, 0), ChaoBloco),
  Block(Vector2(2, 0), ChaoBloco),
  Block(Vector2(3, 0), ChaoBloco),
  Block(Vector2(4, 0), ChaoBloco),
  Block(Vector2(5, 0), ChaoBloco),
  Block(Vector2(5, -0.8), MarombaInimigo),
  Block(Vector2(5, 3), PlataformaBloco),
  Block(Vector2(6, 0), ChaoBloco),
  Block(Vector2(6, 3), PlataformaBloco),
  Block(Vector2(6, 5), Creatina),
  Block(Vector2(7, 0), ChaoBloco),
  Block(Vector2(7, 3), PlataformaBloco),
  Block(Vector2(8, 0), ChaoBloco),
  Block(Vector2(8, 3), PlataformaBloco),
  Block(Vector2(9, 0), ChaoBloco),
];

final segment1 = [
  Block(Vector2(0, 0), ChaoBloco),
  Block(Vector2(1, 0), ChaoBloco),
  Block(Vector2(1, 1), PlataformaBloco),
  Block(Vector2(1, 2), PlataformaBloco),
  Block(Vector2(1, 3), PlataformaBloco),
  Block(Vector2(2, 6), PlataformaBloco),
  Block(Vector2(3, 6), PlataformaBloco),
  Block(Vector2(6, 5), PlataformaBloco),
  Block(Vector2(7, 5), PlataformaBloco),
  Block(Vector2(7, 7), Whey),
  Block(Vector2(8, 0), ChaoBloco),
  Block(Vector2(8, 1), PlataformaBloco),
  Block(Vector2(8, 5), PlataformaBloco),
  Block(Vector2(7.7, 2.08), MarombaInimigo),
  Block(Vector2(9, 0), ChaoBloco),
];

final segment2 = [
  Block(Vector2(0, 0), ChaoBloco),
  Block(Vector2(1, 0), ChaoBloco),
  Block(Vector2(2, 0), ChaoBloco),
  Block(Vector2(3, 0), ChaoBloco),
  Block(Vector2(3, 3), PlataformaBloco),
  Block(Vector2(4, 0), ChaoBloco),
  Block(Vector2(4, 3), PlataformaBloco),
  Block(Vector2(5, 0), ChaoBloco),
  Block(Vector2(5, 3), PlataformaBloco),
  Block(Vector2(4.5, 0.9), MarombaInimigo),
  Block(Vector2(6, 0), ChaoBloco),
  Block(Vector2(6, 3), PlataformaBloco),
  Block(Vector2(6, 4), PlataformaBloco),
  Block(Vector2(6, 5), PlataformaBloco),
  Block(Vector2(6, 7), Whey),
  Block(Vector2(7, 0), ChaoBloco),
  Block(Vector2(8, 0), ChaoBloco),
  Block(Vector2(9, 0), ChaoBloco),
];

final segment3 = [
  Block(Vector2(0, 0), ChaoBloco),
  Block(Vector2(1, 0), ChaoBloco),
  Block(Vector2(1, -0.8), MarombaInimigo),
  Block(Vector2(2, 0), ChaoBloco),
  Block(Vector2(2, 1), PlataformaBloco),
  Block(Vector2(2, 2), PlataformaBloco),
  Block(Vector2(4, 4), PlataformaBloco),
  Block(Vector2(6, 6), PlataformaBloco),
  Block(Vector2(7, 0), ChaoBloco),
  Block(Vector2(7, 1), PlataformaBloco),
  Block(Vector2(8, 0), ChaoBloco),
  Block(Vector2(8, 8), Creatina),
  Block(Vector2(9, 0), ChaoBloco),
];

final segment4 = [
  Block(Vector2(0, 0), ChaoBloco),
  Block(Vector2(1, 0), ChaoBloco),
  Block(Vector2(2, 0), ChaoBloco),
  Block(Vector2(2, 3), PlataformaBloco),
  Block(Vector2(3, 0), ChaoBloco),
  Block(Vector2(3, -0.8), MarombaInimigo),
  Block(Vector2(3, 3), PlataformaBloco),
  Block(Vector2(4, 0), ChaoBloco),
  Block(Vector2(5, 0), ChaoBloco),
  Block(Vector2(5, 5), PlataformaBloco),
  Block(Vector2(6, 0), ChaoBloco),
  Block(Vector2(6, 5), PlataformaBloco),
  Block(Vector2(6, 7), Whey),
  Block(Vector2(7, 0), ChaoBloco),
  Block(Vector2(8, 0), ChaoBloco),
  Block(Vector2(8, 3), PlataformaBloco),
  Block(Vector2(9, 0), ChaoBloco),
  Block(Vector2(9, -0.8), MarombaInimigo),
  Block(Vector2(9, 3), PlataformaBloco),
];

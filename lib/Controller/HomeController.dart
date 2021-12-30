import 'package:mobappdev_coursework_1_part_b/Model/TileCard.dart';

class HomeController {

  //This method returns a Tile Card object
  TileCard addTileCard(String codeDialog){
    return TileCard(codeDialog,false);
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/consts/consts.dart';
import 'package:flutter/material.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  getTypeColor(nome) {
    if (types[0] == nome) {
      return Color.fromARGB(80, 255, 255, 255);
    } else {
      return AppConsts.getColorType(type: nome);
    }
  }

  Widget setTipos() {
    List<Widget> lista = [];
    types.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: getTypeColor(nome)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  const PokeItem(
      {Key key, this.name, this.index, this.color, this.num, this.types})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: AppConsts.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 0),
                    child: setTipos(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AppConsts.whitePokeball,
                      height: 105,
                      width: 105,
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    color: Colors.transparent,
                  ),
                  height: 100,
                  width: 100,
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

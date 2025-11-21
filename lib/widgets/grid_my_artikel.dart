import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuk_final_sems3/models/artikel_model.dart';
import 'package:uuk_final_sems3/screen/articles/detail_screen.dart';
import 'package:uuk_final_sems3/screen/articles/form_screen.dart';

class GridMyArtikel extends StatelessWidget {
  
  final List<Artikel> artikelList;
  const GridMyArtikel({super.key, required this.artikelList});

  @override
  Widget build(BuildContext context) {
    const baseUrl = 'https://api-pariwisata.rakryan.id';
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 1.3,
      ),
      itemCount: artikelList.length,
      itemBuilder: (context, index) {
        final artikel = artikelList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(detailArtikel: artikel),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$baseUrl/${artikel.image}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
              //end image
              //title
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      artikel.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleFormScreen(
                            isEdit: true,
                            artikelId: artikel.id,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.blue,
                    iconSize: 17,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_rounded),
                    color: Colors.red,
                    iconSize: 17,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
              //end title
              //description
              Text(
                artikel.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              //end description
            ],
          ),
        );
      },
    );
  }
}

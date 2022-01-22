import 'package:flutter/material.dart';
import 'package:job_task/model/model.dart';
import 'package:job_task/utils/detailsPage.dart';

class PropartyList extends StatelessWidget {
  final List<MarsModel> list;
  PropartyList(this.list);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemCount: list.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    Details(list[index].imgSrc!,list[index].type!,list[index].price!)),
              );
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  list[index].imgSrc!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
    );
  }
}

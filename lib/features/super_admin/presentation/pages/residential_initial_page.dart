import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../residential_complex_housing/presentation/changes_notifier/residential_complex_housing_notifier.dart';

class ResidentialInitialPage extends StatelessWidget {
  const ResidentialInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final residentialComplexHousingNotifier = Provider.of<ResidentialComplexHousingNotifier>(context);
    return Scaffold(
      body: FutureBuilder(
        future: residentialComplexHousingNotifier.getResidentialComplexHousingList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: residentialComplexHousingNotifier.residentialComplexHousingList.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: ListTile(
                  title: Text('Conjunto: ${residentialComplexHousingNotifier.residentialComplexHousingList[index].name}'),
                  subtitle: Text('Dirección: ${residentialComplexHousingNotifier.residentialComplexHousingList[index].address}'),
                  leading: const Icon(Icons.account_balance_outlined),
                  onTap: () {
                    residentialComplexHousingNotifier.selectedResidentialComplex = residentialComplexHousingNotifier.residentialComplexHousingList[index].copy();
                    print('residentialComplexHousingNotifier.selectedResidentialComplex.NAME: ${residentialComplexHousingNotifier.selectedResidentialComplex.name}');
                    print('residentialComplexHousingNotifier.selectedResidentialComplex.ID: ${residentialComplexHousingNotifier.selectedResidentialComplex.id}');
                    //Navigator.pushNamed(context, '/residential_register');
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
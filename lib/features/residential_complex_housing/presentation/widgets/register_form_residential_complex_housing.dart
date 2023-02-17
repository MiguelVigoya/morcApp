import 'package:clean_morc/features/residential_complex_housing/residential_complex_housing_models.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/utils/app_preference.dart';
import '../../../persons/person_models.dart';
import '../../../persons/presentation/changes_notifier/person_notifiers.dart';
import '../../data/repositories/residential_complex_housing_implementation_data.dart';
import '../../residential_complex_housing_changes_notifiers.dart';

class RegisterFormResidentialComplexHousing extends StatelessWidget {

  final BuildContext showDialogContext;

  const RegisterFormResidentialComplexHousing({Key? key, required this.showDialogContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String role = AppPreferences.roleProfile;
    final int id = AppPreferences.idProfile;
    final personNotifier = Provider.of<PersonNotifier>(context);
    final residentialComplexHousingNotifier = Provider.of<ResidentialComplexHousingNotifier>(context);
   // final dataFormRegisterProvider = Provider.of<DataFormRegisterResidentialComplexHousingProvider>(context);
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: personNotifier.getHandlersPersonsName(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Form(
                key: residentialComplexHousingNotifier.formRegisterResidentialComplexHousingKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.07,),
                      const Text(
                        'Nombre del Conjunto', //textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      TextFormField(
                        initialValue: residentialComplexHousingNotifier.residentialComplexHousing.name,
                        onChanged: (value) {
                          residentialComplexHousingNotifier.residentialComplexHousing.name = value;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          hintText: 'Nombre del Conjunto',
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Dirección del Conjunto',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      TextFormField(
                        initialValue: residentialComplexHousingNotifier.residentialComplexHousing.address,
                        onChanged: (value) {
                          residentialComplexHousingNotifier.residentialComplexHousing.address = value;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.data_exploration_outlined),
                          hintText: 'Dirección del Conjunto',
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Administrador del Conjunto',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      DropdownSearch<String>(
                        popupProps: const PopupProps.modalBottomSheet(
                          fit: FlexFit.loose,
                          modalBottomSheetProps: ModalBottomSheetProps(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,),
                        ),

                        items: snapshot.data,
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            prefixIcon: Icon(Icons.home),
                            hintText: "Administrador del Conjunto",
                          ),

                        ),
                        onChanged: (value){
                          if(role == 'SUPER_ADMIN'){
                            for( UserModel a in personNotifier.handlersPersons){
                              if(value == a.name){
                                residentialComplexHousingNotifier.residentialComplexHousing.personIds?.clear();
                                residentialComplexHousingNotifier.residentialComplexHousing.personIds?.add(a.id);
                              }
                            }
                          }else if(role == 'HANDLE_COMPLEX_HOUSING'){
                            residentialComplexHousingNotifier.residentialComplexHousing.personIds?.clear();
                            residentialComplexHousingNotifier.residentialComplexHousing.personIds?.add(id);
                          }
                        },
                      ),

                      const SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: ()  async {
                         // Navigator.of(showDialogContext).pop();

                         final bool isCreate = await residentialComplexHousingNotifier.createResidentialComplexHousing();
                          if(isCreate){
                            Navigator.of(showDialogContext).pop();
                          }
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Registrar Conjunto'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.arrow_forward_rounded),
                          ],
                        ),
                      )

                    ]
                )
            );
          }else{
            return const Center(
                child: CircularProgressIndicator());
          }
        }
    );
  }
}

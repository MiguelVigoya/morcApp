import 'package:clean_morc/core/common/theme.dart';
import 'package:clean_morc/features/super_admin/presentation/changes_notifier/state_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/router/routes.dart';
import '../../../../core/presentation/change_notifier/preferences_user_satate_app.dart';
import '../../../residential_complex_housing/residential_complex_housing_widgets.dart';
import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../widgets/super_admin_widgets.dart';

class DashboardSuperAdmin extends StatelessWidget {
  const DashboardSuperAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<PreferenceUserStateApp>(context);
    final stateNavigationBar = Provider.of<StateNavigationBar>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // TODO: CAMBIAR LAS PREFERENCIAS DE USUARIO DE LA APP Y USAR LACLASE ESTATICA APP PREFERENCE
              stateAuth.deleteAllData();
              Navigator.pushReplacementNamed(context, Routes.checkAuth);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Dashboard Super Admin'),
      ),
      body: PageView(
          controller: stateNavigationBar.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            stateNavigationBar.selectedPage = index;
          },
          children: const [
            ResidentialInitialPage(),
            PersonInitialPage(),
            SettingInitialPage(),
          ]),
      bottomNavigationBar: CustomNavigationBarSuperAdmin(
        listBottomsNav: bottomNAvs,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: 'title',
            transitionBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) =>
                Center(
                    child: Container(
                      height: 620,
                      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Scaffold(
                        backgroundColor: MorcColors.transparent,
                        body: Stack(
                          //clipBehavior: Clip.none,
                          children: [
                            Column(
                              children: [

                                 const Padding(
                                  padding: EdgeInsets.only(top: 16, left: 14),
                                  child: Text(
                                      'title',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ),
                                RegisterFormResidentialComplexHousing(showDialogContext: context,),
                              ],
                            ),
                             Positioned(
                              child: GestureDetector(
                                onTap: () {
                                 print('object');
                                },
                                child: const Align(
                                  alignment: Alignment(1.2, -1.15),
                                  //child: InkWell(
                                  //onTap: () => Navigator.of(context, rootNavigator: true).pop()
                                  //stateNavigationBar.isBarrierDismissible = true;
                                  //Future.delayed(const Duration(milliseconds: 2000), () {
                                  //stateNavigationBar.isBarrierDismissible = false;
                                  //}
                                  //);
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: MorcColors.orange50,
                                    child:Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),

                                  ),

                                  // )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          );
          //customShowDialog(
             // context: context,
              //title: 'Registre un nuevo conjunto',
            //  child: RegisterFormResidentialComplexHousing(showDialogContext: context,));
          //_buildShowGeneralDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<Object?> customShowDialog(
      {required BuildContext context,
      required String title,
      required Widget child}) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: title,
      transitionBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) =>
          Center(
              child: Container(
        height: 620,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Scaffold(
          backgroundColor: MorcColors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 14),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  child,
                ],
              ),
               const Positioned(
                    child: Align(
                  alignment: Alignment(1.2, -1.15),
                  //child: InkWell(
                  //onTap: () => Navigator.of(context, rootNavigator: true).pop()
                  //stateNavigationBar.isBarrierDismissible = true;
                  //Future.delayed(const Duration(milliseconds: 2000), () {
                  //stateNavigationBar.isBarrierDismissible = false;
                  //}
                  //);
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: MorcColors.orange50,
                      child:Icon(
                          Icons.close,
                          color: Colors.white,
                        ),

                  ),

                  // )
              ),
                    ),
            ],
          ),
        ),
      )),
    );
  }
}

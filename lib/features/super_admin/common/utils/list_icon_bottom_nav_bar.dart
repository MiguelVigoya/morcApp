

import '../../super_admin_entities.dart';


List<Map<String, String>> bottomMenuBarMap = [
 {
'artboard': 'HOME',
'stateMachineName': 'HOME_interactivity',
'title': 'Residentials',
'src': '',
},
 {
  'artboard': 'USER',
  'stateMachineName': 'USER_Interactivity',
  'title': 'Persons',
  'src': '',
 },{
  'artboard': 'SETTINGS',
  'stateMachineName': 'SETTINGS_Interactivity',
  'title': 'Settings',
  'src': '',
 }

];



 List<BottomNavBarEntity> bottomNAvs = [
  BottomNavBarEntity(
   isDark: false,
      artboard: 'HOME',
      stateMachineName: 'HOME_interactivity',
      title: 'Residentials'),
  BottomNavBarEntity(
      isDark: false,
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
      title: 'Persons'),
/*
  BottomNavBarEntity(
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
      title: 'Search'),
  */
  BottomNavBarEntity(
      isDark: false,
      artboard: 'SETTINGS',
      stateMachineName: 'SETTINGS_Interactivity',
      title: 'Settings'),
];
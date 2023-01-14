import 'package:final_project/homeScreen.dart';
import 'package:final_project/smAura.dart';
import './Shops.dart';
import 'Megamall.dart';
import './smAura.dart';

class Mall {
  final String name;
  final String location;
  final String operating_hours;
  final String mall_image;
  final FloorPlan floorPlan;
  Mall(
      {required this.name,
      required this.location,
      required this.operating_hours,
      required this.mall_image,
      required this.floorPlan});
}

List<Mall> allMalls = [
  //0
  Mall(
      name: 'Ali Mall',
      location: 'P. Tuazon Blvd, Cubao, Quezon City, Metro Manila',
      operating_hours: '11AM - 9PM',
      mall_image: 'assets/ALIMALL_img.png',
      floorPlan: floorplan1),
  //1
  Mall(
      name: 'Gateway Mall',
      location: 'General Aguinaldo Ave, Cubao, Quezon City, Metro Manila',
      operating_hours: '10AM - 9PM',
      mall_image: 'assets/GATEWAY_img.png',
      floorPlan: floorplan2),
  //2
  Mall(
      name: 'Mall of Asia',
      location: 'G/F, Main Mall, Seaside Blvd, 123, Pasay,Metro Manila',
      operating_hours: '10AM - 10PM',
      mall_image: 'assets/MOA_img.png',
      floorPlan: floorplan2),
  //3
  Mall(
      name: 'Market! Market!',
      location: 'McKinley Pkwy, Taguig, Metro Manila',
      operating_hours: '10AM - 10PM',
      mall_image: 'assets/MARKETMARKET_img.png',
      floorPlan: floorplan1),
  //4
  Mall(
      name: 'Newport Mall',
      location: 'Newport Blvd, Pasay, Metro Manila',
      operating_hours: '11AM - 11PM',
      mall_image: 'assets/NEWPORT_MALL_img.png',
      floorPlan: floorplan2),
  //5
  Mall(
      name: 'SM Aura',
      location: '26th Street, McKinley Pkwy, Taguig, Metro Manila',
      operating_hours: '10AM - 11PM',
      mall_image: 'assets/SM_AURA_img.png',
      floorPlan: floorplan3),
  //6
  Mall(
      name: 'SM City East Ortigas',
      location: 'Ortigas Ave Ext, Pasig, Metro Manila',
      operating_hours: '10AM - 9PM',
      mall_image: 'assets/SM_CITY_EAST_ORTIGAS_img.png',
      floorPlan: floorplan2),
  //7
  Mall(
      name: 'SM Megamall',
      location: 'EDSA, Ortigas Center, Mandaluyong,Metro Manila',
      operating_hours: '10AM - 10PM',
      mall_image: 'assets/SM_MEGAMALL_img.png',
      floorPlan: floorplan2),
  //8
  Mall(
      name: 'Tiendesitas',
      location: '5 Las Fiestas, Pasig, Metro Manila',
      operating_hours: '10AM - 9PM',
      mall_image: 'assets/TIENDESITAS_img.png',
      floorPlan: floorplan1),
  //9
  Mall(
      name: 'Uptown Mall BGC',
      location: '9th Ave, Taguig, Metro Manila',
      operating_hours: '10AM - 10PM',
      mall_image: 'assets/UPTOWN_MALL_img.png',
      floorPlan: floorplan3),
  //10
  Mall(
      name: 'Vista Mall Taguig',
      location: 'Bagong Calzada, Taguig, Metro Manila',
      operating_hours: '10AM - 9PM',
      mall_image: 'assets/VISTAMALL_img.png',
      floorPlan: floorplan2),
];

List<Mall> malls_near_makati = [
  allMalls[3],
  allMalls[5],
  allMalls[9],
];

List<Mall> malls_near_taguig = [
  allMalls[5],
  allMalls[9],
  allMalls[10],
];

List<Mall> malls_near_pasig = [
  allMalls[8],
  allMalls[6],
  allMalls[10],
];

List<Mall> malls_near_pasay = [
  allMalls[2],
  allMalls[4],
  allMalls[7],
];

List<Mall> malls_near_quezon = [
  allMalls[0],
  allMalls[1],
  allMalls[6],
];

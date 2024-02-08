import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texnomart/data/blocs/yangitovar_bloc/yangitovar_bloc.dart';
import 'package:texnomart/data/models/special_model.dart';
import '../../data/blocs/category_bloc/category_bloc.dart';
import '../../data/blocs/marka_bloc/marka_bloc.dart';
import '../../data/blocs/slider_bloc/slider_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/blocs/xit_bloc/xit_bloc.dart';
import '../../data/models/category_model.dart';
import '../../data/models/model.dart';
import '../../data/models/xit_model.dart';
import '../../data/models/yangitovarlar_model.dart';
import '../../data/servis/network_servis.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    SliderBloc sliderBloc = SliderBloc(NetworkService(Dio()));
    MarkaBloc markaBloc = MarkaBloc(NetworkService(Dio()));
    CategoryBloc categoryBloc=CategoryBloc(NetworkService(Dio()));
    YangitovarBloc yangitovarBloc=YangitovarBloc(NetworkService(Dio()));
    XitBloc xitBloc=XitBloc(NetworkService(Dio()));
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderBloc>(create: (context) => sliderBloc),
        BlocProvider<MarkaBloc>(create: (context) => markaBloc),
      ],
      child: SingleChildScrollView(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.yellow.shade700,
                floating: false,
                pinned: false,
                expandedHeight: 30,
                title: Center(
                  child: Text(
                    "texnomart*",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverAppBar(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  borderSide: BorderSide.none,
                ),
                floating: false,
                pinned: true,
                backgroundColor: Colors.yellow[700],
                title: Container(
                  height: 45,
                  child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        labelText: "Men sotib olmoqchiman",
                        prefixIcon: Icon(Icons.search),
                        suffix: Icon(Icons.mic),
                        filled: true,
                        fillColor: Colors.white,
                      )),
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: true,
                child: Column(
                  children: [
                    BlocBuilder<SliderBloc, SliderState>(
                      bloc: sliderBloc..add(SliderLoadedEvent()),
                      builder: (context, state) {
                        if (state is SliderSucsess) {
                          List<DataData>? dataList = state.model.data?.data;
                          return Container(
                            child: CarouselSlider.builder(
                              itemCount: dataList?.length ?? 0,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${dataList?[itemIndex].imageMobileWeb}',
        
                                ),
                              ),
                              options: CarouselOptions(
                                height: 230,
                                aspectRatio: 16 / 8,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.5,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          );
                        } else if (state is SliderFailur) {
                          return Text("Error");
                        } else {
                          return Container();
                        }
                      },
                    ),
                    BlocBuilder<MarkaBloc, MarkaState>(
                      bloc: markaBloc..add(MarkaLoadedEvent()),
                      builder: (context, state) {
                        if (state is MarkaSucsess) {
                          List<DataData1>? dataList1 = state.specialModel.data?.data;
                          return InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context,'/special_page');
                            },
                            child: Container(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dataList1?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  String? imageUrl = dataList1?[index].image;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      width: 80,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                       boxShadow: [
                                         BoxShadow(
                                           color: Colors.grey.withOpacity(0.2),
                                           spreadRadius: 1,
                                           blurRadius: 1,
                                           offset: Offset(0, 2),
                                         ),
                                       ],
                                        color: Colors.white,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl ?? "",
                                        width: 35,
                                        height: 35,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else if (state is MarkaFailur) {
                          return Text("Error");
                        }
                        return Container();
                      },
                    ),SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("   Kategoriyalar",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                       TextButton(onPressed: (){
                         Navigator.pushReplacementNamed(context,'/katalog_page');
                       }, child: Text("barchasi>",style: TextStyle(fontSize: 16,color: Colors.grey),))
                      ],
                    ),
                    BlocBuilder<CategoryBloc, CategoryState>(
                      bloc: categoryBloc..add(CategoryLoadedEvent()),
                      builder: (context, state) {
                        if(state is CategorySucsess){
                          List<DataData2>? dataList2 = state.caregoryModel.data?.data;
                          return Container(
                            height:150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dataList2?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                String? imageUrl = dataList2?[index].image;
                                String? title = dataList2?[index].title;
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
        
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 10,width:100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                   blurRadius: 2,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            child: SvgPicture.network(
                                              imageUrl ?? "",
        
                                            ),
                                          ),
                                        ),
        
                                        SizedBox(height: 8),
                                        Text(
                                          title ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
        
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if(state is CategoryFailur){
                          return Text("Error");
                        } else {
                          return Container(); // Return empty container if state is not loaded or failure
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("   Yangi tovarlar",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                         Text("",style: TextStyle(fontSize: 16,color: Colors.grey),)
                      ],
                    ),
                    BlocBuilder<YangitovarBloc, YangitovarState>(
                      bloc: yangitovarBloc..add(YangiTovarLoadedEvent("new_products")),
                      builder: (context, state) {
                        if (state is YangitovarSucsess) {
                          List<DataData3>? dataList3 = state.yangiTovarlarModel.data?.data;
                          return Expanded(
                            child: Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dataList3?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  String? imageUrl = dataList3?[index].image;
                                  String? name = dataList3?[index].name;
                                  String? price = dataList3?[index].axiomMonthlyPrice;
                                  int? sela = dataList3?[index].salePrice ;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      width: 100,
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: imageUrl ?? "",
                                            width: 120,
                                            height: 120,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            name ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Container(
                                            height: 20,
                                            width:80,decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),color: Colors.grey[200]
                                          ),child: Center(child: Text("${price??""}")),
                                          ),
                                          Row(
                                            children: [
                                              Text("${sela??""}"),Text("so'm")
                                            ],
                                          )
        
        
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else if (state is YangitovarFailur) {
                          return Text("Error");
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
        
                    BlocBuilder<XitBloc, XitState>(
                      bloc: xitBloc..add(XitLoadedEvent("hit_products")),
                      builder: (context, state) {
                        if(state is XitSucsess ){
                          List<DataData4>? dataList4 = state.xitModel.data?.data;
                          return Container(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dataList4?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                String? imageUrl = dataList4?[index].image;
                                String? name = dataList4?[index].name;
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    width: 50,
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: imageUrl ?? "",
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          name ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is XitFailur) {
                          return Text("Error");
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    )
        
        
        
        
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

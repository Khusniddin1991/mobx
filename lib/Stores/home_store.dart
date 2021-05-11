import 'package:flutter/cupertino.dart';
import 'package:fluttermobx/Controller/Network.dart';
import 'package:fluttermobx/Model/Post.dart';
import 'package:mobx/mobx.dart';
// import 'package:patterns_mobx/model/post_model.dart';
// import 'package:patterns_mobx/services/http_service.dart';


part '../Stores/home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable bool isLoading = false;

  @observable List<Post> items = new List();
  Future apiPostList() async {
  isLoading = true;


  var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
  if (response != null) {
  items = Network.parsePostList(response);
  } else {
  items = new List();
  }

  isLoading = false;
  }

  Future<bool> apiPostDelete(Post post) async {
  isLoading = true;
  var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

  isLoading = false;
 return response != null;
  }
  void sendApiToServer(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

  String title=titleController.text.trim();
  String body=bodyController.text.trim();
  var time=DateTime.now().microsecond;
  print(time);
  print(body);
  if(title.isEmpty&&body.isEmpty){
  return;
  }
  Post posts=Post(title: title,body:body ,userId:1);
  add(posts,context);
  }
  void add(Post post,BuildContext context)async {
  isLoading=true;
  var res=await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
  print(res);
  try{
  if(res==null){
  isLoading=false;
  Navigator.of(context).pop({"data":"the result"});
  }
  }catch(e){
  print(e);
  }

  }

  void sendApiToServers(TextEditingController titleController,TextEditingController bodyController,BuildContext context)async {

  String title=titleController.text.trim();
  String body=bodyController.text.trim();

  var time=DateTime.now().microsecond;
  print(time);
  print(body);
  if(title.isEmpty&&body.isEmpty){
  return;
  }
  Post posts=Post(title: title,body:body ,userId:1,id: 1);
  add(posts,context);
  }
  void adds(Post post,BuildContext context)async {

  isLoading=true;

  var res=await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post));
  print(res);
  try{
  if(res==null){

  isLoading=false;

  Navigator.of(context).pop({"data":"the result"});
  }
  }catch(e){
  print(e);
  }

  }

  }


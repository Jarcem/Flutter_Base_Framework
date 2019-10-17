### json序列化使用方法
1. 定义实体类  如：类名为：```Star```  文件名为 ```star.dart```
2. 在类中加上 ```part 'star.g.dart'```;
4. 写构造方法
5. 在类上加上注解  ```@JsonSerializable()```
6. 在终端运行 ```flutter packages pub run build_runner build```
7. [官方文档](https://pub.dartlang.org/packages/json_serializable#-readme-tab-)

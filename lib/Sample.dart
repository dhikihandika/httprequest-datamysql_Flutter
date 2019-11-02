//=================================== Github Array Class =============================================//

class Github {
  String username;
  int repsitory;

Github({this.username, this.repsitory});

@override 
String toString() {
    // 
  return 'Github{username: $username, repository: $repsitory}';
  }

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(
      username: json["username"],
      repsitory: json["repository"]
    );
  }
}

//==================== Article with proprty: Array and value:JSON Object ============================//
//sample.json file located in assets package
class Articles {
  int id;
  String title;
  String subtitle;
  
  Articles({this.id, this.title, this.subtitle});

  @override
  String toString() {
  return 'This MyArticles: {id: $id, title: $title, subtitle: $subtitle}';
  }

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['id'],
      title: json["title"],
      subtitle: json["subtitle"] 
    );
  }
}



//==================================================================================================//
//======================================== Major Class =============================================//
//==================================================================================================//
class Sample {
  String name;                                                // Variable
  int age;
  String email;
  List<String> hobby;
  Github github;
  List<Articles> articles;

  Sample({this.name, this.age, this.email, this.hobby, this.github, this.articles});

  @override 
  String toString() {                                         // Constructor
    // TODO: implement toStrin
    return 'Introduce myself: {name: $name, age: $age, email: $email, hobby: $hobby, gihub: $github, articles: $articles}';
  }

  // fromJson() its Named Constructor to change json data to mode class
  factory Sample.fromJson(Map<String, dynamic> json) {  // Dynamic type because we are don't konw about what data type value in json 
    
    // Maping article list
    var listArticles = json["articles"] as List;
    var iterableArticles = listArticles.map((articles)
    {
      return Articles.fromJson(articles);
    });

    var articles = List<Articles>.from(iterableArticles);
    
    return Sample(
      name: json['name'],
      age: json['age'],
      email: json['email'],
      hobby: List<String>.from(json['hobby']),
      github: Github.fromJson(json['github']),
      articles: articles,
    );
  }
}
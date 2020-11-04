import 'package:flutter/material.dart';
import 'package:githubissuebrowser/services/issues.dart';
import 'package:http/http.dart' as http;

class GetIssues{
   getIssues(int limit, int pageNumber) async{
     try {

       var url = "https://api.github.com/repos/walmartlabs/thorax/issues?per_page=$limit&page=$pageNumber";
       print("page number: " + pageNumber.toString());
       var response = await http.get(url);

       if (response.statusCode == 200) {
         final List <Issues> issues = issuesFromJson(response.body);
         return issues;
       } else {

         return List<Issues>();
       }
     }catch(e){

       return List<Issues> ();
     }
  }
}
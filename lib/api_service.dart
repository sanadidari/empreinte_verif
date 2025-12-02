import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://sanadidari.com/testftp/test_empreinte/api";

  static Future<dynamic> registerEmployee(String nom, String token) async {
    final url = Uri.parse("$baseUrl/register_employee.php");

    try {
      final response = await http.post(
        url,
        body: {
          "nom": nom,
          "token": token,
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }

  static Future<dynamic> authEmployee(String token) async {
    final url = Uri.parse("$baseUrl/auth_employee.php");

    try {
      final response = await http.post(
        url,
        body: {"token": token},
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }

  static Future<dynamic> getProjects(int employeeId) async {
    final url = Uri.parse("$baseUrl/get_projects.php?employee_id=$employeeId");

    try {
      final response = await http.get(url);

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result {
  final double score;
  final String message;
  final String value;

  IconData getIcon() {
    if (score >= 0.8)
      return Icons.sentiment_very_satisfied;
    else if (score > 0.65)
      return Icons.sentiment_satisfied;
    else if (score <= 0.2)
      return Icons.sentiment_very_dissatisfied;
    else if (score < 0.35)
      return Icons.sentiment_dissatisfied;
    else
      return Icons.sentiment_neutral;
  }

  Result({this.score, this.message, this.value});

  factory Result.fromJson(dynamic json) {
    return Result(
        score: json["score"] + 0.0, message: json["message"], value: json["value"]);
  }

  Map<String, dynamic> toJson() {
    return {"score": score, "message": message, "value": value};
  }
}

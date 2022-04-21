import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

String movePlayer() {
  print("Выбери Камень, Бумага, или Ножницы");
  String selection = stdin.readLineSync()!.toUpperCase();
  String? playerSelection;

  switch (selection) {
    case "К":
      debugPrint("Камень");
      playerSelection = "Камень";
      break;
    case "Б":
      debugPrint("Бумага");
      playerSelection = "Бумага";

      break;
    case "Н":
      debugPrint("Ножницы");
      playerSelection = "Ножницы";

      break;
    default:
      debugPrint("Quit");
      break;
  }
  return playerSelection!;
}

String moveComputer() {
  Random rand = new Random();
  int move = rand.nextInt(3);
  String? computerSelection;

  switch (move) {
    case 0:
      debugPrint("Камень");
      computerSelection = "Камень";
      break;
    case 1:
      debugPrint("Бумага");
      computerSelection = "Бумага";
      break;
    case 2:
      debugPrint("Ножницы");
      computerSelection = "Ножницы";
      break;
    default:
      break;
  }
  return computerSelection!;
}

String whoWins(String playerMove, String computerMove) {
  if (playerMove == computerMove) {
    debugPrint("Играть");
    return "Играть";
  } else if (playerMove == "Камень" && computerMove == "Ножницы") {
    debugPrint("Ты победил!");
    return "Ты победил!";
  } else if (playerMove == "Ножницы" && computerMove == "Бумага") {
    debugPrint("Ты победил!");
    return "Ты победил!";
  } else if (playerMove == "Бумага" && computerMove == "Камень") {
    debugPrint("Ты победил!");
    return "Ты победил!";
  } else {
    debugPrint("Компьютер победил!");
    return "Компьютер победил!";
  }
}

void main() {
  while (true) {
    debugPrint("Камень, Ножницы, Бумага!");
    String playerMove = movePlayer();

    if (playerMove == "Quit") {
      return;
    }

    debugPrint("Твой ход $playerMove");
    String computerMove = moveComputer();
    debugPrint("Ход компьютера $computerMove");
    debugPrint(whoWins(playerMove, computerMove));
  }
}
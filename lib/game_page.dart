import 'dart:io';
import 'dart:math';

import 'users.dart';
import 'scoreboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GamePage extends StatefulWidget {
  final User user;
  GamePage(this.user);

  @override
  _GamePageState createState() => _GamePageState(this.user);
}

class _GamePageState extends State<GamePage> {
  User user;
  _GamePageState(this.user);
  String? playerSelection = "N";
  String? gameResult = "Нажми любую кнопку";
  String? computerSelection = "N";
  int playerWins = 0;
  int computerWins = 0;

  @override
  Widget build(BuildContext context) {
    print(_images['Камень']);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _process(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rockButton(context),
              paperButton(context),
              scissorsButton(context),
            ],
          )
        ],
      ),
    );
  }

  TextButton scoreBoard(BuildContext context) {
    return TextButton(
      child: Text("Ножницы"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScoreBoard(playerWins, computerWins)));
      },
    );
  }

  ElevatedButton scissorsButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Ножницы";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/scissors.png"),
        width: 90,
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton paperButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Бумага";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: Image(
        image: AssetImage("assets/images/paper.png"),
        width: 90,
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton rockButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          fixedSize: Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Камень";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreBoard(playerWins, computerWins)));
        }
      },
      child: image("assets/images/rock.png"),
    );
  }

  Image image(String imageAddress) {
    return Image(
      image: AssetImage(imageAddress),
      fit: BoxFit.cover,
    );
  }

  String computerMove() {
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
      playerWins++;

      return "Ты победил!";
    } else if (playerMove == "Бумага" && computerMove == "Камень") {
      debugPrint("Ты победил!");
      playerWins++;

      return "Ты победил!";
    } else if (playerMove == "Ножницы" && computerMove == "Бумага") {
      debugPrint("Ты победил!");
      playerWins++;

      return "Ты победил!";
    } else {
      debugPrint("Компьютер победил!");
      computerWins++;
      return "Компьютер победил!";
    }
  }

  String movePlayer(String? selection) {
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

  Column _process() {
    return Column(
      children: [
        Text(
          "Комьпьютер",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14.0,),
        _getImage(_images[computerSelection].toString()),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Результат: $gameResult",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        RotatedBox(
            quarterTurns: 2,
            child: _getImage(_images[playerSelection].toString())),
        Text(user.username!, style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );
  }

  Map<String, String> _images = {
    "Камень": "assets/images/rock.png",
    "Бумага": "assets/images/paper.png",
    "Ножницы": "assets/images/scissors.png",
    "N": "assets/images/main.png",
  };

  Image _getImage(String image) => Image.asset(
    image,
    height: 100,
    width: 100,
  );
}

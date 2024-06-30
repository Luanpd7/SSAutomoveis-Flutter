import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeLight() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(255, 87, 87, 1.0), //cor do appBar
      hintColor: Colors.white,
      canvasColor:
          const Color.fromRGBO(241, 242, 233, 1.0), //Cor da tela de fundo
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            //App bar
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'inter.ttf'),
        titleSmall: TextStyle(
            //home page
            fontSize: 20,
            color: Color.fromRGBO(134, 128, 128, 1.0),
            fontFamily: 'inter.ttf'),
        titleLarge: TextStyle(
            //configuraçoes e label
            fontSize: 17,
            color: Color.fromRGBO(255, 87, 87, 1.0),
            fontFamily: 'inter.ttf'),
        bodyMedium: TextStyle(
            //configuraçoes e label
            fontSize: 17,
            color: Colors.black,
            fontFamily: 'inter.ttf'),
        bodySmall: TextStyle(
            //configuraçoes e label
            fontSize: 17,
            color: Color.fromRGBO(134, 128, 128, 1.0),
            fontFamily: 'inter.ttf'),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color.fromRGBO(134, 128, 128, 1.0),
            fontFamily: 'inter.ttf'),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: Color.fromRGBO(255, 87, 87, 1.0),
            fontFamily: 'inter.ttf'),
        headlineMedium: TextStyle(
            fontSize: 19, color: Colors.black, fontFamily: 'inter.ttf'),
      ),
      /*   iconTheme: const IconThemeData(
          color: Color.fromRGBO(134, 128, 128, 1.0), // Define a cor padrão dos ícones
        ),*/
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //Tema do bottomNavigationBarTheme
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromRGBO(134, 128, 128, 1.0),
      ),
    );
  }

  ThemeData themeDark() {
    return ThemeData(
      brightness: Brightness.dark, // Define que este é um tema escuro
      primaryColor: const Color.fromRGBO(255, 87, 87, 1.0), // Cor do AppBar
      canvasColor:
          const Color.fromRGBO(48, 48, 48, 1.0), // Cor da tela de fundo
      hintColor: Color.fromRGBO(36, 36, 36, 0.988),
      // Ajuste das cores de texto para garantir boa legibilidade no tema escuro
      /*   iconTheme: const IconThemeData(color:Color.fromRGBO(134, 128, 128, 1.0)) ,*/
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          color: Colors.white, // Branco para contraste no AppBar escuro
          fontFamily: 'inter.ttf',
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white70, // Cor clara para textos menores
          fontFamily: 'inter.ttf',
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          color: Color.fromRGBO(255, 87, 87, 1.0), // Mantendo a cor primária
          fontFamily: 'inter.ttf',
        ),
        bodyMedium: TextStyle(
          fontSize: 17,
          color: Colors.white, // Branco para contraste em fundo escuro
          fontFamily: 'inter.ttf',
        ),
        bodySmall: TextStyle(
          fontSize: 17,
          color: Colors.white70, // Cor clara para textos menores
          fontFamily: 'inter.ttf',
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Colors.white70, // Cor clara para textos maiores
          fontFamily: 'inter.ttf',
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: Color.fromRGBO(255, 87, 87, 1.0), // Mantendo a cor primária
          fontFamily: 'inter.ttf',
        ),
        headlineMedium: TextStyle(
          fontSize: 19,
          color: Colors.white, // Branco para contraste em fundo escuro
          fontFamily: 'inter.ttf',
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(36, 36, 36, 0.988), // Fundo escuro
        selectedItemColor: Colors.white, // Branco para itens selecionados
        unselectedItemColor:
            Colors.white70, // Cor clara para itens não selecionados
      ),

      // Outras customizações podem ser adicionadas aqui
    );
  }
}
